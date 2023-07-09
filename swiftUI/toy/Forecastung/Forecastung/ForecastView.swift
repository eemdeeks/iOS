//
//  ForecastView.swift
//  Forecastung
//
//  Created by 박승찬 on 2023/07/09.
//

import SwiftUI
import CoreLocation
import WeatherKit
struct ForecastView: View {
    
    let weatherService = WeatherService.shared
    // 위치관리자 선언을 통해 현재 위치 가져오기 위한 설정
    @StateObject private var locationManager = LocationManager()
    @State private var weather: Weather?    //날씨를 받아오기 위한 State 변수 선언
    @State var locationName: String = ""    //현재 위치의 지역명을 받아오기 위한 변수
    
    
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
        GeometryReader{ geo in
            VStack {
                HStack{
                    Image(systemName: "location.fill")
                    
                    Text("\(locationName)")
                        .font(.headline)
                }
                if let weather {
                    HStack{
                        
                        Text("\(weather.dailyForecast[0].lowTemperature.formatted())")
                            .font(.largeTitle)
                            .foregroundColor(.gray)
                        Text("\(weather.currentWeather.temperature.formatted())")
                            .font(.largeTitle)
                        Text("\(weather.dailyForecast[0].highTemperature.formatted())")
                            .font(.largeTitle)
                            .foregroundColor(.gray)
                        
                        
                    }
                    .padding()
                    switch weather.currentWeather.condition {
                    case .clear:
                        Text("오늘은 날씨가 맑아요 ☀️")
                    case .mostlyCloudy, .cloudy:
                        Text("오늘은 구름이 꼈어요 ☁️")
                    case .partlyCloudy:
                        Text("오늘은 구름이 조금 있어요 ⛅️")
                    case .windy:
                        Text("오늘은 바람이 불어요 💨")
                    case .rain:
                        Text("오늘은 비가 와요 ☔️")
                    case .hot:
                        Text("오늘은 너무 더워요 🥵")
                    default:
                        Text("날씨를 알려드릴게요!🌈")
                    }
                }
                
                Spacer()
                Image("HotUng")
                    .resizable()
                    .scaledToFit()
                    .offset(y: 50)
                    .frame(width: geo.size.width)
            }
        }
        
        .padding()
        .task(id: locationManager.currentLocation) {
            do {
                if let location = locationManager.currentLocation {
                    
                    // MARK: - 현재위치 위도경도 이용해서 지역 명 가져오기
                    let geocoder = CLGeocoder()
                    let locale = Locale(identifier: "Ko-kr")
                    geocoder.reverseGeocodeLocation(location, preferredLocale: locale) { (placemarks, error) in
                        if let address: [CLPlacemark] = placemarks {
                            if let subLocality: String = address.last?.subLocality, let locality: String = address.last?.locality {
                                self.locationName = "\(locality) \(subLocality)"
                            }
                        }
                        
                    }
                    
                    self.weather = try await weatherService.weather(for: location)
                }
            } catch {
                print(error)
            }
        }
    }
    
}

struct ForecastView_Previews: PreviewProvider {
    static var previews: some View {
        ForecastView()
    }
}
