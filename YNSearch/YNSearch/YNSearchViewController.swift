//
//  YNSearchViewController.swift
//  YNSearch
//
//  Created by YiSeungyoun on 2017. 4. 11..
//  Copyright © 2017년 SeungyounYi. All rights reserved.
//

import UIKit

class YNSearchViewController: UIViewController, UITextFieldDelegate {
    let width = UIScreen.main.bounds.width
    let height = UIScreen.main.bounds.height
    
    var categories = [String]()
    var database = [String]()
    
    var ynSearchTextfield: YNSearchTextField!
    var ynSearchView: YNSearchView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.categories = ["Menu", "Animation", "Transition", "TableView", "CollectionView", "Indicator", "Alert"]
        self.database = ["Menu", "Animation", "Transition", "TableView", "CollectionView", "Indicator", "Alert"]
        
        self.view.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(closeKeyboard)))
        
        self.ynSearchTextfield = YNSearchTextField(frame: CGRect(x: 20, y: 20, width: width-40, height: 50))
        self.ynSearchTextfield.delegate = self
        self.ynSearchTextfield.addTarget(self, action: #selector(ynSearchTextfieldTextChanged(_:)), for: .editingChanged)
        self.view.addSubview(self.ynSearchTextfield)
        
        self.ynSearchView = YNSearchView(frame: CGRect(x: 0, y: 70, width: width, height: height-70), categories: self.categories, database: self.database)
        self.view.addSubview(self.ynSearchView)
        
    }
    func ynSearchTextfieldTextChanged(_ textField: UITextField) {
        self.ynSearchView.ynSearchTextfieldText = textField.text
    }
    func closeKeyboard() {
        self.ynSearchTextfield.endEditing(true)
    }
    
    // MARK: - UITextFieldDelegate
    func textFieldDidBeginEditing(_ textField: UITextField) {
        UIView.animate(withDuration: 0.3, animations: { 
            self.ynSearchView.ynSearchMainView.alpha = 0
            self.ynSearchView.ynSearchListView.alpha = 1
        }) { (true) in
            self.ynSearchView.ynSearchMainView.isHidden = true
            self.ynSearchView.ynSearchListView.isHidden = false
        }
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        UIView.animate(withDuration: 0.3, animations: {
            self.ynSearchView.ynSearchMainView.alpha = 1
            self.ynSearchView.ynSearchListView.alpha = 0
        }) { (true) in
            self.ynSearchView.ynSearchMainView.isHidden = false
            self.ynSearchView.ynSearchListView.isHidden = true
        }
    }

    
}
