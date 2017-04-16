//
//  YNSearchTextField.swift
//  motion-book
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
        
        self.placeholder = "Search libraries what you want"
    }
}
