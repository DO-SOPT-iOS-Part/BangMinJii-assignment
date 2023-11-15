//
//  WeatherInfoDataModel.swift
//  WeatherApp
//
//  Created by 방민지 on 11/15/23.
//

import UIKit

// MARK: - WeatherInfoDataModel
struct WeatherInfoDataModel: Codable {
    let weather: [Weather]
    let main: Main
    let timezone: Int
    let name: String
    
    enum CodingKeys: String, CodingKey {
        case weather
        case main
        case timezone
        case name = "name"
    }
}

// MARK: - Main
struct Main: Codable {
    let temp, tempMin, tempMax: Double
    

    enum CodingKeys: String, CodingKey {
        case temp
        case tempMin = "temp_min"
        case tempMax = "temp_max"
    }
}

// MARK: - Weather
struct Weather: Codable {
    let main: String
    
    enum CodingKeys: String, CodingKey {
        case main
    }
}

