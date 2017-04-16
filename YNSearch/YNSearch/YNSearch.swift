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
    
    override init() {
        pref = UserDefaults.standard
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
