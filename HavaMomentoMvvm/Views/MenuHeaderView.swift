//
//  MenuHeaderView.swift
//  HavaMomentoMvvm
//
//  Created by subje bilisim on 19.05.2021.
//

import SwiftUI

struct MenuHeaderView: View {
    
    @ObservedObject var cityVM: CityViewModel
    
    @State private var searcTerm = "Istnabul"
    
    
    var body: some View {
        HStack{
            TextField("",text: $searcTerm)
                .padding(.leading,20)
            
            Button {
                cityVM.city = searcTerm
            }label:{
                ZStack{
                    RoundedRectangle(cornerRadius: 10)
                        .fill(Color.blue)
                    Image (systemName: "location.fill")
                }
            }
            .frame(width: 50, height: 50)
            
        }.foregroundColor(.white)
        .padding()
        .background(ZStack(alignment:.leading){
            Image (systemName: "magnifyingglass")
                .foregroundColor(.white)
                .padding(.leading,10)
            
            RoundedRectangle(cornerRadius: 10)
                .fill(Color.blue.opacity(0.5))
            
            
        })
            
        }
    }


struct MenuHeaderView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
