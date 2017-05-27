//
//  YNSearchView.swift
//  YNSearch
//
//  Created by YiSeungyoun on 2017. 4. 11..
//  Copyright © 2017년 SeungyounYi. All rights reserved.
//

import UIKit

open class YNSearchView: UIView, YNSearchMainViewDelegate, YNSearchListViewDelegate {
    open var delegate: YNSearchDelegate?
    
    open var ynScrollView: UIScrollView!
    open var ynSearchMainView: YNSearchMainView!
    open var ynSearchListView: YNSearchListView!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.ynScrollView = UIScrollView(frame: CGRect(x: 0, y: 0, width: self.frame.width, height: self.frame.height))
        
        self.ynSearchMainView = YNSearchMainView(frame: CGRect(x: 0, y: 0, width: self.frame.width, height: self.frame.height))
        self.ynSearchMainView.delegate = self
        self.ynScrollView.addSubview(self.ynSearchMainView)
        
        self.ynSearchListView = YNSearchListView(frame: CGRect(x: 0, y: 0, width: self.frame.width, height: self.frame.height))
        self.ynSearchListView.ynSearchListViewDelegate = self
        self.ynSearchListView.isHidden = true
        
        if let clearHistoryButton = self.ynSearchMainView.clearHistoryButton {
        self.ynScrollView.contentSize = CGSize(width: self.frame.width, height: clearHistoryButton.frame.origin.y + clearHistoryButton.frame.height + 20)
        } else {
            self.ynScrollView.contentSize = CGSize(width: self.frame.width, height: self.frame.height)
        }
        self.ynScrollView.addSubview(self.ynSearchListView)
        
        self.addSubview(ynScrollView)
        
        
    }
    
    open func ynSearchMainViewSearchHistoryChanged() {
        let size = CGSize(width: self.frame.width, height: self.ynSearchMainView.clearHistoryButton.frame.origin.y + self.ynSearchMainView.clearHistoryButton.frame.height + 20)
        self.ynScrollView.contentSize = size
        self.ynSearchMainView.frame = CGRect(origin: CGPoint(x: 0, y: 0), size: size)
    }
    
    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    open func scrollViewDidScroll() {
        self.delegate?.ynSearchListViewDidScroll()
    }
    
    // MARK: - ynSearchMainView
    open func ynCategoryButtonClicked(text: String) {
        self.delegate?.ynCategoryButtonClicked(text: text)
    }
    
    open func ynSearchHistoryButtonClicked(text: String) {
        self.delegate?.ynSearchHistoryButtonClicked(text: text)
    }
    
    open func ynSearchListViewClicked(key: String) {
        self.delegate?.ynSearchListViewClicked(key: key)
    }
    
    open func ynSearchListViewClicked(object: Any) {
        self.delegate?.ynSearchListViewClicked(object: object)
    }
    
    open func ynSearchListView(_ ynSearchListView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = self.delegate?.ynSearchListView(ynSearchListView, cellForRowAt: indexPath) else { return UITableViewCell() }
        return cell
    }

    open func ynSearchListView(_ ynSearchListView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.delegate?.ynSearchListView(ynSearchListView, didSelectRowAt: indexPath)
    }
    
    open func ynSearchListViewDidScroll() {
        self.delegate?.ynSearchListViewDidScroll()
    }
    




}
