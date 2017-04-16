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
    var ynSearchMainView: YNSearchMainView!
    var ynSearchListView: YNSearchListView!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.ynSearchMainView = YNSearchMainView(frame: CGRect(x: 0, y: 0, width: self.frame.width, height: self.frame.height))
        self.ynSearchMainView.delegate = self
        self.addSubview(self.ynSearchMainView)
        
        self.ynSearchListView = YNSearchListView(frame: CGRect(x: 0, y: 0, width: self.frame.width, height: self.frame.height))
        self.ynSearchListView.ynSearchListViewDelegate = self
        self.ynSearchListView.isHidden = true
        self.addSubview(self.ynSearchListView)
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
