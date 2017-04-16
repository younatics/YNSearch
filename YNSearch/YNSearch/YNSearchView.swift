//
//  YNSearchView.swift
//  YNSearch
//
//  Created by YiSeungyoun on 2017. 4. 11..
//  Copyright © 2017년 SeungyounYi. All rights reserved.
//

import UIKit

class YNSearchView: UIView, YNSearchMainViewDelegate, YNSearchListViewDelegate {

    var delegate: YNSearchDelegate?
    
    var ynScrollView: UIScrollView!
    var ynSearchMainView: YNSearchMainView!
    var ynSearchListView: YNSearchListView!
    
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
    
    func ynSearchMainViewSearchHistoryChanged() {
        ynScrollView.contentSize = CGSize(width: self.frame.width, height: self.ynSearchMainView.clearHistoryButton.frame.origin.y + self.ynSearchMainView.clearHistoryButton.frame.height + 20)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    // MARK: - ynSearchMainView
    func ynCategoryButtonClicked(text: String) {
        self.delegate?.ynCategoryButtonClicked(text: text)
    }
    
    func ynSearchHistoryButtonClicked(text: String) {
        self.delegate?.ynSearchHistoryButtonClicked(text: text)
    }
    
    func ynSearchListViewClicked(text: String) {
        self.delegate?.ynSearchListViewClicked(text: text)
    }


}
