//
//  ContentView.swift
//  WeatherForecast
//
//  Created by 박승찬 on 2023/07/01.
//

import SwiftUI
import CoreLocation
import WeatherKit

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

// MARK: - ContentView 바디
struct ContentView: View {
    
    let weatherService = WeatherService.shared
    // 위치관리자 선언을 통해 현재 위치 가져오기 위한 설정
    @StateObject private var locationManager = LocationManager()
    
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundColor(.accentColor)
            Text("Hello, world!")
        }.task(id: locationManager.currentLocation) { //현재 위치가 변할 경우 다시 실행해 줄 수 있도록..
            do {
                if let location = locationManager.currentLocation { //currentLocation이 옵셔널이기 때문에 언랩핑해줘야 해요.
                    let weather = try await weatherService.weather(for: location) // weatherService.weather(for:) 함수는 비동기 함수이기 때문에 try await을 이요해 줍니다.
                }
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
