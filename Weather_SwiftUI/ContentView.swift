//
//  ContentView.swift
//  Weather_SwiftUI
//
//  Created by Sai Charan Thummalapudi on 7/1/24.
//

import SwiftUI

struct ContentView: View {
    @State var isNight = false
    var body: some View {
        ZStack {
            BackgroundView.init(isNightSwitch: isNight)
            VStack {
                Text("Cupertino, CA")
                    .font(.largeTitle)
                    .foregroundColor(.white)
                    .fontWeight(.medium)
                    .padding(70)
                VStack {
                    Image(systemName: "cloud.sun.fill")
                        .renderingMode(.original)
                        .font(.system(size: 125))
                        .padding()
                    
                    Text("76 ° F")
                        .font(.system(size: 35))
                        .fontWeight(.medium)
                        .foregroundColor(.white)
                        .padding(.bottom, 50)
                }
                HStack {
                    WeatherForDay(day: "Tue", imageWeather: "wind.snow", temp: "68°F")
                    WeatherForDay(day: "Tue", imageWeather: "cloud.sun.rain.fill", temp: "67°F")
                    WeatherForDay(day: "Tue", imageWeather: "cloud.sun.bolt.fill", temp: "63°F")
                    WeatherForDay(day: "Tue", imageWeather: "sun.haze.fill", temp: "72°F")
                    WeatherForDay(day: "Tue", imageWeather: "cloud.snow.fill", temp: "54°F")
                }
                Spacer()
                ZStack {
                    Button(action: {
                       isNight.toggle()
                    }) {
                        Text("Change time of day")
                            .foregroundColor(.white)
                            .fontWeight(.medium)
                            .font(.system(size: 25))
                    }
                    .frame(width: 250, height: 50)
                    .background(.blue)
                    .cornerRadius(20)
                    
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
    var isNightSwitch = false
    var body: some View {
        if !isNightSwitch {
            LinearGradient(gradient: Gradient(colors: [.blue , .white]), startPoint: .topLeading, endPoint: .bottomTrailing)
                .ignoresSafeArea()
        }
        else {
        LinearGradient(gradient: Gradient(colors: [.gray , .black]), startPoint: .topLeading, endPoint: .bottomTrailing)
            .ignoresSafeArea()
        }
    }
}
    
struct WeatherForDay: View {
    var day : String
    var imageWeather : String
    var temp : String
    var body: some View {
        VStack {
            Text(day)
                .font(.title)
                .fontWeight(.regular)
                .foregroundColor(.white)
            Image(systemName: imageWeather)
                .renderingMode(.original)
                .font(.largeTitle)
                .frame(width: 50, height: 50)
            Text(String(temp))
                .font(.system(size: 25))
                .fontWeight(.medium)
                .foregroundColor(.white)
                .padding(7)
        }
    }
}

