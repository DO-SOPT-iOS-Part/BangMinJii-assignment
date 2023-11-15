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
    
    
    init(state: String, time: String, location: String, temp: String, highTemp: String, lowTemp: String) {
        self.state = state
        self.time = time
        self.location = location
        self.temp = temp
        self.highTemp = highTemp
        self.lowTemp = lowTemp
    }
}

var weatherCollectionData: [WeatherCollectionData] = [.init(state: "흐림", time: "의정부시", location: "나의위치",                                               temp: "21°", highTemp: "최고:29°", lowTemp: "최저:15°" ),
                                                      .init(state: "부분적으로 흐림", time: "오후 6:20", location: "고양시", temp: "10°", highTemp: "최고:20°", lowTemp: "최저:5°" ),
                                                      .init(state: "맑음", time: "오전 11:20", location: "서귀포시", temp: "26°", highTemp: "최고:29°", lowTemp: "최저:15°" ),
                                                      .init(state: "화창함", time: "오후 7:30", location: "제주시", temp: "21°", highTemp: "최고:29°", lowTemp: "최저:15°" ),
                                                      .init(state: "맑음", time: "오후 6:40", location: "부산광역시", temp: "21°", highTemp: "최고:29°", lowTemp: "최저:15°" ),
                                                      .init(state: "흐림", time: "오전 10:20", location: "서울특별시", temp: "21°", highTemp: "최고:29°", lowTemp: "최저:15°" ),
                                                      .init(state: "맑음", time: "오전 6:40", location: "오로라", temp: "21°", highTemp: "최고:29°", lowTemp: "최저:15°" ),
                                                      .init(state: "대체로 맑음", time: "오전 8:37", location: "뉴욕", temp: "21°", highTemp: "최고:29°", lowTemp: "최저:15°" ),
                                                      .init(state: "화창함", time: "오후 6:22", location: "뉴저지", temp: "21°", highTemp: "최고:29°", lowTemp: "최저:15°" ),
                                                      .init(state: "눈부심", time: "오전 10:29", location: "니마음속", temp: "21°", highTemp: "최고:29°", lowTemp: "최저:15°" )]
