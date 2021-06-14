//
//  UserModel.swift
//  WeatherAPIWithCoreLocation
//
//  Created by Barış Can Akkaya on 14.06.2021.
//

import Foundation

struct UserModel {
    var latitude: Double?
    var longitude: Double?
}

extension UserModel {
    init(latitude: Double, longitude: Double) {
        self.latitude = latitude
        self.longitude = longitude
    }
}
