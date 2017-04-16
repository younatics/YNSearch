//
//  YNSearchDelegate.swift
//  YNSearch
//
//  Created by YiSeungyoun on 2017. 4. 16..
//  Copyright © 2017년 SeungyounYi. All rights reserved.
//

import UIKit

public protocol YNSearchMainViewDelegate {
    func ynCategoryButtonClicked(_ sender: UIButton)
    
    func ynSearchHistoryButtonClicked(_ sender: UIButton)

}

public protocol YNSearchListViewDelegate {    
//    func ynSearchTextFieldChanged(text: String)
}


