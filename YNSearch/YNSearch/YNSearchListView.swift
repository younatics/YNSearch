//
//  YNSearchListView.swift
//  YNSearch
//
//  Created by YiSeungyoun on 2017. 4. 16..
//  Copyright © 2017년 SeungyounYi. All rights reserved.
//

import UIKit

class YNSearchListView: UITableView, UITableViewDelegate, UITableViewDataSource {
    var database: [String]?
    var ynSearchListViewDelegate: YNSearchListViewDelegate?
    var ynSearch = YNSearch()
    var ynSearchTextFieldText: String? {
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
    
    func initData() {
        guard let database = ynSearch.getDatabase() else { return }
        self.database = database

    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    // MARK: - UITableViewDelegate, UITableViewDataSource
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let _database = database else { return UITableViewCell() }

        let cell = tableView.dequeueReusableCell(withIdentifier: YNSearchListViewCell.ID) as! YNSearchListViewCell
        cell.searchLabel.text = _database[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let _database = database else { return 0 }
        return _database.count
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        guard let _database = database else { return }

        self.ynSearchListViewDelegate?.ynSearchListViewClicked(text: _database[indexPath.row])
        self.ynSearch.appendSearchHistories(value: _database[indexPath.row])
    }
    
    
    func initView() {
        self.delegate = self
        self.dataSource = self
        self.register(YNSearchListViewCell.self, forCellReuseIdentifier: YNSearchListViewCell.ID)
    }
}
