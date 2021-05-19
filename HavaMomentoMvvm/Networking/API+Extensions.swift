//
//  API+Extensions.swift
//  HavaMomentoMvvm
//
//  Created by subje bilisim on 19.05.2021.
//

import Foundation

extension API {
    static let baseUrlString = "https://api.openweathermap.org/data/2.5/"
    
    static func getUrlFor(lat:Double,lon:Double)->String{
        return "\(baseUrlString)oncall?lat=\(lat)&lon=\(lon)&exclude=minutely&appid=\(key)&units=imperial"
    }
}
