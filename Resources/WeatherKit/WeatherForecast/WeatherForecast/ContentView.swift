//
//  ContentView.swift
//  WeatherForecast
//
//  Created by 박승찬 on 2023/07/01.
//

import SwiftUI
import CoreLocation
import WeatherKit
import Charts

// MARK: - 현재위치 설정하기
class LocationManager: NSObject, ObservableObject {
    
    @Published var currentLocation: CLLocation?
    private let locationManager = CLLocationManager()
    
    override init() {
        super.init()
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.distanceFilter = kCLDistanceFilterNone
        locationManager.requestAlwaysAuthorization()
        locationManager.startUpdatingLocation()
        locationManager.delegate = self
    }
}

// 위치 정보를 가장최근 위치로 하여 현재위치 조정하기
extension LocationManager: CLLocationManagerDelegate {
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let location = locations.last, currentLocation == nil else {return} // 현재위치가 nil이 아닐경우 return해주고 nil일 경우 현재 위치 조정해주기 위한 guard문
        
        DispatchQueue.main.async {
            self.currentLocation = location
        }
    }
}

// MARK: - 날짜 표시 방법 변경(ex. Sunday -> Sun)
extension Date {
    func formatAsAbbreviatedDay() -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "EEE"
        return formatter.string(from: self)
    }
    
    func formatAsAbbreviatedTime() -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "ha"
        return formatter.string(from: self)
    }
}

// MARK: - 시간대별 예보를 보기 위한 뷰
struct HourlyForcastView: View {
    
    let hourWeatherList: [HourWeather]
    
    var body: some View {
        VStack(alignment: .leading) {
            Text("Hourly Forecast")
                .font(.caption)
                .opacity(0.5)
            
            ScrollView(.horizontal) {
                HStack {
                    ForEach(hourWeatherList, id: \.date) { hourWeatherItem in
                        VStack(spacing: 20) {
                            //Text(hourWeatherItem.date.formatted(date: .omitted, time: .shortened))
                            Text(hourWeatherItem.date.formatAsAbbreviatedTime())
                            Image(systemName: "\(hourWeatherItem.symbolName).fill")
                                .foregroundColor(.yellow)
                            Text(hourWeatherItem.temperature.formatted())
                                .fontWeight(.medium)
                        }.padding()
                        
                    }
                }
            }
        }.padding().background{
            Color.blue
        }.clipShape(RoundedRectangle(cornerRadius: 10.0, style: .continuous))
            .foregroundColor(.white)
    }
}

// MARK: - 10일후까지의 예보 보기위한 뷰
struct TenDayForecastView: View {
    
    let dayWeatherList: [DayWeather]
    
    var body: some View {
        VStack(alignment: .leading) {
            Text("10-day forecast")
                .font(.caption)
                .opacity(0.5)
            
            List(dayWeatherList, id: \.date) { dailyWeather in
                HStack {
                    Text(dailyWeather.date.formatAsAbbreviatedDay())
                        .frame(maxWidth: 50, alignment: .leading)
                    Image(systemName: "\(dailyWeather.symbolName).fill")
                        .foregroundColor(.yellow)
                    Text(dailyWeather.lowTemperature.formatted())
                        .frame(maxWidth: .infinity)
                    Text(dailyWeather.highTemperature.formatted())
                        .frame(maxWidth: .infinity, alignment: .trailing)
                    
                }.listRowBackground(Color.blue)
                
            }.listStyle(.plain)
            
        }
        .frame(height: 300)
        .padding()
        .background(content: {
            Color.blue
        })
        .clipShape(RoundedRectangle(cornerRadius: 10.0, style: .continuous))
        .foregroundColor(.white)
    }
}

// MARK: - 시간대별 온도 그래프 뷰
struct HourlyForecastChartView: View {
    
    let hourlyWeatherData: [HourWeather]
    
    var body: some View {
        Chart {
            ForEach(hourlyWeatherData.prefix(10),id: \.date) { hourlyWeather in
                PointMark(x: .value("Hour", hourlyWeather.date.formatAsAbbreviatedTime()), y: .value("Temperature", hourlyWeather.temperature.converted(to: .fahrenheit).value))    // 점 그래프
//                BarMark(x: .value("Hour", hourlyWeather.date.formatAsAbbreviatedTime()), y: .value("Temperature", hourlyWeather.temperature.converted(to: .fahrenheit).value))  // 막대 그래프
                
//                LineMark(x: .value("Hour", hourlyWeather.date.formatAsAbbreviatedTime()), y: .value("Temperature", hourlyWeather.temperature.converted(to: .fahrenheit).value))   // 선 그래프
            }
        }
    }
}

// MARK: - ContentView 바디
struct ContentView: View {
    
    let weatherService = WeatherService.shared
    // 위치관리자 선언을 통해 현재 위치 가져오기 위한 설정
    @StateObject private var locationManager = LocationManager()
    @State private var weather: Weather?    //날씨를 받아오기 위한 State 변수 선언
    
    // 시간별 데이터를 가져올 때 현재 시간보다 24시간 뒤까지만 가져오도록 하기 위한 코드
    var hourlyWeatherData: [HourWeather] {
        if let weather {
            return Array(weather.hourlyForecast.filter{ hourlyWeather in
                return hourlyWeather.date.timeIntervalSince(Date()) >= 0
            }.prefix(24))
        } else {
            return []
        }
    }
    
    var body: some View {
        VStack {
            if let weather {
                VStack {
                    Text("포항")
                        .font(.largeTitle)
                    
                    Text("\(weather.currentWeather.temperature.formatted())")
                }
                
                // 시간대별 예보 뷰
                HourlyForcastView(hourWeatherList: hourlyWeatherData)
                
                //Spacer()
                
                // 시간대별 온도 차트로 보는 뷰
                HourlyForecastChartView(hourlyWeatherData: hourlyWeatherData)
                
                // 10일후까지의 예보 뷰
                TenDayForecastView(dayWeatherList: weather.dailyForecast.forecast)
            }
        }
        .padding()
        .task(id: locationManager.currentLocation) { //현재 위치가 변할 경우 다시 실행해 줄 수 있도록..
            do {
                //if let location = locationManager.currentLocation {     //currentLocation이 옵셔널이기 때문에 언랩핑해줘야 해요.
                                                                        //currentLocation으로 할경우 계속 업데이트 해주기 때문에 위치를 따로 지정해 주기 위해 location을 다시 설정해주기로 했어요.
                                                                        //현재 위치를 사용하기 위해서는 이 코드를 사용하면 돼요.
                    let location = CLLocation(latitude: 36.01409, longitude: 129.32596) //포항공대 c5 위치
                    self.weather = try await weatherService.weather(for: location) // weatherService.weather(for:) 함수는 비동기 함수이기 때문에 try await을 이용해 줍니다.
                    print(weather)
                //}
            } catch {
                print(error)
            }
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
