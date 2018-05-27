//
//  YQLMock.swift
//  Yahoo WeatherTests
//
//  Created by Luis Carlos Rosa on 27/05/18.
//  Copyright © 2018 Luis. All rights reserved.
//

import Foundation
@testable import Yahoo_Weather

class YQLMock: YQL {
    var shouldFail = false
    override func query(_ statement: String!) -> [AnyHashable : Any]! {
        if shouldFail {
            return [:]
        }
        
        if let path = Bundle(for: type(of: self)).path(forResource: "yql", ofType: "json") {
            do {
                let data = try Data(contentsOf: URL(fileURLWithPath: path), options: .mappedIfSafe)
                let jsonResult = try JSONSerialization.jsonObject(with: data, options: .allowFragments)
                if let jsonResult = jsonResult as? Dictionary<String, AnyObject> {
                    return jsonResult
                }
            } catch {
                
            }
        }
        return [:]
    }
}
