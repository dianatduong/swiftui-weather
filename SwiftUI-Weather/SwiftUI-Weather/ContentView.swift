//
//  ContentView.swift
//  SwiftUI-Weather
//
//  Created by Diana Duong on 11/18/23.
//  Copyright © 2023 Diana Duong. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ZStack {
            LinearGradient(gradient: Gradient(colors: [.blue, Color("lightBlue")]),
                           startPoint: .top,
                           endPoint: .bottomTrailing)
                .edgesIgnoringSafeArea(.all)
            VStack {
              Text("Cupertino, CA")
                    .font(.system(size: 32, weight: .medium, design: .default))
                    .foregroundColor(.white)
                    .padding()
                
                VStack(spacing: 8) {
                    Image("icon-wind")
                        .renderingMode(.original)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 180, height: 180)
                    
                    Text("76°")
                        .font(.system(size: 70, weight:
                            .medium))
                        .foregroundColor(.white)
                }
                .padding(.bottom, 40)

                HStack(spacing: 10){
                    WeatherWeekView(dayOfWeek: "SUN", weatherImage: "icon-wind", temperature: 60)
                  
                    WeatherWeekView(dayOfWeek: "MON", weatherImage: "icon-cloud", temperature: 50)
                  
                     WeatherWeekView(dayOfWeek: "TUES", weatherImage: "icon-sun-rain-cloud", temperature: 60)
                    
                     WeatherWeekView(dayOfWeek: "WED", weatherImage: "icon-sun-rain-cloud", temperature: 60)
                                           
                     WeatherWeekView(dayOfWeek: "THURS", weatherImage: "icon-sun", temperature: 80)
                }
                
                Spacer()
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}


struct WeatherWeekView: View {
    
    var dayOfWeek: String
    var weatherImage: String
    var temperature: Int
    
    var body: some View {
        VStack{
            Text(dayOfWeek)
                .font(.system(size: 20, weight:
                    .medium))
                .foregroundColor(.white)
            Image(weatherImage)
                .renderingMode(.original)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 55, height: 55)
            
            Text("\(temperature)°")
                .font(.system(size: 30, weight:
                    .medium))
                .foregroundColor(.white)
        }
    }
}
