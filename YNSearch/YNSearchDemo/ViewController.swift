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
        self.delegate = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func ynSearchHistoryButtonClicked(_ sender: UIButton) {
        print(sender.tag)
    }
    
    func ynCategoryButtonClicked(_ sender: UIButton) {
        print(sender.tag)
    }
    
    func ynSearchListViewClicked(text: String) {
        print(text)
    }
    


}

