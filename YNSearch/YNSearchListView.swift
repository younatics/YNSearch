//
//  YNSearchListView.swift
//  YNSearch
//
//  Created by YiSeungyoun on 2017. 4. 16..
//  Copyright © 2017년 SeungyounYi. All rights reserved.
//

import UIKit

open class YNSearchListView: UITableView, UITableViewDelegate, UITableViewDataSource, UIScrollViewDelegate {
    open var database = [Any]()
    open var searchResultDatabase = [Any]()
    
    open var ynSearchListViewDelegate: YNSearchListViewDelegate?
    open var ynSearch = YNSearch()
    open var ynSearchTextFieldText: String? {
        didSet {
            guard let text = ynSearchTextFieldText else { return }

            let objectification = Objectification(objects: database, type: .all)
            let result = objectification.objects(contain: text)

            self.searchResultDatabase = result
            if text.isEmpty {
                self.initData(database: database)
            }
            self.reloadData()
        }
    }

    public override init(frame: CGRect, style: UITableView.Style) {
        super.init(frame: frame, style: style)
        self.initView()
    }
    
    open func initData(database: [Any]) {
        self.database = database
        self.searchResultDatabase = database
        self.reloadData()

    }
    
    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    // MARK: - UITableViewDelegate, UITableViewDataSource
    open func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = self.ynSearchListViewDelegate?.ynSearchListView(tableView, cellForRowAt: indexPath) else { return UITableViewCell() }
        return cell
    }
    
    open func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return searchResultDatabase.count
    }
    
    open func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        self.ynSearchListViewDelegate?.ynSearchListView(tableView, didSelectRowAt: indexPath)
    }
    
    open func scrollViewDidScroll(_ scrollView: UIScrollView) {
        self.ynSearchListViewDelegate?.ynSearchListViewDidScroll()
    }
    
    
    open func initView() {
        self.delegate = self
        self.dataSource = self
        self.register(YNSearchListViewCell.self, forCellReuseIdentifier: YNSearchListViewCell.ID)
    }
}
