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
    
    var weatherVM: WeatherViewModel?
    var locationManager = CLLocationManager()
    var userModel: UserModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        locationManager.delegate = self
        locationManager.requestWhenInUseAuthorization()
        locationManager.requestLocation()
        
    }
    
    
}



//MARK: - ViewController

extension ViewController {
    func getProperties(userModel: UserModel) {
        let url = "https://api.openweathermap.org/data/2.5/weather?lat=\(userModel.latitude!)&lon=\(userModel.longitude!)&appid=a09ee526355bc421b09df90fe76ee86c&units=metric"
        WeatherService().getWeatherFeatures(url: url) { weatherModel in
            if let weatherModel = weatherModel {
                self.weatherVM = WeatherViewModel(viewModel: weatherModel)
                DispatchQueue.main.async {
                    if let weatherVM = self.weatherVM {
                        self.tempLabel.text = "Temperature: \(weatherVM.temperature) °C"
                        self.locationLabel.text = "Your Location: \(weatherVM.location)"
                        
                    }
                }
            }
        }
    }
}

//MARK: - CLLocationManagerDelegate

extension ViewController: CLLocationManagerDelegate {
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        if let location = locations.last {
            locationManager.stopUpdatingLocation()
            let latitude = location.coordinate.latitude
            let longitude = location.coordinate.longitude
            userModel = UserModel(latitude: latitude, longitude: longitude)
            if let userModel = userModel {
                getProperties(userModel: userModel)
            }
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print(error.localizedDescription)
    }
}
