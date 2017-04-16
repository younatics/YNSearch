//
//  YNSearchButton.swift
//  YNSearch
//
//  Created by Seungyoun Yi on 2017. 4. 12..
//  Copyright © 2017년 SeungyounYi. All rights reserved.
//

import UIKit

class YNSearchHistoryView: UIView {
    var ynSearchHistoryButton: YNSearchHistoryButton!
    var closeButton: UIButton!
    var bottomLine: UIView!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.initView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    func initView() {
        self.ynSearchHistoryButton = YNSearchHistoryButton(frame: CGRect(x: 0, y: 0, width: self.frame.width - 15, height: self.frame.height))
        self.addSubview(ynSearchHistoryButton)
        
        self.closeButton = UIButton(frame: CGRect(x: self.frame.width - 15, y: (self.frame.height - 15)/2, width: 15, height: 15))
        self.closeButton.setImage(UIImage(named: "close"), for: .normal)
        self.addSubview(closeButton)
        
        self.bottomLine = UIView(frame: CGRect(x: 0, y: self.frame.height-0.5, width: self.frame.width, height: 0.5))
        self.bottomLine.backgroundColor = UIColor.lightGray
        self.addSubview(bottomLine)
        
    }
}

class YNSearchHistoryButton: UIButton {
    var textLabel: UILabel!

    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.initView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }

    override var isHighlighted: Bool {
        didSet {
            switch isHighlighted {
            case true:
                self.textLabel.textColor = UIColor.lightGray
            case false:
                self.textLabel.textColor = UIColor.darkGray
            }
        }
    }
    
    func initView() {
        let searchHistoryImageview = UIImageView(frame: CGRect(x: 0, y: (self.frame.height - 15)/2, width: 15, height: 15))
        searchHistoryImageview.image = UIImage(named: "search_history")
        self.addSubview(searchHistoryImageview)
        
        self.textLabel = UILabel(frame: CGRect(x: 25, y: 0, width: self.frame.width - 40, height: self.frame.height))
        self.textLabel.font = UIFont.systemFont(ofSize: 14)
        self.textLabel.textColor = UIColor.darkGray
        self.addSubview(textLabel)
        
    }

}

