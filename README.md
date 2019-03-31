# YNSearch + Realm Support

[![Awesome](https://cdn.rawgit.com/sindresorhus/awesome/d7305f38d29fed78fa85652e3a63e154dd8e8829/media/badge.svg)](https://github.com/sindresorhus/awesome)
[![Version](https://img.shields.io/cocoapods/v/YNSearch.svg?style=flat)](http://cocoapods.org/pods/YNSearch)
[![Carthage Compatible](https://img.shields.io/badge/Carthage-compatible-4BC51D.svg?style=flat)](https://github.com/Carthage/Carthage)
[![License: MIT](https://img.shields.io/badge/license-MIT-blue.svg?style=flat)](https://github.com/younatics/YNSearch/blob/master/LICENSE)
[![Build Status](https://travis-ci.org/younatics/YNSearch.svg?branch=master)](https://travis-ci.org/younatics/YNSearch)
[![Platform](https://img.shields.io/cocoapods/p/YNSearch.svg?style=flat)](http://cocoapods.org/pods/YNSearch)
[![Swift 5.0](https://img.shields.io/badge/Swift-5.0-blue.svg?style=flat)](https://developer.apple.com/swift/)

## Updates
See [CHANGELOG](https://github.com/younatics/YNSearch/blob/master/CHANGELOG.md) for details

## Intoduction
🔍 Awesome search view, written in Swift 5.0, appears search view like Pinterest Search view. You can fully customize this library. You can also use this library with Realm! See usage in below
#### See [Highlighter](https://github.com/younatics/Highlighter) for highlight search result

![demo2](Images/Highlighter.gif)
![demo](Images/YNSearch.gif)
![demo3](Images/YNSearch2.png)
![demo4](Images/YNSearch3.png)

## Requirements

`YNSearch` is written in Swift 5.0. Compatible with iOS 8.0+

## Installation

### Cocoapods

YNSearch is available through [CocoaPods](http://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod 'YNSearch'
```

### Carthage
```
github "younatics/YNSearch"
```

## Simple Usage
Set categories (required) and search histories (optional)
```swift
import YNSearch

let demoDatabase = ["Menu", "Animation", "Transition", "TableView", "CollectionView", "Indicator", "Alert", "UIView", "UITextfield", "UITableView", "Swift", "iOS", "Android"]

ynSearch.setCategories(value: demoDatabase)
ynSearch.setSearchHistories(value: demoDatabase)

self.ynSearchinit()
```

Set database (required) and key (required). key will be displayed in `YNSearchListView` You can set your database `[Any]` if you want to customize. 
```swift
let database1 = YNDropDownMenu(key: "YNDropDownMenu")
let database2 = YNSearchData(key: "YNSearchData")
let demoDatabase = [database1, database2]
        
self.initData(database: demoDatabase)
```

Set `YNSearchListView` Delegate
```Swift
func ynSearchListView(_ ynSearchListView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = self.ynSearchView.ynSearchListView.dequeueReusableCell(withIdentifier: YNSearchListViewCell.ID) as! YNSearchListViewCell
        if let ynmodel = self.ynSearchView.ynSearchListView.searchResultDatabase[indexPath.row] as? YNSearchModel {
            cell.searchLabel.text = ynmodel.key
        }
        
        return cell
}
    
func ynSearchListView(_ ynSearchListView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let ynmodel = self.ynSearchView.ynSearchListView.searchResultDatabase[indexPath.row] as? YNSearchModel, let key = ynmodel.key {
        // Call listview clicked based on key
        self.ynSearchView.ynSearchListView.ynSearchListViewDelegate?.ynSearchListViewClicked(key: key)
        
        // return object you set in database
        self.ynSearchView.ynSearchListView.ynSearchListViewDelegate?.ynSearchListViewClicked(object: self.ynSearchView.ynSearchListView.database[indexPath.row])
        
        // Append Search history
        self.ynSearchView.ynSearchListView.ynSearch.appendSearchHistories(value: key)
        }
}
```

## Realm Usage
Get your Data with Realm
```Swift 
let datas = realm.objects(RealmModel.self)
```
Realm is not collection type so you need to convert it again with `[Any]`type. This will find all string in your RealmModel and show you results.
```Swift 
var dataArray = [Any]()
for data in datas {
        let searchModel = RealmModel()
            searchModel.author = data.author
            searchModel.detail = data.detail
            searchModel.title = data.title
            searchModel.type = data.type
            
            dataArray.append(searchModel)
        }
        
self.initData(database: dataArray)
```


#### I used [Objectification](https://github.com/younatics/Objectification) for accurate search result. This library will get all data in your object and search if for us.
Done!

## View Hierachy
```
YNSearchViewController: Inherit this viewcontroller 
|-- YNSearchTextFieldView: YNSearchTextField with cancel button
|   |-- YNSearchTextField: Search UITextfield
|   |-- cancelButton: Show when YNSearchTextField textFieldDidBeginEditing
|
|-- YNSearchView : get both YNSearchMainView and YNSearchListView
|   |-- YNSearchMainView: First view that you can see
|   |   |-- categoryLabel: Cateogry label
|   |   |-- [YNCategoryButton]: cateogory buttons
|   |   |-- searchHistoryLabel: Search history label
|   |   |-- [YNSearchHistoryView]: history views
|   |   |   |-- [YNSearchHistoryButton]: Search history button
|   |   |   |-- [closeButton]: Close button
|   |
|   |-- YNSearchListView: UITableview with search result
```

## Custom Usage
set `YNSearchDelegate` if you want callback
```Swift 
self.delegate = self

func ynSearchHistoryButtonClicked(text: String) {
  print(text)
}
    
func ynCategoryButtonClicked(text: String) {
  print(text)
}
    
func ynSearchListViewClicked(text: String) {
  print(text)
}

func ynSearchListViewClicked(object: YNSearchModel) {
  print(object)
}
```

Set `YNCategoryButton` type.
```Swift
self.ynSearchView.ynSearchMainView.setYNCategoryButtonType(type: .colorful)
```

See more usage in demo

#### You can fully customize this `YNSearch` based on view hierachy

## References
#### Please tell me or make pull request if you use this library in your application :) 
#### [Highlighter](https://github.com/younatics/Highlighter)
#### [Objectification](https://github.com/younatics/Objectification)
#### [MotionBook](https://github.com/younatics/MotionBook)

## Author
[younatics](https://twitter.com/younatics)
<a href="http://twitter.com/younatics" target="_blank"><img alt="Twitter" src="https://img.shields.io/twitter/follow/younatics.svg?style=social&label=Follow"></a>

## License
YNSearch is available under the MIT license. See the LICENSE file for more info.
