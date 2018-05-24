//
//  YahooQueryHandler.swift
//  Yahoo Weather
//
//  Created by Luis Carlos Rosa on 23/05/18.
//  Copyright © 2018 Luis. All rights reserved.
//

import Foundation

class YahooQueryHandler {
    
    func query() {
        let yql = YQL.init()
        let results = yql.query("SELECT * FROM weather.forecast WHERE woeid=2502265")
        print(results as Any)
    }
}
