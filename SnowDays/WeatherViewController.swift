//
//  FirstViewController.swift
//  SnowDays
//
//  Created by Duely Yung on 3/2/16.
//  Copyright © 2016 Duely Yung. All rights reserved.
//

import UIKit
import CoreLocation

class WeatherViewController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate, WeatherServiceDelegate {
    
    @IBOutlet weak var myPicker: UIPickerView!
    @IBOutlet weak var locationLabel: UILabel!
    @IBOutlet weak var tempLabel: UILabel!
    @IBOutlet weak var cityNameLabel: UILabel!
    @IBOutlet weak var weatherIcon: UIImageView!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var snowboardPic: UIImageView!
    
    var getCity:String = ""
    let weatherService = WeatherService()
    let pickerLocation = ["Devil's Head Resort", "Alpine Ski Valley", "Cascade Mountain", "Wilmot Mountain", "Chestnut Mountain", "Sunburst Ski Area"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.myPicker.dataSource = self
        self.myPicker.delegate = self
        self.weatherService.delegate = self
        
        // When app loads, search for weather in Madison, WI
        self.weatherService.getWeather("Madison, WI")
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // Below is to add the data array entries to the UIPicker, which will output to a label
    func numberOfComponentsInPickerView(myPicker: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(myPicker: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return pickerLocation.count;
    }
    
    func pickerView(myPicker: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return pickerLocation[row]
    }
    
    func pickerView(pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        
        locationLabel.text = pickerLocation[row]
        
        switch pickerLocation[row]{
            case "Devil's Head Resort":
                getCity = "Madison, WI"
            case "Alpine Ski Valley":
                getCity = "Elkhorn, WI"
            case "Cascade Mountain":
                getCity = "Portage, WI"
            case "Wilmot Mountain":
                getCity = "Wilmot, WI"
            case "Chestnut Mountain":
                getCity = "Galena, IL"
            case "Sunburst Ski Area":
                getCity = "Kewaskum, WI"
            default:
                break
        }
        
        cityNameLabel.text = getCity
        self.weatherService.getWeather(getCity)
    }
    
    func setWeather(weather:Weather) {
        
        let formatter = NSNumberFormatter()
        let temp = formatter.stringFromNumber(weather.tempF)!
        
        cityNameLabel.text = weather.cityName
        tempLabel.text = "\(temp)°"
        descriptionLabel.text = weather.description
        weatherIcon.image = UIImage(named: weather.icon)
        
        // Conditional statement that checks JSON weather icon to see 
        // if it is snowing with codes 13d or 13n. Otherwise, no snow means no snowboard
        if weather.icon == "13d" || weather.icon == "13n" {
            snowboardPic.image = UIImage(named: "snowboard")
        } else {
            snowboardPic.image = UIImage(named: "noSnowboard")
        }
        
        print("Set Weather")
        print("City: \(weather.cityName) Temp: \(weather.tempF)")
    }

}

