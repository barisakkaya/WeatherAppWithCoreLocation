//
//  WeatherService.swift
//  WeatherAPIWithCoreLocation
//
//  Created by Barış Can Akkaya on 14.06.2021.
//

import Foundation

class WeatherService {
    func getWeatherFeatures(url: String, completionHandler: @escaping (WeatherModel?) -> ()) {
        let weatherURL = URL(string: url)
        if let weatherURL = weatherURL {
            URLSession.shared.dataTask(with: weatherURL) { data, response, error in
                if let error = error {
                    print(error.localizedDescription)
                    completionHandler(nil)
                } else if let data = data {
                    let decodedData = try? JSONDecoder().decode(WeatherModel.self, from: data)
                    if let decodedData = decodedData {
                        completionHandler(decodedData)
                    }
                }
            }.resume()
        }
    }
}
