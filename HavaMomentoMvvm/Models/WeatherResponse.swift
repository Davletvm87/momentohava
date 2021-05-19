//
//  WeatherResponse.swift
//  HavaMomentoMvvm
//
//  Created by subje bilisim on 19.05.2021.
//

import Foundation


struct WeatherResponse: Codable {
    var current : Weather
    var hourly: [Weather]
    var daily: [DailyWeather]
    
    static func emty() -> WeatherResponse{
        return WeatherResponse (current: Weather(), hourly: [Weather](repeating: Weather(), count: 23), daily: [DailyWeather](repeating: DailyWeather(), count: 8))
    }
}
