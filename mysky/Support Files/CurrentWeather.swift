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
    private var _CurrentTemp: Double!
    private var _HiTemp: Double!
    private var _LowTemp: Double!
    private var _UVIndex: Double!
    private var _Humidity: Double!
    private var _WeatherType: String!
    private var _actualtemp: Double!
    
    var Location: String {
        if _Location == nil {
            _Location = ""
        }
        return _Location
    }
    
    var CurrentTemp: Double {
        if _CurrentTemp == nil {
            _CurrentTemp = 0.0
        }
        return _CurrentTemp
    }
    
    var HiTemp: Double {
        if _HiTemp == nil {
            _HiTemp = 0.0
        }
        return _HiTemp
    }
    
    var LowTemp: Double {
        if _LowTemp == nil {
            _LowTemp = 0.0
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
    
    func downloadCurrentWeather(completed: @escaping DownloadComplete){
        AF.request(API_KEY).responseJSON { (response) in
            
            let jsonObject = JSON(response.data!)
            let pretemp = jsonObject["main"]["temp"].double
            self._actualtemp = (pretemp! - 273.15) * 9/5 + 32
            self._Location = jsonObject["name"].stringValue
            self._WeatherType = jsonObject["weather"][0]["main"].stringValue
            let trunc_temp = Double(round(1000*self._actualtemp)/1000)
            self._Humidity = jsonObject["main"]["humidity"].doubleValue
            
            print(trunc_temp)
            print(self._Location!)
            print(self._WeatherType!)
            print(self._Humidity!)
            completed()
        }
    }
    
//    func downloadCurrentWeather(completed: @escaping DownloadComplete){
//               AF.request(API_URL).responseData { (response) in
//                let jsonObject = JSON(response.data!)
//                self._cityName = jsonObject["name"].stringValue
//                self._weatherType = jsonObject["weather"][0]["main"].stringValue
//
//                let tempDate=jsonObject["dt"].double
//                let convertedUnixDate = Date(timeIntervalSince1970: tempDate!)
//                let dateFormatter = DateFormatter()
//                dateFormatter.dateStyle = .medium
//                dateFormatter.timeStyle = .none
//                let currentDate = dateFormatter.string(from: convertedUnixDate)
//                self._date = currentDate
//
//                let downloadedTemp = jsonObject["main"]["temp"].double
//                let tmp = downloadedTemp! - 273.15
//                self._currentTemperature = Int(round(tmp))
//
//                print(self._cityName!)
//                print(self._date!)
//                print(self._currentTemperature!)
//                print(self._weatherType!)
//                completed()
//
//               }
//            }
    
}

