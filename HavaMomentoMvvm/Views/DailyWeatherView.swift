//
//  DailyWeatherView.swift
//  HavaMomentoMvvm
//
//  Created by subje bilisim on 19.05.2021.
//

import SwiftUI

struct DailyWeatherView: View {
    @ObservedObject var cityVm: CityViewModel
    
    var body: some View {
        ForEach(cityVm.weather.daily){ weather in
            LazyVStack{
                //
            }
            
        }
    }
    
    
    private func dailyCell(weather:DailyWeather)->some View{
        HStack{
            Text(cityVm.getDayFor(timestamp: weather.dt).uppercased())
                .frame(width: 59)
            Spacer()
            
            Text(" \(cityVm.getTimeFor(timestamp:Int(weather.temp.max)))| \(cityVm.getTempFor(temp: weather.temp.min)) F")
                .frame(width: 150)
            Spacer()
            cityVm.getWeatherIconFor(icon: weather.weather.count > 0 ? weather.weather[0].icon: "sun.max.fill")
        }
        .foregroundColor(.white)
        .padding(.horizontal,40)
        .padding(.vertical,15)
        
        .background(RoundedRectangle(cornerRadius: 20).fill(LinearGradient(gradient: Gradient(colors: [Color.blue.opacity(0.5),Color.blue]), startPoint: .top, endPoint: .bottom)).opacity(0.3))
        .shadow(color: Color.white.opacity(0.1), radius: 2, x: -2, y: -2)
        .shadow(color: Color.black.opacity(0.2), radius: 2, x: 2, y: 2)
        
    }
}

struct DailyWeatherView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
