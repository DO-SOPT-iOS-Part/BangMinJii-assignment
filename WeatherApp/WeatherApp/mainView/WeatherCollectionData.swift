//
//  weatherTableData.swift
//  weatherAppBang
//
//  Created by 방민지 on 11/2/23.
//

import UIKit
import SnapKit
import Then

struct WeatherCollectionData {
    let state: String
    let time: String
    let location: String
    let temp: String
    let highTemp: String
    let lowTemp: String
    
    
    init(weatherInfo: WeatherInfoDataModel) {
            self.state = weatherInfo.weather.first?.main ?? ""
            self.time = makeTimeZoneToTime(timeZone: weatherInfo.timezone)
            self.location = weatherInfo.name
            self.temp = String(weatherInfo.main.temp)
            self.highTemp = String(weatherInfo.main.tempMax)
            self.lowTemp = String(weatherInfo.main.tempMin)
        }
}

var weatherCollectionData: [WeatherCollectionData] = []

func makeTimeZoneToTime(timeZone: Int) -> String {
        let today = Date()
        let dateFormatter = DateFormatter()
        dateFormatter.timeZone = TimeZone(secondsFromGMT: timeZone)
        dateFormatter.dateFormat = "HH:mm"
        return dateFormatter.string(from: today)
    }
