//
//  YNSearchListView.swift
//  YNSearch
//
//  Created by YiSeungyoun on 2017. 4. 16..
//  Copyright © 2017년 SeungyounYi. All rights reserved.
//

import UIKit

open class YNSearchListView: UITableView, UITableViewDelegate, UITableViewDataSource {
    var database: [YNSearchModel]?
    open var ynSearchListViewDelegate: YNSearchListViewDelegate?
    open var ynSearch = YNSearch()
    open var ynSearchTextFieldText: String? {
        didSet {
            guard let text = ynSearchTextFieldText else { return }
            self.database = ynSearch.getSearchResult(value: text)
            if text.isEmpty {
                self.initData()
            }
            self.reloadData()
        }
    }

    public override init(frame: CGRect, style: UITableViewStyle) {
        super.init(frame: frame, style: style)
        self.initView()
        self.initData()
        
    }
    
    open func initData() {
        guard let database = ynSearch.getDatabase() else { return }
        self.database = database

    }
    
    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    // MARK: - UITableViewDelegate, UITableViewDataSource
    open func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let _database = database else { return UITableViewCell() }

        let cell = tableView.dequeueReusableCell(withIdentifier: YNSearchListViewCell.ID) as! YNSearchListViewCell
        
        if let key = _database[indexPath.row].key {
            cell.searchLabel.text = key
        }
        return cell
    }
    
    open func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let _database = database else { return 0 }
        return _database.count
    }
    
    open func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        guard let databaseIndex = database?[indexPath.row] else { return }

        if let key = databaseIndex.key {
            self.ynSearchListViewDelegate?.ynSearchListViewClicked(text: key)
            self.ynSearch.appendSearchHistories(value: key)
        }
    }
    
    
    open func initView() {
        self.delegate = self
        self.dataSource = self
        self.register(YNSearchListViewCell.self, forCellReuseIdentifier: YNSearchListViewCell.ID)
    }
}
