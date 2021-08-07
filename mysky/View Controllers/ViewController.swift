//
//  ViewController.swift
//  mysky
//
//  Created by Abhiram Alluri on 7/19/21.
//

import UIKit

class ViewController: UIViewController {

//Outlets
    @IBOutlet var Search: UISearchBar!
    @IBOutlet weak var Location: UILabel!
    @IBOutlet weak var HiTemp: UILabel!
    @IBOutlet weak var CurrentTemp: UILabel!
    @IBOutlet weak var Day_Weather: UILabel!
    @IBOutlet weak var UVindex: UILabel!
    @IBOutlet weak var LowTemp: UILabel!
    
    @IBOutlet weak var Day_Night_Icon: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        Location.adjustsFontSizeToFitWidth = true
        CurrentTemp.textColor = UIColor.darkGray
        HiTemp.textColor = UIColor.orange
        LowTemp.textColor = UIColor.systemTeal
        
        Day_Night_Icon.image = UIImage(named:"day")
    }
        
}



