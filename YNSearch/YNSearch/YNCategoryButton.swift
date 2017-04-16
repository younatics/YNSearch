//
//  YNCategoryButton.swift
//  YNSearch
//
//  Created by Seungyoun Yi on 2017. 4. 12..
//  Copyright © 2017년 SeungyounYi. All rights reserved.
//

import UIKit

class YNCategoryButton: UIButton {
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.initVIew()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override var isHighlighted: Bool {
        didSet {
            switch isHighlighted {
            case true:
                layer.borderColor = UIColor.lightGray.cgColor
            case false:
                layer.borderColor = UIColor.darkGray.cgColor
            }
        }
    }
    func initVIew() {
        self.layer.borderColor = UIColor.darkGray.cgColor
        self.layer.borderWidth = 1
        self.titleLabel?.font = UIFont.systemFont(ofSize: 12)
        self.setTitleColor(UIColor.darkGray, for: .normal)
        self.setTitleColor(UIColor.lightGray, for: .highlighted)
        
    }

}
