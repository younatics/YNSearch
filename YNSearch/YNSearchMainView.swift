//
//  YNSearchMainView.swift
//  YNSearch
//
//  Created by YiSeungyoun on 2017. 4. 16..
//  Copyright © 2017년 SeungyounYi. All rights reserved.
//

import UIKit

open class YNSearchMainView: UIView {
    let width = UIScreen.main.bounds.width
    let height = UIScreen.main.bounds.height

    open var categoryLabel: UILabel!
    open var ynCategoryButtons = [YNCategoryButton]()
    
    open var searchHistoryLabel: UILabel!
    open var ynSearchHistoryViews = [YNSearchHistoryView]()
    open var ynSearchHistoryButtons = [YNSearchHistoryButton]()
    open var clearHistoryButton: UIButton!

    
    var margin: CGFloat = 15
    open var delegate: YNSearchMainViewDelegate?
    
    open var ynSearch = YNSearch()

    public override init(frame: CGRect) {
        super.init(frame: frame)
        
        guard let categories = YNSearch.shared.getCategories() else { return }
        self.initView(categories: categories)
    }
    
    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    
    open func setYNCategoryButtonType(type: YNCategoryButtonType) {
        for ynCategoryButton in self.ynCategoryButtons {
            ynCategoryButton.type = type
        }
    }
    
    @objc open func ynCategoryButtonClicked(_ sender: UIButton) {
        guard let text = ynCategoryButtons[sender.tag].titleLabel?.text else { return }
        ynSearch.appendSearchHistories(value: text)
        self.delegate?.ynCategoryButtonClicked(text: text)
    }
    
    @objc open func ynSearchHistoryButtonClicked(_ sender: UIButton) {
        guard let text = ynSearchHistoryButtons[sender.tag].textLabel.text else { return }
        self.delegate?.ynSearchHistoryButtonClicked(text: text)
    }
    
    @objc open func clearHistoryButtonClicked() {
        ynSearch.setSearchHistories(value: [String]())
        self.redrawSearchHistoryButtons()
    }
    
    @objc open func closeButtonClicked(_ sender: UIButton) {
        ynSearch.deleteSearchHistories(index: sender.tag)
        self.redrawSearchHistoryButtons()
    }
    
    open func initView(categories: [String]) {
        self.categoryLabel = UILabel(frame: CGRect(x: margin, y: 0, width: width - 40, height: 50))
        self.categoryLabel.text = "Categories"
        self.categoryLabel.font = UIFont.systemFont(ofSize: 13)
        self.categoryLabel.textColor = UIColor.darkGray
        self.addSubview(self.categoryLabel)
        
        let font = UIFont.systemFont(ofSize: 12)
        let userAttributes = [NSAttributedString.Key.font : font, NSAttributedString.Key.foregroundColor: UIColor.gray]
        
        var formerWidth: CGFloat = margin
        var formerHeight: CGFloat = 50
        
        for i in 0..<categories.count {
            let size = categories[i].size(withAttributes: userAttributes)
            if i > 0 {
                formerWidth = ynCategoryButtons[i-1].frame.size.width + ynCategoryButtons[i-1].frame.origin.x + 10
                if formerWidth + size.width + margin > UIScreen.main.bounds.width {
                    formerHeight += ynCategoryButtons[i-1].frame.size.height + 10
                    formerWidth = margin
                }
            }
            let button = YNCategoryButton(frame: CGRect(x: formerWidth, y: formerHeight, width: size.width + 10, height: size.height + 10))
            button.addTarget(self, action: #selector(ynCategoryButtonClicked(_:)), for: .touchUpInside)
            button.setTitle(categories[i], for: .normal)
            button.tag = i
            
            ynCategoryButtons.append(button)
            self.addSubview(button)
            
        }
        guard let originY = ynCategoryButtons.last?.frame.origin.y else { return }
        self.searchHistoryLabel = UILabel(frame: CGRect(x: margin, y: originY + 30, width: width - 40, height: 40))
        self.searchHistoryLabel.text = "Search History"
        self.searchHistoryLabel.font = UIFont.systemFont(ofSize: 13)
        self.searchHistoryLabel.textColor = UIColor.darkGray
        self.addSubview(self.searchHistoryLabel)
        
    }
    
    open func redrawSearchHistoryButtons() {
        for ynSearchHistoryView in ynSearchHistoryViews {
            ynSearchHistoryView.removeFromSuperview()
        }
        ynSearchHistoryViews.removeAll()
        ynSearchHistoryButtons.removeAll()

        if self.clearHistoryButton != nil {
            self.clearHistoryButton.removeFromSuperview()
        }
        
        let histories = ynSearch.getSearchHistories() ?? [String]()
        
        let searchHistoryLabelOriginY: CGFloat = searchHistoryLabel.frame.origin.y + searchHistoryLabel.frame.height

        for i in 0..<histories.count {
            let view = YNSearchHistoryView(frame: CGRect(x: margin, y: searchHistoryLabelOriginY + CGFloat(i * 40) , width: width - (margin * 2), height: 40))
            view.ynSearchHistoryButton.addTarget(self, action: #selector(ynSearchHistoryButtonClicked(_:)), for: .touchUpInside)
            view.closeButton.addTarget(self, action: #selector(closeButtonClicked(_:)), for: .touchUpInside)

            view.ynSearchHistoryButton.textLabel.text = histories[i]
            view.ynSearchHistoryButton.tag = i
            view.closeButton.tag = i
            
            ynSearchHistoryViews.append(view)
            ynSearchHistoryButtons.append(view.ynSearchHistoryButton)
            self.addSubview(view)
        }
        let lastHistoryView = self.ynSearchHistoryViews.last ?? YNSearchHistoryView()
        
        self.clearHistoryButton = UIButton(frame: CGRect(x: margin, y: lastHistoryView.frame.origin.y + lastHistoryView.frame.height, width: width - (margin * 2), height: 40))
        self.clearHistoryButton.setTitle("Clear search history", for: .normal)
        self.clearHistoryButton.titleLabel?.font = UIFont.systemFont(ofSize: 13)
        self.clearHistoryButton.setTitleColor(UIColor.darkGray, for: .normal)
        self.clearHistoryButton.setTitleColor(UIColor.lightGray, for: .highlighted)
        self.clearHistoryButton.addTarget(self, action: #selector(clearHistoryButtonClicked), for: .touchUpInside)
        self.addSubview(clearHistoryButton)
        
        self.delegate?.ynSearchMainViewSearchHistoryChanged()
    }
}
