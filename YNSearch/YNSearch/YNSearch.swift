//
//  YNSearch.swift
//  YNSearch
//
//  Created by YiSeungyoun on 2017. 4. 11..
//  Copyright © 2017년 SeungyounYi. All rights reserved.
//

import UIKit

class YNSerach: NSObject {
    var pref: UserDefaults!
    
    static let shared: YNSerach = YNSerach()

    override init() {
        pref = UserDefaults.standard
    }
    
    func setDatabase(value: [String]) {
        pref.set(value, forKey: "database")
        pref.synchronize()
    }
    
    func getDatabase() -> [String]? {
        guard let database = pref.object(forKey: "database") as? [String] else { return nil }
        return database
    }
    
    func setCategories(value: [String]) {
        pref.set(value, forKey: "categories")
        pref.synchronize()
    }
    
    func getCategories() -> [String]? {
        guard let categories = pref.object(forKey: "categories") as? [String] else { return nil }
        return categories
    }


    func setSearchHistories(value: [String]) {
        pref.set(value, forKey: "histories")
        pref.synchronize()
    }
    
    func getSearchHistories() -> [String]? {
        guard let histories = pref.object(forKey: "histories") as? [String] else { return nil }
        return histories
    }

}
