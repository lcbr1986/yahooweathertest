//
//  ViewControllerTests.swift
//  Yahoo WeatherTests
//
//  Created by Luis Carlos Rosa on 27/05/18.
//  Copyright © 2018 Luis. All rights reserved.
//

import XCTest
import CoreLocation
@testable import Yahoo_Weather

class ViewControllerTests: XCTestCase {
    
    var controllerUnderTest: ViewController!
    
    override func setUp() {
        super.setUp()
        controllerUnderTest = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "ViewController") as! ViewController
        let _ = controllerUnderTest.view
    }
    
    override func tearDown() {
        controllerUnderTest = nil
        super.tearDown()
    }
    
    func testWhenGettingWeatherFailsNoObjectIsReturned() {
        let yqhMock = YahooQueryHandlerMock()
        yqhMock.shouldFail = true
        controllerUnderTest.yql = yqhMock
        
        controllerUnderTest.getWeather(location: CLLocation())
        
        XCTAssertNil(controllerUnderTest.weather)
    }
    
    func testWhenGettingWeatherSuccedsObjectIsReturnedWithValues() {
        let yqhMock = YahooQueryHandlerMock()
        controllerUnderTest.yql = yqhMock
        
        controllerUnderTest.getWeather(location: CLLocation())
        
        XCTAssertNotNil(controllerUnderTest.weather)
        XCTAssertEqual(controllerUnderTest.weather?.description, "description")
        XCTAssertEqual(controllerUnderTest.weather?.text, "text")
        XCTAssertEqual(controllerUnderTest.weather?.temp, "temp")
    }
    
    func testWhenGoingToBackgroundHiddenViewIsShown() {
        controllerUnderTest.hideContents()
        
        XCTAssert(controllerUnderTest.hidingView.alpha == 1)
    }
    
    func testWhenGoingToForegroundHiddenViewIsNotShown() {
        controllerUnderTest.showContents()
        
        XCTAssert(controllerUnderTest.hidingView.alpha == 0)
    }
    
}
