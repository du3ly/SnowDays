//
//  Weather.swift
//  SnowDays
//
//  Created by Duely Yung on 3/3/16.
//  Copyright © 2016 Duely Yung. All rights reserved.
//

import Foundation

struct Weather {
    let cityName: String
    let temp: Double
    let description: String
    let icon: String
    
    var tempC: Double {
        get {
            return temp - 273.15
        }
    }
    
    var tempF: Double {
        get {
            return tempC * 9/5 + 32
        }
    }
    
    init(temp: Double, cityName: String, description: String, icon: String) {
        self.temp = temp
        self.cityName = cityName
        self.description = description
        self.icon = icon
    }
}