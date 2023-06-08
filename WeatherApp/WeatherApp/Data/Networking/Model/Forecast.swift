//
//  Forecast.swift
//  WeatherApp
//
//  Created by Văn Khánh Vương on 08/06/2023.
//

import Foundation

struct Temp: Codable {
    let min: Double
    let max: Double
    let day: Double // Nhiệt độ ban ngày.
    let night: Double // Nhiệt độ ban đêm.
    let eve: Double // Nhiệt độ buổi tối.
    let morn: Double // Nhiệt độ buổi sáng.
}

struct Weather: Codable {
    let id: Int
    let main: String
    let description: String
    let icon: String
    var weatherIconURL: URL {
        let urlString = "https://openweathermap.org/img/wn/\(icon)@2x.png"
        return URL(string: urlString)!
    }
}

struct Daily: Codable {
    let dt: Date
    let temp: Temp
    let humidity: Int
    let weather: [Weather]
    let clouds: Int
    let pop: Double // Xac suat mua
}

struct Forecast: Codable {
    let daily:[Daily]
}

