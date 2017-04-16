//
//  YNSearchView.swift
//  YNSearch
//
//  Created by YiSeungyoun on 2017. 4. 11..
//  Copyright © 2017년 SeungyounYi. All rights reserved.
//

import UIKit

class YNSearchView: UIView, YNSearchMainViewDelegate {
    var ynSearchMainView: YNSearchMainView!
    var ynSearchListView: YNSearchListView!

    var ynSearchTextfieldText: String? {
        didSet {
            guard let text = ynSearchTextfieldText else { return }
            self.ynSearchListViewTextChanged(text: text)
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.ynSearchMainView = YNSearchMainView(frame: CGRect(x: 0, y: 0, width: self.frame.width, height: self.frame.height))
        self.ynSearchMainView.delegate = self
        self.addSubview(self.ynSearchMainView)
        
        self.ynSearchListView = YNSearchListView(frame: CGRect(x: 0, y: 0, width: self.frame.width, height: self.frame.height))
        self.ynSearchListView.isHidden = true
        self.addSubview(self.ynSearchListView)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    // MARK: - ynSearchListView
    func ynSearchListViewTextChanged(text: String) {
        self.ynSearchListView.changedText = text

    }
    
    
    // MARK: - ynSearchMainView
    func ynCategoryButtonClicked(_ sender: UIButton) {
        
    }
    
    func ynSearchHistoryButtonClicked(_ sender: UIButton) {
        
    }

}
