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
    
    var ynSearchTextfieldView: YNSearchTextFieldView!
    var ynSearchView: YNSearchView!
    
    var ynSerach = YNSerach()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let ynSerach = YNSerach()
        let demoCategories = ["Menu", "Animation", "Transition", "TableView", "CollectionView", "Indicator", "Alert"]
        let demoDatabase = ["Menu", "Animation", "Transition", "TableView", "CollectionView", "Indicator", "Alert"]
        let demoSearchHistories = ["Menu", "Animation", "Transition", "TableView"]
        
        ynSerach.setDatabase(value: demoDatabase)
        ynSerach.setCategories(value: demoCategories)
        ynSerach.setSearchHistories(value: demoSearchHistories)
        
        self.ynSearchTextfieldView = YNSearchTextFieldView(frame: CGRect(x: 20, y: 20, width: width-40, height: 50))
        self.ynSearchTextfieldView.ynSearchTextField.delegate = self
        self.ynSearchTextfieldView.ynSearchTextField.addTarget(self, action: #selector(ynSearchTextfieldTextChanged(_:)), for: .editingChanged)
        self.ynSearchTextfieldView.cancelButton.addTarget(self, action: #selector(ynSearchTextfieldcancelButtonClicked), for: .touchUpInside)
        self.view.addSubview(self.ynSearchTextfieldView)
        
        self.ynSearchView = YNSearchView(frame: CGRect(x: 0, y: 70, width: width, height: height-70))
        self.view.addSubview(self.ynSearchView)
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        self.ynSearchView.ynSearchMainView.redrawSearchHistoryButtons()
    }
    
    func ynSearchTextfieldcancelButtonClicked() {
        self.ynSearchTextfieldView.ynSearchTextField.text = ""
        self.ynSearchTextfieldView.ynSearchTextField.endEditing(true)
    }
    func ynSearchTextfieldTextChanged(_ textField: UITextField) {
        self.ynSearchView.ynSearchListView.ynSearchTextFieldText = textField.text
    }
    
    // MARK: - UITextFieldDelegate
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        guard let text = textField.text else { return true }
        if !text.isEmpty {
            self.ynSerach.appendSearchHistories(value: text)
            self.ynSearchView.ynSearchMainView.redrawSearchHistoryButtons()
        }
        self.ynSearchTextfieldView.ynSearchTextField.endEditing(true)
        return true
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        UIView.animate(withDuration: 0.3, animations: {
            self.ynSearchView.ynSearchMainView.alpha = 0
            self.ynSearchTextfieldView.cancelButton.alpha = 1
            self.ynSearchView.ynSearchListView.alpha = 1
        }) { (true) in
            self.ynSearchView.ynSearchMainView.isHidden = true
            self.ynSearchView.ynSearchListView.isHidden = false
            self.ynSearchTextfieldView.cancelButton.isHidden = false

        }
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        UIView.animate(withDuration: 0.3, animations: {
            self.ynSearchView.ynSearchMainView.alpha = 1
            self.ynSearchTextfieldView.cancelButton.alpha = 0
            self.ynSearchView.ynSearchListView.alpha = 0
        }) { (true) in
            self.ynSearchView.ynSearchMainView.isHidden = false
            self.ynSearchView.ynSearchListView.isHidden = true
            self.ynSearchTextfieldView.cancelButton.isHidden = true

        }
    }

    
}
