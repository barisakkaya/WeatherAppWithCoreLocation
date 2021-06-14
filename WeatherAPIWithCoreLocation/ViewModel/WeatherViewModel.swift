//
//  WeatherViewModel.swift
//  WeatherAPIWithCoreLocation
//
//  Created by Barış Can Akkaya on 14.06.2021.
//

import Foundation

struct WeatherViewModel {
    let viewModel: WeatherModel?
    
}

extension WeatherViewModel {
    init(viewModel: WeatherModel) {
        self.viewModel = viewModel
    }
    
    var location: String {
        if let model = viewModel {
            return model.name
        } else {
            return "Unknown"
        }
    }
    
    var temperature: String {
        if let model = viewModel {
            return String(format:"%.1f",model.main.temp)
        } else {
            return "Unknown"
        }
    }
}

