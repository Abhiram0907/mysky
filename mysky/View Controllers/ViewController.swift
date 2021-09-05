//
//  ViewController.swift
//  mysky
//
//  Created by Abhiram Alluri on 7/19/21.
//

import UIKit
import Alamofire
import SwiftyJSON
import CoreLocation

class ViewController: UIViewController, CLLocationManagerDelegate {

//Label outlets
    @IBOutlet weak var Location: UILabel!
    @IBOutlet weak var CurrentTemp: UILabel!
    @IBOutlet weak var WeatherType: UILabel!
    @IBOutlet weak var HiTemp: UILabel!
    @IBOutlet weak var LowTemp: UILabel!
    @IBOutlet weak var UVindex: UILabel!
    @IBOutlet weak var Humidity: UILabel!
    @IBOutlet weak var Wind: UILabel!
    
   
    @IBOutlet weak var TempControl: UISegmentedControl!
    
    @IBAction func TempControl(_ sender: UISegmentedControl) {
        
        switch TempControl.selectedSegmentIndex {
        case 0:
            CurrentTemp.text = String(Int(currentWeather.CurrentTemp - 273)*9/5+32)
            HiTemp.text = String(Int(currentWeather.HiTemp-273)*9/5+32)
            LowTemp.text = String(Int(currentWeather.LowTemp-273)*9/5+32)
        case 1:
            CurrentTemp.text = String(Int(currentWeather.CurrentTemp - 273))
            HiTemp.text = String(Int(currentWeather.HiTemp-273))
            LowTemp.text = String(Int(currentWeather.LowTemp-273))
        default:
            break
        }
    }
    let locationManager = CLLocationManager()
    
//Img outlets
    @IBOutlet weak var UVI_Icon: UIImageView!
    @IBOutlet weak var LoTemp_Icon: UIImageView!
    @IBOutlet weak var HiTemp_Icon: UIImageView!
    @IBOutlet weak var CurrentTemp_Icon: UIImageView!
    @IBOutlet weak var Humidity_Icon: UIImageView!
//    @IBOutlet weak var Wind_Icon: UIImageView!
    
    @IBOutlet weak var Background: UIImageView!
    
    var currentWeather: CurrentWeather!
    var currentLocation: CLLocation!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        Location.adjustsFontSizeToFitWidth = true

        HiTemp.textColor = UIColor(red: 1, green: 0.6157, blue: 0, alpha: 1.0)
        LowTemp.textColor = UIColor(red: 0.3569, green: 0.9216, blue: 1, alpha: 1.0)
        UVindex.textColor = UIColor(red: 1, green: 0.2824, blue: 0, alpha: 1.0)
        Humidity.textColor = UIColor(red: 0, green: 0.6627, blue: 1, alpha: 1.0)
        
        UVI_Icon.image = UIImage(named: "uvi")
        LoTemp_Icon.image = UIImage(named: "lotemp")
        HiTemp_Icon.image = UIImage(named: "hitemp")
        CurrentTemp_Icon.image = UIImage(named: "day")
        Humidity_Icon.image = UIImage(named: "humidity")
//        Wind_Icon.image = UIImage(named: "wind")
                
        currentWeather = CurrentWeather()
//        Location.textColor  =  UIColor.white
//        HiTemp.textColor = UIColor.white
//        LowTemp.textColor = UIColor.white
//        UVindex.textColor = UIColor.white
//        Humidity.textColor = UIColor.white
//        CurrentTemp.textColor = UIColor.white
//        WeatherType.textColor = UIColor.white
        
        callDelegate()
        currentWeather.downloadCurrentWeather {
            self.UpdateUI()
        }
        
        
        let hour = Calendar.current.component(.hour, from: Date())
        
        switch hour {
            case 1...11:
                Background.image = UIImage(named: "morning")
            case 7...18:
                Background.image = UIImage(named: "morning")
            default:
                Background.image = UIImage(named: "morning")
         }
        
    }
    
    func LocationSetup() {
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.requestWhenInUseAuthorization()
        locationManager.startMonitoringSignificantLocationChanges()
    }
    
    func callDelegate() {
        locationManager.delegate = self
    }
    
    func UpdateUI() {
        Location.text = currentWeather.Location
        WeatherType.text = currentWeather.WeatherType
        Humidity.text = "\(Double(currentWeather.Humidity))"
        CurrentTemp.text = String(Int(currentWeather.CurrentTemp - 273)*9/5+32)
        HiTemp.text = String(Int(currentWeather.HiTemp-273)*9/5+32)
        LowTemp.text = String(Int(currentWeather.LowTemp-273)*9/5+32)
    
        
    }
    
    
}


