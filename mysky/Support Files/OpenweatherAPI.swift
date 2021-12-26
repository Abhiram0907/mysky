//
//  OpenweatherAPI.swift
//  mysky
//
//  Created by Abhiram Alluri on 8/6/21.
//

import Foundation
let API_KEY = "https://api.openweathermap.org/data/2.5/weather?q=Dallas&appid=e943561127a35733273a7fb13debcf80"
let API_KEY2 = "https://api.openweathermap.org/data/2.5/onecall?lat=33.44&lon=-94.04&exclude=minutely,hourly,daily&appid=e943561127a35733273a7fb13debcf80"

typealias DownloadComplete = () -> ()
typealias DownloadComplete2 = () -> ()
