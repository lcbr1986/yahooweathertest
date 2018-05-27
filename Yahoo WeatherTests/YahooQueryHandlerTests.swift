//
//  YahooQueryHandlerTests.swift
//  Yahoo WeatherTests
//
//  Created by Luis Carlos Rosa on 27/05/18.
//  Copyright © 2018 Luis. All rights reserved.
//

import XCTest
import CoreLocation
@testable import Yahoo_Weather

class YahooQueryHandlerTests: XCTestCase {
    
    var yqhUnderTest: YahooQueryHandler!
    var yqlMock: YQLMock!
    
    override func setUp() {
        super.setUp()
        yqhUnderTest = YahooQueryHandler()
        yqlMock = YQLMock()
        yqhUnderTest.yql = yqlMock
    }
    
    override func tearDown() {
        yqhUnderTest = nil
        super.tearDown()
    }
    
    func testWhenYQLFailsNoObjectIsReturned() {
        yqlMock.shouldFail = true
        
        let returnedWeather = yqhUnderTest.getWeather(location: CLLocation())
        
        XCTAssertNil(returnedWeather)
    }
    
    func testWhenYQLIsSuccessfulWeatherObjectIsReturned() {
        yqlMock.shouldFail = false
        
        let returnedWeather = yqhUnderTest.getWeather(location: CLLocation())
        
        XCTAssertNotNil(returnedWeather)
        XCTAssertEqual(returnedWeather?.description, "Yahoo! Weather for San Francisco, CA, US")
        XCTAssertEqual(returnedWeather?.temp, "12")
        XCTAssertEqual(returnedWeather?.text, "Mostly Clear")
    }
    
}
