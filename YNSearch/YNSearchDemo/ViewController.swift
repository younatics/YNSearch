//
//  ViewController.swift
//  YNSearch
//
//  Created by YiSeungyoun on 2017. 4. 16..
//  Copyright © 2017년 SeungyounYi. All rights reserved.
//

import UIKit

class ViewController: YNSearchViewController, YNSearchDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let ynSerach = YNSerach()
        let demoCategories = ["Menu", "Animation", "Transition", "TableView", "CollectionView", "Indicator", "Alert", "UIView", "UITextfield", "UITableView", "Swift", "iOS", "Android"]
        let demoDatabase = ["Menu", "Animation", "Transition", "TableView", "CollectionView", "Indicator", "Alert", "UIView", "UITextfield", "UITableView", "Swift", "iOS", "Android"]
        let demoSearchHistories = ["Menu", "Animation", "Transition", "TableView"]
        
        ynSerach.setDatabase(value: demoDatabase)
        ynSerach.setCategories(value: demoCategories)
        ynSerach.setSearchHistories(value: demoSearchHistories)

        self.ynSearchinit()
        
        self.delegate = self
        self.navigationController?.setNavigationBarHidden(true, animated: false)

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

