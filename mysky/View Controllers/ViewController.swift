//
//  ViewController.swift
//  mysky
//
//  Created by Abhiram Alluri on 7/19/21.
//

import UIKit

class ViewController: UIViewController {

//Label outlets
    @IBOutlet var Search: UISearchBar!
    @IBOutlet weak var Location: UILabel!
    @IBOutlet weak var HiTemp: UILabel!
    @IBOutlet weak var CurrentTemp: UILabel!
    @IBOutlet weak var Day_Weather: UILabel!
    @IBOutlet weak var UVindex: UILabel!
    @IBOutlet weak var LowTemp: UILabel!
    @IBOutlet weak var Humidity: UILabel!
    
//Img outlets
    @IBOutlet weak var UVI_Icon: UIImageView!
    @IBOutlet weak var LoTemp_Icon: UIImageView!
    @IBOutlet weak var HiTemp_Icon: UIImageView!
//    @IBOutlet weak var Day_Night_Icon: UIImageView!
    @IBOutlet weak var CurrentTemp_Icon: UIImageView!
    @IBOutlet weak var Humidity_Icon: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        Location.adjustsFontSizeToFitWidth = true
        CurrentTemp.textColor = UIColor.black
        HiTemp.textColor = UIColor.orange
        LowTemp.textColor = UIColor.systemTeal
        UVindex.textColor = UIColor.black
        Humidity.textColor = UIColor.black
        
        UVI_Icon.image = UIImage(named: "uvi")
        LoTemp_Icon.image = UIImage(named: "lotemp")
        HiTemp_Icon.image = UIImage(named: "hitemp")
        CurrentTemp_Icon.image = UIImage(named: "day")
        Humidity_Icon.image = UIImage(named: "humidity")
        
//        let hour = Calendar.current.component(.hour, from: Date())
//
//        switch hour {
//            case 1...6:
//                Day_Night_Icon.image = UIImage(named:"night")
//            case 7...19:
//                Day_Night_Icon.image = UIImage(named:"day")
//            case 20...24:
//                Day_Night_Icon.image = UIImage(named:"day")
//
//            default:
//                Day_Night_Icon.image = UIImage(named:"day")
//         }
        
    }
        
}



