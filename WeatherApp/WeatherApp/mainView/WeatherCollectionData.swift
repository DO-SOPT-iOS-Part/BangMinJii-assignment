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
    let temp: Int
    let highTemp: Int
    let lowTemp: Int
    
    
    init(state: String, time: String, location: String, temp: Int, highTemp: Int, lowTemp: Int) {
            self.state = state
            self.time = time
            self.location = location
            self.temp = temp
            self.highTemp = highTemp
            self.lowTemp = lowTemp
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

func translateCityNameToKorean(name: String) -> String {
        let translations: [String: String] = [
            "Seoul": "서울",
            "Jeju City": "제주도",
            "Iksan": "익산",
            "Suwon-si": "수원",
            "Busan": "부산"
        ]
        return translations[name] ?? name
    }
