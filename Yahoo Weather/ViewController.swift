//
//  ViewController.swift
//  Yahoo Weather
//
//  Created by Luis Carlos Rosa on 23/05/18.
//  Copyright © 2018 Luis. All rights reserved.
//

import UIKit
import CoreLocation

class ViewController: UIViewController, CLLocationManagerDelegate {

    let manager = CLLocationManager()
    let yql = YahooQueryHandler()
    var weather: Weather?
    
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var tempertureLabel: UILabel!
    @IBOutlet weak var textLabel: UILabel!
    @IBOutlet weak var activityIndicatior: UIActivityIndicatorView!
    @IBOutlet weak var hidingView: UIView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        NotificationCenter.default.addObserver(self, selector: #selector(self.showContents), name: .UIApplicationWillEnterForeground, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(self.hideContents), name: .UIApplicationDidEnterBackground, object: nil)
        
        manager.delegate = self
        manager.requestWhenInUseAuthorization()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        hidingView.alpha = 0
        activityIndicatior.startAnimating()
        manager.requestLocation()
    }
    
    func updateUI() {
        guard let weather = self.weather else {
            print("Error")
            return
        }
        activityIndicatior.stopAnimating()
        descriptionLabel.text = weather.description
        tempertureLabel.text = "\(weather.temp)ºC"
        textLabel.text = weather.text
    }

    @objc func showContents() {
        hidingView.alpha = 0
    }
    
    @objc func hideContents() {
        hidingView.alpha = 1
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        if let location = locations.first {
            print("Found user's location: \(location)")
            weather = yql.getWeather(location: location)
            updateUI()
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print("Failed to find user's location: \(error.localizedDescription)")
    }


}

