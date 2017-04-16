//
//  YNSearchViewController.swift
//  YNSearch
//
//  Created by YiSeungyoun on 2017. 4. 11..
//  Copyright © 2017년 SeungyounYi. All rights reserved.
//

import UIKit

class YNSearchViewController: UIViewController, UITextFieldDelegate {
    var delegate: YNSearchDelegate? {
        didSet {
            self.ynSearchView.delegate = delegate
        }
    }
    
    let width = UIScreen.main.bounds.width
    let height = UIScreen.main.bounds.height
    
    var ynSearchTextfield: YNSearchTextField!
    var ynSearchView: YNSearchView!
    
    var ynSerach = YNSerach()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let ynSerach = YNSerach()
        let demoData = ["Menu", "Animation", "Transition", "TableView", "CollectionView", "Indicator", "Alert"]
        ynSerach.setDatabase(value: demoData)
        ynSerach.setCategories(value: demoData)
        
        self.ynSearchTextfield = YNSearchTextField(frame: CGRect(x: 20, y: 20, width: width-40, height: 50))
        self.ynSearchTextfield.delegate = self
        self.ynSearchTextfield.addTarget(self, action: #selector(ynSearchTextfieldTextChanged(_:)), for: .editingChanged)
        self.view.addSubview(self.ynSearchTextfield)
        
        self.ynSearchView = YNSearchView(frame: CGRect(x: 0, y: 70, width: width, height: height-70))
        self.view.addSubview(self.ynSearchView)
        
    }
    
    func ynSearchTextfieldTextChanged(_ textField: UITextField) {
        self.ynSearchView.ynSearchListView.ynSearchTextFieldText = textField.text
    }
    
    // MARK: - UITextFieldDelegate
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if let text = textField.text {
            self.ynSerach.appendSearchHistories(value: text)
        }
        self.ynSearchTextfield.endEditing(true)
        return true
    }
    
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
