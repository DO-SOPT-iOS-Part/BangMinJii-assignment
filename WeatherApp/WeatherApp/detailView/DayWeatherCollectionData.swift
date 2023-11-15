//
//  DayWeatherCollectionData.swift
//  weatherAppBang
//
//  Created by 방민지 on 11/9/23.
//

import UIKit
import SnapKit
import Then

struct DayWeatherCollectionData {
    let day: String
    let image: String
    let percentage: String?
    let lowTemp: String
    let tempBar: String
    let highTemp: String
    
    
    init(day: String, image: String, percentage: String?, lowTemp: String, tempBar: String, highTemp: String) {
        self.day = day
        self.image = image
        self.percentage = percentage
        self.lowTemp = lowTemp
        self.tempBar = tempBar
        self.highTemp = highTemp
    }
}

var dayWeatherCollectionData: [DayWeatherCollectionData] = [
    .init(day: "오늘", image: "sun", percentage: nil, lowTemp: "15°", tempBar: "frame1", highTemp: "29°"),
    .init(day: "월", image: "rainy", percentage: "60%", lowTemp: "18°", tempBar: "frame2", highTemp: "27°"),
    .init(day: "화", image: "rainy", percentage: "60%", lowTemp: "20°", tempBar: "frame3", highTemp: "25°"),
    .init(day: "수", image: "rainy", percentage: "70%", lowTemp: "17°", tempBar: "frame4", highTemp: "25°"),
    .init(day: "목", image: "rainy", percentage: "50%", lowTemp: "17°", tempBar: "frame5", highTemp: "25°"),
    .init(day: "금", image: "sun", percentage: nil, lowTemp: "20°", tempBar: "frame6", highTemp: "26°"),
    .init(day: "토", image: "sun", percentage: nil, lowTemp: "18°", tempBar: "frame7", highTemp: "25°"),
    .init(day: "일", image: "rainy", percentage: "50%", lowTemp: "13°", tempBar: "frame8", highTemp: "21°"),
    .init(day: "월", image: "rainy", percentage: "50%", lowTemp: "12°", tempBar: "frame9", highTemp: "19°"),
    .init(day: "화", image: "sun", percentage: nil, lowTemp: "18°", tempBar: "frame10", highTemp: "25°"),
    .init(day: "수", image: "sun", percentage: nil, lowTemp: "18°", tempBar: "frame11", highTemp: "25°")
    ]
