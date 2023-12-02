//
//  WeatherButton.swift
//  SwiftUI-Weather
//
//  Created by Diana Duong on 11/20/23.
//  Copyright © 2023 Diana Duong. All rights reserved.
//

import SwiftUI

struct WeatherButton: View {
    
    var title: String
    var textColor: Color
    var backgroundColor: Color
    
    var body: some View {
        Text(title)
            .font(.system(size: 20, weight: .bold, design: .default))
            .foregroundColor(textColor)
            .frame(width: 280, height: 50)
            .background(backgroundColor)
            .cornerRadius(10)
    }
}
