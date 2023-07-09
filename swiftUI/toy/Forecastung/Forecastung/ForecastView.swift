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
    
    var body: some View {
        VStack {
            Text("현재 위치: \(locationName)")
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
