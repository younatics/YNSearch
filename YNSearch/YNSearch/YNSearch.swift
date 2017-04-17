//
//  YNSearch.swift
//  YNSearch
//
//  Created by YiSeungyoun on 2017. 4. 11..
//  Copyright © 2017년 SeungyounYi. All rights reserved.
//

import UIKit

class YNSearch: NSObject {
    var pref: UserDefaults!
    
    static let shared: YNSearch = YNSearch()

    override init() {
        pref = UserDefaults.standard
    }
    
    func setDatabase(value: [String]) {
        pref.set(value, forKey: "database")
    }
    
    func getDatabase() -> [String]? {
        guard let database = pref.object(forKey: "database") as? [String] else { return nil }
        return database
    }
    
    func getSearchResult(value: String) -> [String]? {
        guard let searchResult = pref.object(forKey: "database") as? [String] else { return nil }
        let predicate = NSPredicate(format: "SELF CONTAINS[c] %@", value)
        let searchDataSource = searchResult.filter { predicate.evaluate(with: $0) }

        return searchDataSource
    }

    
    func setCategories(value: [String]) {
        pref.set(value, forKey: "categories")
    }
    
    func getCategories() -> [String]? {
        guard let categories = pref.object(forKey: "categories") as? [String] else { return nil }
        return categories
    }


    func setSearchHistories(value: [String]) {
        pref.set(value, forKey: "histories")
    }
    
    func deleteSearchHistories(index: Int) {
        guard var histories = pref.object(forKey: "histories") as? [String] else { return }
        histories.remove(at: index)
        
        pref.set(histories, forKey: "histories")
    }
    
    func appendSearchHistories(value: String) {
        var histories = [String]()
        if let _histories = pref.object(forKey: "histories") as? [String] {
            histories = _histories
        }
        histories.append(value)

        pref.set(histories, forKey: "histories")
    }
    
    func getSearchHistories() -> [String]? {
        guard let histories = pref.object(forKey: "histories") as? [String] else { return nil }
        return histories
    }
    

}
