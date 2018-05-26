//
//  Weather.swift
//  Yahoo Weather
//
//  Created by Luis Carlos Rosa on 26/05/18.
//  Copyright © 2018 Luis. All rights reserved.
//

import Foundation

struct Weather {
    let description: String
    let temp: String
    let text: String
    
    init?(dictionary: [AnyHashable: Any]) {
        guard let query = dictionary["query"] as? [String: Any],
            let results = query["results"] as? [String: Any],
            let channel = results["channel"] as? [String: Any],
            let description = channel["description"] as? String,
            let item = channel["item"] as? [String: Any],
            let condition = item["condition"] as? [String: Any],
            let temp = condition["temp"] as? String,
            let text = condition["text"] as? String
        else {
                return nil
        }
        
        self.description = description
        self.temp = temp
        self.text = text
    }
}
