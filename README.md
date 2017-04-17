# YNSearch

## Updates
See [CHANGELOG](https://github.com/younatics/YNDropDownMenu/blob/master/CHANGELOG.md) for details

## Intoduction
Awesome search view, written in Swift 3, appears search view like Pinterest Search view. You can fully customizable this library

![demo](Images/YNSearch.png)
![demo2](Images/YNSearch.gif)

## Requirements

`YNSearch` written in Swift 3. Compatible with iOS 8.0+

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
Set database(Required), categories(Required) and search histories(Optional).
```swift
import YNSearch

let demoDatabase = ["Menu", "Animation", "Transition", "TableView", "CollectionView", "Indicator", "Alert", "UIView", "UITextfield", "UITableView", "Swift", "iOS", "Android"]

ynSearch.setDatabase(value: demoDatabase)
ynSearch.setCategories(value: demoDatabase)
ynSearch.setSearchHistories(value: demoDatabase)

self.ynSearchinit()

```
## View Hierachy



