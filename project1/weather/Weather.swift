//
//  Weather.swift
//  weather
//
//  Created by 李炳超 on 12/13/23.
//

import Foundation

struct Weather: Codable {
    let cityCode: String
    let city: String
    let temperature: Int
    let conditions: String
}


