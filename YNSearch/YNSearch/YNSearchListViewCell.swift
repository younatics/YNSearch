//
//  YNSearchListViewCell.swift
//  motion-book
//
//  Created by YiSeungyoun on 2017. 4. 16..
//  Copyright © 2017년 SeungyounYi. All rights reserved.
//

import UIKit

class YNSearchListViewCell: UITableViewCell {
    static let ID = "YNSearchListViewCell"
    
    var leftMargin = 15
    
    var searchImageView: UIImageView!
    var searchLabel: UILabel!
        
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        self.initView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    func initView() {
        self.searchImageView = UIImageView(frame: CGRect(x: 15, y: (self.frame.height - 15)/2, width: 15, height: 15))
        self.searchImageView.image = UIImage(named: "search")
        self.addSubview(searchImageView)
        
        self.searchLabel = UILabel(frame: CGRect(x: 40, y: 0, width: self.frame.width - 20, height: self.frame.height))
        self.searchLabel.textColor = UIColor.darkGray
        self.searchLabel.font = UIFont.systemFont(ofSize: 13)
        self.addSubview(searchLabel)
    }
    
    
}
