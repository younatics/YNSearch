//
//  YNSearchTextField.swift
//  YNSearch
//
//  Created by YiSeungyoun on 2017. 4. 11..
//  Copyright © 2017년 SeungyounYi. All rights reserved.
//

import UIKit

class YNSearchTextField: UITextField {
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.initView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    func initView() {
        self.leftViewMode = .always
        
        let searchImageViewWrapper = UIView(frame: CGRect(x: 0, y: 0, width: 20, height: 15))
        let searchImageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 15, height: 15))
        searchImageView.image = UIImage(named: "search")
        searchImageViewWrapper.addSubview(searchImageView)
        
        self.leftView = searchImageViewWrapper
        self.returnKeyType = .search
        self.placeholder = "Search libraries what you want"
        self.font = UIFont.systemFont(ofSize: 14)
    }
}

class YNSearchTextFieldView: UIView {
    var ynSearchTextField: YNSearchTextField!
    var cancelButton: UIButton!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.initView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    func initView() {
        self.ynSearchTextField = YNSearchTextField(frame: CGRect(x: 0, y: 0, width: self.frame.width - 50, height: self.frame.height))
        self.addSubview(self.ynSearchTextField)
        
        self.cancelButton = UIButton(frame: CGRect(x: self.frame.width - 40, y: 0, width: 50, height: self.frame.height))
        self.cancelButton.titleLabel?.font = UIFont.systemFont(ofSize: 14)
        self.cancelButton.setTitleColor(UIColor.darkGray, for: .normal)
        self.cancelButton.setTitleColor(UIColor.lightGray, for: .highlighted)
        self.cancelButton.setTitle("Cancel", for: .normal)
        self.cancelButton.isHidden = true
        self.addSubview(self.cancelButton)
    }

}
