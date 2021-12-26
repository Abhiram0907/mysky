//
//  CurrentWeather.swift
//  mysky
//
//  Created by Abhiram Alluri on 9/1/21.
//

import Foundation
import Alamofire
import SwiftyJSON

class CurrentWeather {
    
    private var _Location: String!
    private var _CurrentTemp: Int!
    private var _HiTemp: Int!
    private var _LowTemp: Int!
    private var _Humidity: Double!
    private var _WeatherType: String!
    private var _Sunset: Double!
    private var _Sunrise: Double!
    
    var Location: String {
        if _Location == nil {
            _Location = ""
        }
        return _Location
    }
    
    var CurrentTemp: Int {
        if _CurrentTemp == nil {
            _CurrentTemp = 0
        }
        return _CurrentTemp
    }
    
    var HiTemp: Int {
        if _HiTemp == nil {
            _HiTemp = 0
        }
        return _HiTemp
    }
    
    var LowTemp: Int {
        if _LowTemp == nil {
            _LowTemp = 0
        }
        return _LowTemp
    }
    
    var Humidity: Double {
        if _Humidity == nil {
            _Humidity = 0.0
        }
        return _Humidity
    }
    
    var WeatherType: String {
        if _WeatherType == nil {
            _WeatherType = ""
        }
        return _WeatherType
    }
    var Sunrise: Double {
        if _Sunrise == nil {
            _Sunrise = 0.0
        }
        return _Sunrise
    }
    
    var Sunset: Double {
        if _Sunset == nil {
            _Sunset = 0.0
        }
        return _Sunset
    }
    
    func downloadCurrentWeather(completed: @escaping DownloadComplete){
        AF.request(API_KEY).responseJSON { (response) in
            
            let jsonObject = JSON(response.data!)
            
            self._Location = jsonObject["name"].stringValue
            self._WeatherType = jsonObject["weather"][0]["main"].stringValue
            self._Humidity = jsonObject["main"]["humidity"].doubleValue
            self._CurrentTemp = jsonObject["main"]["temp"].int
            self._HiTemp = jsonObject["main"]["temp_max"].int
            self._LowTemp = jsonObject["main"]["temp_min"].int
            self._Sunrise = jsonObject["sys"]["sunrise"].doubleValue
            self._Sunset = jsonObject["sys"]["sunset"].doubleValue
            
            completed()
        }
    }
    
}

class CurrentWeather2 {

    private var _UVIndex: Double!
    var UVIndex: Double {
        if _UVIndex == nil {
            _UVIndex = 0.0
        }
        return _UVIndex
    }

    func downloadCurrentWeather2(completed2: @escaping DownloadComplete2){
        AF.request(API_KEY2).responseJSON { (response2) in

            let jsonObject2 = JSON(response2.data!)
            self._UVIndex = jsonObject2["current"]["uvi"].doubleValue

            completed2()
        }
    }
}


