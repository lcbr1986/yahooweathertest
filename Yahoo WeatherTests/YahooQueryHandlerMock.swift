//
//  YahooQueryHandlerMock.swift
//  Yahoo WeatherTests
//
//  Created by Luis Carlos Rosa on 27/05/18.
//  Copyright © 2018 Luis. All rights reserved.
//

import Foundation
@testable import Yahoo_Weather
import CoreLocation

class YahooQueryHandlerMock: YahooQueryHandler {
    var shouldFail = false
    
    override func getWeather(location: CLLocation) -> Weather? {
        if shouldFail {
            return nil
        }
        return Weather(description: "description", text: "text", temp: "temp")
    }
}

extension Weather {
    init(description: String, text: String, temp: String) {
        self.description = description
        self.text = text
        self.temp = temp
    }
}
