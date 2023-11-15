//
//  detailCollectionData.swift
//  weatherAppBang
//
//  Created by 방민지 on 11/8/23.
//

import UIKit
import SnapKit
import Then

struct DetailCollectionData {
    let state: String
    let time: String
    let temp: String
    
    
    init(state: String, time: String,temp: String) {
        self.state = state
        self.time = time
        self.temp = temp
    }
}

var detailCollectionData: [DetailCollectionData] = [
    .init(state: "nightCloud", time: "Now", temp: "21°"),
    .init(state: "foxRain", time: "10시", temp: "21°"),
    .init(state: "thunder", time: "11시", temp: "19°"),
    .init(state: "foxRain", time: "12시", temp: "21°"),
    .init(state: "nightCloud", time: "13시", temp: "20°"),
    .init(state: "foxRain", time: "14시", temp: "22°"),
    .init(state: "thunder", time: "15시", temp: "19°"),
    .init(state: "foxRain", time: "16시", temp: "18°"),
    .init(state: "foxRain", time: "19시", temp: "14°"),
    .init(state: "thunder", time: "20시", temp: "12°")]
