//
//  ViewController.swift
//  WeatherAPIWithCoreLocation
//
//  Created by Barış Can Akkaya on 13.06.2021.
//

import UIKit
import CoreLocation

class ViewController: UIViewController {
    @IBOutlet weak var tempLabel: UILabel!
    @IBOutlet weak var locationLabel: UILabel!
    var locationManager: CLLocationManager?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        locationManager = CLLocationManager()
        locationManager?.delegate = self
        locationManager?.requestAlwaysAuthorization()
        
    }


}

extension ViewController: CLLocationManagerDelegate {
    
}
