//
//  YahooQueryHandler.swift
//  Yahoo Weather
//
//  Created by Luis Carlos Rosa on 23/05/18.
//  Copyright © 2018 Luis. All rights reserved.
//

import Foundation
import CoreLocation

class YahooQueryHandler {
    let yql = YQL()
    
    func query(location: CLLocation) {
        let results = yql.query("select * from weather.forecast where u='c' and woeid in (SELECT woeid FROM geo.places WHERE text=\"(\(location.coordinate.latitude), \(location.coordinate.longitude))\")")
        print(results as Any)
    }
}
