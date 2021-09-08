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
    @IBOutlet weak var Sunrise: UILabel!
    @IBOutlet weak var Sunset: UILabel!
    
   
    @IBOutlet weak var TempControl: UISegmentedControl!
    
    @IBAction func TempControl(_ sender: UISegmentedControl) {
        
        switch TempControl.selectedSegmentIndex {
        case 0:
            CurrentTemp.text = "\(Int(currentWeather.CurrentTemp - 273)*9/5+32)°F"
            HiTemp.text = "\(Int(currentWeather.HiTemp-273)*9/5+32)°F"
            LowTemp.text = "\(Int(currentWeather.LowTemp-273)*9/5+32)°F"
        case 1:
            CurrentTemp.text = "\(Int(currentWeather.CurrentTemp - 273))°C"
            HiTemp.text = "\(Int(currentWeather.HiTemp-273))°C"
            LowTemp.text = "\(Int(currentWeather.LowTemp-273))°C"
        default:
            CurrentTemp.text = "\(Int(currentWeather.CurrentTemp - 273)*9/5+32)°F"
            HiTemp.text = "\(Int(currentWeather.HiTemp-273)*9/5+32)°F"
            LowTemp.text = "\(Int(currentWeather.LowTemp-273)*9/5+32)°F"
        }
    }
    let locationManager = CLLocationManager()
    
//Img outlets
    @IBOutlet weak var UVI_Icon: UIImageView!
    @IBOutlet weak var LoTemp_Icon: UIImageView!
    @IBOutlet weak var HiTemp_Icon: UIImageView!
    @IBOutlet weak var CurrentTemp_Icon: UIImageView!
    @IBOutlet weak var Humidity_Icon: UIImageView!
    @IBOutlet weak var Sunrise_Icon: UIImageView!
    @IBOutlet weak var Sunset_Icon: UIImageView!
    
    var currentWeather: CurrentWeather!
    var currentWeather2: CurrentWeather2!
    
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
        Sunrise_Icon.image = UIImage(named: "sunrise")
        Sunset_Icon.image = UIImage(named: "sunset")
        
        callDelegate()
        LocationSetup()
        locationAuthentication()
        
        currentWeather = CurrentWeather()
        currentWeather2 = CurrentWeather2()
        
        currentWeather.downloadCurrentWeather {
            self.UpdateUI()
        }
        currentWeather2.downloadCurrentWeather2 {
            self.UpdateUI2()
        }
        
    }
    
    func locationAuthentication() {
        
        if CLLocationManager.authorizationStatus() == .authorizedWhenInUse {
            currentLocation = locationManager.location
            print(currentLocation.coordinate.latitude)
            
        } else {
            locationManager.requestWhenInUseAuthorization()
            locationAuthentication()
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
        CurrentTemp.text = "\(Int(currentWeather.CurrentTemp - 273)*9/5+32)°F"
        HiTemp.text = "\(Int(currentWeather.HiTemp-273)*9/5+32)°F"
        LowTemp.text = "\(Int(currentWeather.LowTemp-273)*9/5+32)°F"
        
    }
    
    func UpdateUI2(){
        UVindex.text = "\(Double(currentWeather2.UVIndex))"
    }
    
    
}

//        let hour = Calendar.current.component(.hour, from: Date())
//
//        switch hour {
//            case 1...14:
//                let gradientlayer = CAGradientLayer()
//                gradientlayer.frame = view.bounds
//                gradientlayer.colors = [UIColor.orange.cgColor, UIColor.white.cgColor]
//                self.view.layer.insertSublayer(gradientlayer, at: 0)
//            case 14...24:
//                let gradientlayer = CAGradientLayer()
//                gradientlayer.frame = view.bounds
//                gradientlayer.colors = [UIColor.gray.cgColor, UIColor.white.cgColor]
//                self.view.layer.insertSublayer(gradientlayer, at: 0)
//            default:
//                let gradientlayer = CAGradientLayer()
//                gradientlayer.frame = view.bounds
//                gradientlayer.colors = [UIColor.orange.cgColor, UIColor.white.cgColor]
//                self.view.layer.insertSublayer(gradientlayer, at: 0)
//         }


