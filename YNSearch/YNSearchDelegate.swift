//
//  YNSearchDelegate.swift
//  YNSearch
//
//  Created by YiSeungyoun on 2017. 4. 16..
//  Copyright © 2017년 SeungyounYi. All rights reserved.
//

import UIKit

public protocol YNSearchDelegate: YNSearchMainViewDelegate, YNSearchListViewDelegate { }

public protocol YNSearchMainViewDelegate {
    func ynCategoryButtonClicked(text: String)
    
    func ynSearchHistoryButtonClicked(text: String)

    func ynSearchMainViewSearchHistoryChanged()

}

public protocol YNSearchListViewDelegate {    
    func ynSearchListViewClicked(key: String)
    
    func ynSearchListViewClicked(object: YNSearchModel)
    
}

public extension YNSearchMainViewDelegate {
    func ynSearchMainViewSearchHistoryChanged() { }
}

public extension YNSearchListViewDelegate {
    func ynSearchListViewClicked(object: Any) { }
}


