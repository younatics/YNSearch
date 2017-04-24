//
//  YNSearchModel.swift
//  YNSearch
//
//  Created by YiSeungyoun on 2017. 4. 21..
//  Copyright © 2017년 SeungyounYi. All rights reserved.
//

import Foundation

open class YNSearchModel {
    public init(value: Any, key: String) {
        self.value = value
        self.key = key
    }
    
    var value: Any?
    var key: String?
    
}
