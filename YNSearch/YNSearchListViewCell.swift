//
//  YNSearchListViewCell.swift
//  YNSearch
//
//  Created by YiSeungyoun on 2017. 4. 16..
//  Copyright © 2017년 SeungyounYi. All rights reserved.
//

import UIKit

open class YNSearchListViewCell: UITableViewCell {
    public static let ID = "YNSearchListViewCell"
    
    var leftMargin = 15
    
    open var searchImageView: UIImageView!
    open var searchLabel: UILabel!
        
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        self.initView()
    }
    
    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    open func initView() {
        self.searchImageView = UIImageView(frame: CGRect(x: 15, y: (self.frame.height - 15)/2, width: 15, height: 15))
        let search = UIImage(named: "search", in: Bundle(for: YNSearch.self), compatibleWith: nil)
        self.searchImageView.image = search
        self.addSubview(searchImageView)
        
        self.searchLabel = UILabel(frame: CGRect(x: 40, y: 0, width: self.frame.width - 20, height: self.frame.height))
        self.searchLabel.textColor = UIColor.darkGray
        self.searchLabel.font = UIFont.systemFont(ofSize: 13)
        self.addSubview(searchLabel)
    }
    
    
}
