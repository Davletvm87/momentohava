//
//  ContentView.swift
//  HavaMomentoMvvm
//
//  Created by subje bilisim on 19.05.2021.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var cityVM = CityViewModel()
    var body: some View {
        ZStack(alignment: .bottom) {
            VStack (spacing: 0){
                MenuHeaderView(cityVM: cityVM)
                ScrollView(showsIndicators: false){
                    CityView(cityVM: cityVM)
                }
                
            }.padding(.top ,40)
        }.background(LinearGradient(gradient: Gradient(colors: [Color.blue]), startPoint: .topLeading, endPoint: .bottomLeading))
        .edgesIgnoringSafeArea(.all)
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
