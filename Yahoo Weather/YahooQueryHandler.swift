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
    var yql = YQL()
    
    func getWeather(location: CLLocation) -> Weather? {
        guard let results = yql.query("select * from weather.forecast where u='c' and woeid in (SELECT woeid FROM geo.places WHERE text=\"(\(location.coordinate.latitude), \(location.coordinate.longitude))\")") else {
            return nil
        }
        let weather = Weather(dictionary: results)
        return weather
    }
}
