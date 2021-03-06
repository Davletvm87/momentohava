//
//  CityViewModel.swift
//  HavaMomentoMvvm
//
//  Created by subje bilisim on 19.05.2021.
//

import SwiftUI
import CoreLocation

final class CityViewModel: ObservableObject{
    @Published var weather = WeatherResponse.emty()
    @Published var city: String = "Istanbul"{
        didSet{
            getLocation()
        }
    }
    
    private lazy var dateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateStyle = .full
        return formatter
    }()
    
    
    private lazy var dayFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "EEE"
        return formatter
    }()
    
    private lazy var timeFormatter: DateFormatter = {
        let formatter = DateFormatter ()
        formatter.dateFormat = "hh a"
        return formatter
    }()
    
    init() {
         getLocation()
    }
    
    
    var date: String{
        return dateFormatter.string(from: Date(timeIntervalSince1970: TimeInterval(weather.current.dt)))
    }
    
    var weatherIcon: String{
        if weather.current.weather.count > 0 {
            return weather.current.weather[0].icon
        }
        return "sun.max.fill"
    }
    
    
    var temperature: String{
        return getTempFor(temp: weather.current.temp)
    }
    
    
    var conditions :String {
        if weather.current.weather.count > 0 {
            return weather.current.weather[0].main
        }
        return ""
    }
    
   //ruzgar
    var windSpeed: String{
        return String(format: "%0.1f", weather.current.wind_speed)
    }
    
    
    var humidity: String {
        return String(format: "%d", weather.current.humidity)
    }
    
    //yagislilik
    var rainChanges: String{
        return String(format: "%0.0%%", weather.current.dew_point)
    }
    
    func getTimeFor(timestamp: Int)->String{
        return timeFormatter.string(from: Date(timeIntervalSince1970: TimeInterval(timestamp)))
    }
    
    //derece
    func getTempFor(temp: Double) -> String {
        return String(format: "%0.1f", temp)
    }
    
    //gun
    func getDayFor(timestamp:Int) -> String {
        return dayFormatter.string(from: Date(timeIntervalSince1970: TimeInterval(timestamp)))
    }
    
    
    
    private func getLocation(){
        CLGeocoder().geocodeAddressString(city) {(placemarks, error) in
            if let places = placemarks , let place = places.first{
                self.getWeather(coord: place.location?.coordinate)
            }
        }
        
        
    }
    
    
    private func getWeather (coord: CLLocationCoordinate2D?){
        if let coord = coord {
            let urlString = API.getUrlFor(lat: coord.latitude, lon: coord.longitude)
        getWeatherInternal(city: city, for: urlString)
        } else{
            let urlString = API.getUrlFor(lat: 37.5485, lon: -121.9886)
            getWeatherInternal(city: city, for:urlString)
        }
    }
    
    
    private func getWeatherInternal(city: String, for urlString: String){
        NetworkManager<WeatherResponse>.fetch(for: URL(string: urlString)!) { (result) in
            
            switch result {
            case .success(let response):
                DispatchQueue.main.async {
                    self.weather = response
                }
            case .failure(let err):
                print(err)
            }
    
        }
    }
    
    func getLottieAnimationFor(icon: String) -> String {
        switch icon {
        case "01d":
            return "gunesliBulutsuz"
        case "01n":
            return "yagisli"
        case "02d":
            return "yildirim"
        case "02n":
            return "kar"
        case "03d":
            return "gunesliBulutsuz"
        case "03n":
            return "gunesliBulutsuz"
        case "04d":
            return "gunesliBulutsuz"
        case "04n":
            return "gunesliBulutsuz"
        case "09d":
            return "gunesliBulutsuz"
        case "09n":
            return "gunesliBulutsuz"
        case "10d":
            return "gunesliBulutsuz"
        case "10n":
            return "gunesliBulutsuz"
        case "11d":
            return "gunesliBulutsuz"
        case "11n":
            return "gunesliBulutsuz"
        case "13d":
            return "gunesliBulutsuz"
        case "13n":
            return "gunesliBulutsuz"
        case "50d":
            return "gunesliBulutsuz"
        case "50n":
                return "gunesliBulutsuz"
        default:
            return "gunesliBulutsuz"
        }
    }


    func getWeatherIconFor(icon: String) -> Image {
        switch icon {
        case "01d":
            return  Image(systemName: "sun.max.fill") //
        case "01n":
            return  Image(systemName: "moon.fill")
        case "02d":
            return  Image(systemName: "cloud.sun.fill") //
        case "02n":
            return  Image(systemName: "cloud.moon.fill")
        case "03d":
            return  Image(systemName: "cloud.fill") //
        case "03n":
            return  Image(systemName: "cloud.fill")
        case "04d":
            return  Image(systemName: "cloud.fill") //
        case "04n":
            return  Image(systemName: "cloud.fill")
        case "09d":
            return  Image(systemName: "cloud.drizzle.fill") //
        case "09n":
            return  Image(systemName: "cloud.drizzle.fill")
        case "010d":
            return  Image(systemName: "cloud.heavyrain.fill") //
        case "010n":
            return  Image(systemName: "cloud.heavyrain.fill")
        case "011d":
            return  Image(systemName: "cloud.bolt.fill") //
        case "011n":
            return  Image(systemName: "cloud.bolt.fill")
        case "013d":
            return  Image(systemName: "cloud.snow.fill") //
        case "013n":
            return  Image(systemName: "cloud.snow.fill")
        case "50d":
            return  Image(systemName: "cloud.fog.fill")
        case "50n":
            return  Image(systemName: "cloud.fog.fill")
        default :
            return Image (systemName: "sun.max.fill")
     
        }
    }

    
    
}


