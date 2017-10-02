//
//  WeatherService.swift
//  SnowDays
//
//  Created by Duely Yung on 3/3/16.
//  Copyright © 2016 Duely Yung. All rights reserved.
//

import Foundation

protocol WeatherServiceDelegate {
    func setWeather(weather: Weather)
}

class WeatherService {
    
    var delegate: WeatherServiceDelegate?
    
    func getWeather(city: String) {
        
        let cityEscaped = city.stringByAddingPercentEncodingWithAllowedCharacters(NSCharacterSet.URLHostAllowedCharacterSet())
        let appId = "b0f97bfdfb4c00d5c0b85d4101fff095"
        
        let path = "http://api.openweathermap.org/data/2.5/weather?q=\(cityEscaped!)&appid=\(appId)"
        let url = NSURL(string: path)
        let session = NSURLSession.sharedSession()
        let task = session.dataTaskWithURL(url!) { (data:NSData?, response:NSURLResponse?, error:NSError?) -> Void in
            
            if let httpResponse = response as? NSHTTPURLResponse {
                print("*******")
                print(httpResponse.statusCode)
                print("*******")
            }
            
            let json = JSON(data: data!)
            //print(json)
            /* Looking at the JSON data, I could not find an entry for snow.3h. 
            I receive a nil error and program terminates when I include this in the Weather signature. */
            
            var status = 0
            
            if let cod = json["cod"].int {
                status = cod
            } else if let cod = json["cod"].string {
                status = Int(cod)!
            }
            
            if status == 200 {
                let lon = json["coord"]["lon"].double
                let lat = json["coord"]["lat"].double
                let temp = json["main"]["temp"].double
                let name = json["name"].string
                let desc = json["weather"][0]["description"].string
                let icon = json["weather"][0]["icon"].string
            
                let weather = Weather(temp: temp!, cityName: city, description: desc!, icon: icon!)
            
                if self.delegate != nil {
                    dispatch_async(dispatch_get_main_queue(), { () -> Void in
                        self.delegate?.setWeather(weather)
                    })
                }
                
                print("OK")
                print("Lat: \(lat!) Lon: \(lon!) Temp: \(temp!) Name: \(name!) Desc: \(desc)")
                
            } else {
                print("Something went wrong")
            }
            
            
            
        }
        
        task.resume()
        
        print("Weather Print Test: \(city)")

    }
    
}