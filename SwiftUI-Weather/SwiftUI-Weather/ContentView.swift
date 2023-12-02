//
//  ContentView.swift
//  SwiftUI-Weather
//
//  Created by Diana Duong on 11/18/23.
//  Copyright © 2023 Diana Duong. All rights reserved.
//

import SwiftUI

struct ContentView: View {
//structs are value types - they get destroyed and recreated
    
    //@State property allows a struct to hold a state
    @State private var isNight = false
    
    var body: some View {
        ZStack {
            
            BackgroundView(isNight: $isNight)
            
            VStack {
                CityTextView(cityName: "Cupertino, CA")
                
                MainWeatherView(mainWeatherImage: isNight ? "icon-moon-cloud" : "icon-sun-large-cloud",
                                mainTemperature: 76)

                HStack(spacing: 20){
                    WeatherWeekView(dayOfWeek: "SUN",
                                    weatherImage: isNight ? "icon-moon-cloud" : "icon-cloud",
                                    temperature: 60)

                    WeatherWeekView(dayOfWeek: "MON",
                                    weatherImage: isNight ? "icon-cloud-rain" : "icon-cloud",
                                    temperature: 50)

                    WeatherWeekView(dayOfWeek: "TUES",
                                    weatherImage: isNight ? "icon-moon-stars" : "icon-sun-rain-cloud",
                                    temperature: 60)

                    WeatherWeekView(dayOfWeek: "WED",
                                    weatherImage: "icon-cloud-rain",
                                    temperature: 60)
                       
                    WeatherWeekView(dayOfWeek: "THURS",
                                    weatherImage: isNight ? "icon-moon" : "icon-sun",
                                    temperature: 80)
                }
                
                Spacer()
                
                Button(action: {
                    self.isNight.toggle()
                }) {
                    WeatherButton(title: "Change Day Time",
                                  textColor: isNight ? .white : .blue,
                                  backgroundColor: isNight ? .black : .white)
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

struct BackgroundView: View {
    
    @Binding var isNight: Bool
    
    var body: some View {
        
        //if topColor is night = change the top gradient to black else change to blue
        //if bottom color is night = change the bottom gradient to gray else change to light blue
        LinearGradient(gradient: Gradient(colors: [ isNight ? .black : .blue,
                                                    isNight ? .gray : Color("lightBlue")]),
                       startPoint: .top,
                       endPoint: .bottomTrailing)
            .edgesIgnoringSafeArea(.all)
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

struct CityTextView: View {
    
    var cityName: String
    
    var body: some View {
        Text(cityName)
            .font(.system(size: 32, weight: .medium, design: .default))
            .foregroundColor(.white)
            .padding(.top, 40)
    }
}

struct MainWeatherView: View {
    
    var mainWeatherImage: String
    var mainTemperature: Int
    
    var body: some View {
        VStack(spacing: 8) {
            Image(mainWeatherImage)
                .renderingMode(.original)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 180, height: 180)
            
            Text("\(mainTemperature)°")
                .font(.system(size: 70, weight:
                    .medium))
                .foregroundColor(.white)
        }
        .padding(.bottom, 40)
    }
}



