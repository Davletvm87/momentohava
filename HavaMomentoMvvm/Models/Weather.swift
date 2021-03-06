//
//  Weather.swift
//  HavaMomentoMvvm
//
//  Created by subje bilisim on 19.05.2021.
//

import Foundation


struct Weather : Codable,Identifiable {
    var dt: Int
    var temp: Double
    var feel_like: Double
    var pressure: Double
    var humidity: Int
    var dew_point: Double
    var clouds: Int
    var wind_speed: Double
    var wind_deg:Int
    var weather : [WeatherDetail]
    
    
    enum CodingKey: String {
        case dt
        case temp
        case feel_like
        case pressure
        case humidity
        case dew_point
        case clouds
        case wind_deg
        case wind_speed
        case weather
    }
    
    init()  {
        dt = 0
        temp = 0.0
        feel_like = 0.0
        pressure = 0.0
        humidity = 0
        dew_point = 0.0
        clouds = 0
        wind_speed = 0.0
        wind_deg = 0
        weather = []
    }
    
    
}
extension Weather {
    var id : UUID{
        return UUID()
    }
}

