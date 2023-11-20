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
            
            BackgroundView(topColor: .blue, bottomColor: Color("lightBlue"))
            
            VStack {
                CityTextView(cityName: "Cupertino, CA")
                
                MainWeatherView(mainWeatherImage: "icon-sun-large-cloud",
                                mainTemperature: 76)

                HStack(spacing: 20){
                    WeatherWeekView(dayOfWeek: "SUN",
                                    weatherImage: "icon-sun-large-cloud",
                                    temperature: 60)

                    WeatherWeekView(dayOfWeek: "MON",
                                    weatherImage: "icon-cloud",
                                    temperature: 50)

                    WeatherWeekView(dayOfWeek: "TUES",
                                    weatherImage: "icon-sun-rain-cloud",
                                    temperature: 60)

                    WeatherWeekView(dayOfWeek: "WED",
                                    weatherImage: "icon-sun-rain-cloud",
                                    temperature: 60)
                       
                    WeatherWeekView(dayOfWeek: "THURS",
                                    weatherImage: "icon-sun",
                                    temperature: 80)
                }
                
                Spacer()
                
                Button(action: {
                    print("Button tapped!")
                }) {
                    Text("Change Day Time")
                    .font(.system(size: 20, weight: .bold, design: .default))
                    .foregroundColor(.blue)
                      .frame(width: 280, height: 50)
                     .background(Color.white)
                    .cornerRadius(10)
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

struct BackgroundView: View {
    
    var topColor: Color
    var bottomColor: Color

    
    var body: some View {
        LinearGradient(gradient: Gradient(colors: [topColor, bottomColor]),
                       startPoint: .top,
                       endPoint: .bottomTrailing)
            .edgesIgnoringSafeArea(.all)
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
