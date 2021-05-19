//
//  CityView.swift
//  HavaMomentoMvvm
//
//  Created by subje bilisim on 19.05.2021.
//

import SwiftUI

struct CityView: View {
    @ObservedObject var cityVM: CityViewModel
    
    
    var body: some View {
        VStack{
            CityNameView(city: cityVM.city, date: cityVM.date)
                .shadow(radius: 0)
            TodayWeatherView(cityVM: cityVM)
                .padding()
            HourlyWeatherView(cityVM: cityVM)
            DailyWeatherView(cityVm: cityVM)
            
        }.padding(.bottom,30)
    }
}

struct CityView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
