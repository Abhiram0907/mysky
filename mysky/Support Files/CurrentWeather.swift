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
    private var _UVIndex: Double!
    private var _Humidity: Double!
    private var _WeatherType: String!
    private var _Sunrise: Int!
    private var _Sunset: Int!
    
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
    
    var UVIndex: Double {
        if _UVIndex == nil {
            _UVIndex = 0.0
        }
        return _UVIndex
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
    
    var Sunrise: Int {
        if _Sunrise == nil {
            _Sunrise = 0
        }
        return _Sunrise
    }
    
    var Sunset: Int {
        if _Sunset == nil {
            _Sunrise = 0
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
            self._Sunrise = jsonObject["sys"]["sunrise"].int
            
//            print(response.value!)
            
            func convertDate(dateValue: Int) -> String {
                let truncatedTime = Int(dateValue / 1000)
                let date = Date(timeIntervalSince1970: TimeInterval(truncatedTime))
                let formatter = DateFormatter()
                formatter.timeZone = TimeZone(abbreviation: "UTC")
                formatter.dateFormat = "HH:mm"
                return formatter.string(from: date)
            }
            
            print(convertDate(dateValue: self._Sunrise))
            
            print(self._Sunrise!)
            print(self._CurrentTemp!)
            print(self._Location!)
            print(self._WeatherType!)
            print(self._Humidity!)
            
            completed()
        }
    }

    
}


