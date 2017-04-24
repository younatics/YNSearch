//
//  ViewController.swift
//  YNSearch
//
//  Created by YiSeungyoun on 2017. 4. 16..
//  Copyright © 2017년 SeungyounYi. All rights reserved.
//

import UIKit
import YNSearch

class YNDropDownMenu {
    var title = "YNDropDownMenu"
    var starCount = 512
    var description = "Awesome Dropdown menu for iOS with Swift 3"
    var version = "2.3.0"
    var url = "https://github.com/younatics/YNDropDownMenu"
}

class YNSearchData {
    var title = "YNSearch"
    var starCount = 271
    var description = "Awesome fully customize search view like Pinterest written in Swift 3"
    var version = "0.3.1"
    var url = "https://github.com/younatics/YNSearch"
}

class YNExpandableCell {
    var title = "YNExpandableCell"
    var starCount = 191
    var description = "Awesome expandable, collapsible tableview cell for iOS written in Swift 3"
    var version = "1.1.0"
    var url = "https://github.com/younatics/YNExpandableCell"
}

class ViewController: YNSearchViewController, YNSearchDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        let ynSearch = YNSearch()
        
        
        let demoCategories = ["Menu", "Animation", "Transition", "TableView", "CollectionView", "Indicator", "Alert", "UIView", "UITextfield", "UITableView", "Swift", "iOS", "Android"]
        let demoSearchHistories = ["Menu", "Animation", "Transition", "TableView"]
        
        ynSearch.setCategories(value: demoCategories)
        ynSearch.setSearchHistories(value: demoSearchHistories)

        self.ynSearchinit()
        
        self.delegate = self
        self.navigationController?.setNavigationBarHidden(true, animated: false)
        
        let database1 = YNSearchModel(value: YNDropDownMenu(), key: "YNDropDownMenu")
        let database2 = YNSearchModel(value: YNSearchData(), key: "YNSearchData")
        let database3 = YNSearchModel(value: YNExpandableCell(), key: "YNExpandableCell")
        let demoDatabase = [database1, database2, database3]
        
        self.ynSearchView.ynSearchListView.initData(database: demoDatabase)
        self.ynSearchView.ynSearchMainView.setYNCategoryButtonType(type: .colorful)

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func ynSearchHistoryButtonClicked(text: String) {
        self.pushViewController(text: text)
        print(text)
    }
    
    func ynCategoryButtonClicked(text: String) {
        self.pushViewController(text: text)
        print(text)
    }
    
    func ynSearchListViewClicked(text: String) {
        self.pushViewController(text: text)
        print(text)
    }
    
    func pushViewController(text:String) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "detail") as! DetailViewController
        vc.clickedText = text
        
        self.present(vc, animated: true, completion: nil)
    }
    


}

