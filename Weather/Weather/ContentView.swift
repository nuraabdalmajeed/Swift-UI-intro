//
//  ContentView.swift
//  Weather
//
//  Created by nura on 11/22/21.
//

import SwiftUI

struct ContentView: View {
    
    @State private var  isNight = false
    var body: some View {
        ZStack{
            LinearBackGround(isNight: $isNight)
            
            VStack{
                cityNameView(cityName:"Quesna")
                MainTopView(imageName: "cloud.sun.fill", temperature: 70)
                ScrollView(.horizontal ,showsIndicators:true){
                HStack(){
                    ForEach( 0 ..< 7){item in
                    WeatherDayView(dayName: "Tues", dayTemperature: 60, dayImage: "cloud.sun.fill")
                    }
                    
                }
                    
                }
                Spacer()
                
                Button {
                    isNight.toggle()
                    
                } label:{
                    Text("Change Day")
                        .frame(width: 280, height: 50)
                        .foregroundColor(.blue)
                        .background(Color.white)
                        .font(.system(size: 20, weight: .bold, design: .default))
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

struct WeatherDayView: View {
    
    var dayName:String
    var dayTemperature:Int
    var dayImage:String
    var body: some View {
        VStack{
            Text(dayName)
                .padding(.horizontal)
                .font(.system(size: 16, weight: .bold, design: .default))
                .foregroundColor(.white)
            Image(systemName: dayImage)
                .resizable()
                .renderingMode(.original)
                .aspectRatio(contentMode: .fit)
                .frame(width:40  , height: 40)
            Text("\(dayTemperature)")
                .font(.system(size:  16, weight: .bold, design: .default))
                .foregroundColor(.white)
        }
    }
}

struct LinearBackGround: View {
   @Binding var isNight:Bool
    var body: some View {
        LinearGradient(gradient: Gradient(colors: [isNight ?.black:.blue ,isNight ? .gray: Color(#colorLiteral(red: 0.8380859375, green: 1, blue: 1, alpha: 1))]), startPoint: .topLeading, endPoint: .bottomTrailing).edgesIgnoringSafeArea(.all)
    }
}

struct cityNameView: View {
    var cityName:String
    var body: some View {
        Text(cityName)
            .frame(width: 180
                   , height: 40)
            .font(.system(size: 32, weight: .bold, design: .default))
            .foregroundColor(.white)
            .padding()
    }
}

struct MainTopView: View {
    
    var imageName:String
    var temperature:Int
    var body: some View {
        VStack(spacing : 10){
            Image(systemName: imageName)
                .resizable()
                .renderingMode(.original)
                .aspectRatio(contentMode: .fit)
                .frame(width:180, height: 180)
            Text("\(temperature)")
                .font(.system(size: 70, weight: .bold, design: .default))
                .foregroundColor(.white)
            
        }
        .padding(.bottom,40)
    }
}
