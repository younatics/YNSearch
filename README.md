# YNSearch + Realm Support

[![Swift Package Manager](https://img.shields.io/badge/Swift_Package_Manager-compatible-brightgreen.svg?style=flat)](https://www.swift.org/package-manager/)
[![CocoaPods](https://img.shields.io/cocoapods/v/YNSearch.svg?style=flat)](https://cocoapods.org/pods/YNSearch)
[![Platform](https://img.shields.io/badge/platform-iOS-13%2B-lightgrey.svg?style=flat)](https://developer.apple.com/ios/)
[![Swift 6.0](https://img.shields.io/badge/Swift-6.0-blue.svg?style=flat)](https://www.swift.org/)
[![License: MIT](https://img.shields.io/badge/license-MIT-blue.svg?style=flat)](https://github.com/younatics/YNSearch/blob/master/LICENSE)

## Updates
See [CHANGELOG](https://github.com/younatics/YNSearch/blob/master/CHANGELOG.md) for details

## Intoduction
🔍 Awesome search view, written in Swift 6, appears search view like Pinterest Search view. You can fully customize this library. You can also use this library with Realm! See usage in below
#### See [Highlighter](https://github.com/younatics/Highlighter) for highlight search result

![demo2](Images/Highlighter.gif)
![demo](Images/YNSearch.gif)
![demo3](Images/YNSearch2.png)
![demo4](Images/YNSearch3.png)

## Requirements

`YNSearch` uses Swift 6.0 and requires iOS 13.0 or later. `Package.swift` uses Swift tools 6.0, and both Swift Package Manager and CocoaPods declare iOS 13.0 as the minimum deployment target.

## Installation

### Swift Package Manager

In Xcode, choose **File ▸ Add Package Dependencies…** and enter:

```
https://github.com/younatics/YNSearch.git
```

Or add it to your `Package.swift`:

```swift
dependencies: [
    .package(url: "https://github.com/younatics/YNSearch.git", from: "3.0.0")
]
```

### CocoaPods

YNSearch is available through [CocoaPods](http://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod 'YNSearch', '~> 3.0'
```

## Simple Usage
Set categories (required) and search histories (optional)
```swift
import YNSearch

let demoCategories = ["Menu", "Animation", "Transition", "TableView", "CollectionView", "Indicator", "Alert", "UIView", "UITextfield", "UITableView", "Swift", "iOS", "Android"]
let demoSearchHistories = ["Menu", "Animation", "Transition", "TableView"]

let ynSearch = YNSearch()
ynSearch.setCategories(value: demoCategories)
ynSearch.setSearchHistories(value: demoSearchHistories)

ynSearchinit()
```

Set database (required) and key (required). key will be displayed in `YNSearchListView` You can set your database `[Any]` if you want to customize. 
```swift
let database1 = YNSearchModel(key: "YNDropDownMenu")
let database2 = YNSearchModel(key: "YNSearchData")
let demoDatabase = [database1, database2]
        
initData(database: demoDatabase)
```

Set `YNSearchListView` Delegate
```Swift
func ynSearchListView(_ ynSearchListView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = ynSearchListView.dequeueReusableCell(withIdentifier: YNSearchListViewCell.ID) as! YNSearchListViewCell
    if let model = self.ynSearchView.ynSearchListView.searchResultDatabase[indexPath.row] as? YNSearchModel {
        cell.searchLabel.text = model.key
    }

    return cell
}

func ynSearchListView(_ ynSearchListView: UITableView, didSelectRowAt indexPath: IndexPath) {
    let listView = self.ynSearchView.ynSearchListView
    if let model = listView.searchResultDatabase[indexPath.row] as? YNSearchModel, let key = model.key {
        // Call listview clicked based on key
        listView.ynSearchListViewDelegate?.ynSearchListViewClicked(key: key)

        // return object you set in database
        listView.ynSearchListViewDelegate?.ynSearchListViewClicked(object: model)

        // Append Search history
        listView.ynSearch.appendSearchHistories(value: key)
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
        
initData(database: dataArray)
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
delegate = self

func ynSearchHistoryButtonClicked(text: String) {
  print(text)
}
    
func ynCategoryButtonClicked(text: String) {
  print(text)
}
    
func ynSearchListViewClicked(key: String) {
  print(key)
}

func ynSearchListViewClicked(object: Any) {
  print(object)
}
```

Set `YNCategoryButton` type.
```Swift
setYNCategoryButtonType(type: .colorful)
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
