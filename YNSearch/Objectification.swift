//
//  Objectification.swift
//  Objectification
//
//  Created by YiSeungyoun on 2017. 4. 23..
//  Copyright © 2017년 SeungyounYi. All rights reserved.
//

import Foundation

public enum ObjectificationType {
    case properties
    case values
    case all
}

public class Objectification {
    private var objects = [Any]()
    private var stringObjects = [[String]]()
    
    public init(objects: [Any], type: ObjectificationType) {
        
        for object in objects {
            let mirror = Mirror(reflecting: object)

            switch type {
            case .properties:
                stringObjects.append(self.properties(mirror: mirror))
                break
            case .values:
                stringObjects.append(self.values(mirror: mirror))
                break
            case .all:
                stringObjects.append(self.all(mirror: mirror))
                break
            }
        }
        self.objects = objects
    }
    
    public func objects(contain string:String) -> [Any] {
        var returnObject = [Any]()
        let predicate = NSPredicate(format: "SELF CONTAINS[c] %@", string)
        
        for i in 0..<stringObjects.count {
            let searchDataSource = stringObjects[i].filter { predicate.evaluate(with: $0) }
            if !searchDataSource.isEmpty {
                returnObject.append(objects[i])
            }
        }

        return returnObject
    }
    
    private func properties(mirror: Mirror) -> [String] {
        return mirror.children.compactMap { $0.label }
    }
    
    private func values(mirror: Mirror) -> [String] {
        var values = [String]()
        for value in mirror.children {
            values = values + checkArray(object:value.value)
        }
        
        return values
    }
    
    private func all(mirror: Mirror) -> [String] {
        return mirror.children.compactMap { $0.label } + values(mirror: mirror)
    }
    
    private func checkArray(object: Any) -> [String] {
        var values = [String]()
        if let valueArray = object as? Array<Any> {
            for arrayValue in valueArray {
                values = values + checkArray(object: arrayValue)
            }
        } else {
            let objectString = String(describing: object)
            if objectString != "nil" {
                values.append(convertOptional(string: objectString))
            }
        }

        return values
    }
    
    private func convertOptional(string: String) -> String {
        if string.hasPrefix("Optional(") && string.hasSuffix(")") {
            let nonOptionalString = string.substring(10..<string.count-2)
            
            if nonOptionalString.isInt || nonOptionalString.isDouble || nonOptionalString.isFloat {
                return string.substring(9..<string.count-1)
            } else {
                return nonOptionalString
            }
        }
        return string
    }
}

private extension String {
    var isInt: Bool {
        return Int(self) != nil
    }
    
    var isDouble: Bool {
        return Double(self) != nil
    }
    
    var isFloat: Bool {
        return Float(self) != nil
    }
    
    func substring(_ r: Range<Int>) -> String {
        let fromIndex = self.index(self.startIndex, offsetBy: r.lowerBound)
        let toIndex = self.index(self.startIndex, offsetBy: r.upperBound)
        return self.substring(with: Range<String.Index>(uncheckedBounds: (lower: fromIndex, upper: toIndex)))
    }
}
