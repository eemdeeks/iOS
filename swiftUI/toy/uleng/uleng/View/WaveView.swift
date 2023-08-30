//
//  WaveView.swift
//  uleng
//
//  Created by 박승찬 on 2023/08/24.
//

import SwiftUI
import CoreMotion
import SpriteKit
import CoreLocation
import WeatherKit

let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()

struct WaveView: View {
    @ObservedObject var viewModel = GameScene()
    
    let weatherService = WeatherService.shared
    // 위치관리자 선언을 통해 현재 위치 가져오기 위한 설정
    @StateObject private var locationManager = LocationManager()
    @State private var weather: Weather?    //날씨를 받아오기 위한 State 변수 선언
    @State var locationName: String = ""    //현재 위치의 지역명을 받아오기 위한 변수
    
    var motionManager = CMMotionManager()

    @State private var gravityY : Double = 0
    @State private var gravityZ : Double = 0
    @State private var Position : String = "Move Me"
    
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
    
    var scene: SKScene {
        let scene = GameScene()
        scene.size = CGSize(width: 300, height: 400)
//        scene.physicsWorld.gravity = CGVector(dx: gravityX, dy: 0.0)
        
        scene.scaleMode = .fill
        scene.backgroundColor = .white
        return scene
    }

    var body : some View {
        ZStack{
            VStack{
                SpriteView(scene: viewModel)
    //                .task(id: gravityX) {
    //                    scene.physicsWorld.gravity = CGVector(dx: gravityX, dy: 0.0)
    //                    print("중력 : \(scene.physicsWorld.gravity)")
    //                }
                Text("Gravity XYZ")
                Text("\(viewModel.gravityX)")
                Text("\(gravityY)")
                Text("\(gravityZ)")

                Text(Position)
            }
            .onReceive(timer) { input in
                print(motionManager.isDeviceMotionAvailable)
                if motionManager.isDeviceMotionAvailable {
                    motionManager.deviceMotionUpdateInterval = 0.3
                    
                    motionManager.startDeviceMotionUpdates(to: OperationQueue.main) { data,error in
                        print("Gravity XYZ")
                        viewModel.gravityX = data?.gravity.x ?? 0
                        viewModel.gravityY = data?.gravity.y ?? 0
                        gravityZ = data?.gravity.z ?? 0
    //                    if gravityX < -0.9
    //                    {
    //                        Position = "Standing + Landscape + Speaker Left"
    //                    }
    //                    else if gravityX > 0.9
    //                    {
    //                        Position = "Standing + Landscape + Speaker Right"
    //                    }
    //                    else if gravityY < -0.9
    //                    {
    //                        Position = "Standing + Portrait + Speaker Up"
    //                    }
    //                    else if gravityY > 0.9
    //                    {
    //                        Position = "Standing + Portrait + Speaker Down"
    //                    }
    //                    else if gravityZ < -0.9
    //                    {
    //                        Position = "Flat + Facing Up"
    //                    }
    //                    else if gravityZ > 0.9
    //                    {
    //                        Position = "Flat + Facing Down"
    //                    }
    //                    else
    //                    {
    //                        Position = "Not at right angles"
    //                    }

                        print(data?.gravity.x ?? 0)
                        print(data?.gravity.y ?? 0)
                        print(data?.gravity.z ?? 0)
                        print("User Acceleration")
                        print(data?.userAcceleration.x ?? 0)
                        print(data?.userAcceleration.y ?? 0)
                        print(data?.userAcceleration.z ?? 0)
                        print("Heading")
                        print(data?.heading.debugDescription ?? 0)
                        print(data?.heading.magnitude ?? 0)
                        print(data?.heading.sign ?? 0)
                        print("Attitude")
                        print(data?.attitude.debugDescription ?? 0)
                        print(data?.attitude.pitch ?? 0)
                        print(data?.attitude.roll ?? 0)
                        print(data?.attitude.yaw ?? 0)
                        print("Magnetic Field")
                        print(data?.magneticField.field.x ?? 0)
                        print(data?.magneticField.field.y ?? 0)
                        print(data?.magneticField.field.z ?? 0)
                    }
                }
            }
            VStack {
                HStack{
                    Image(systemName: "location.fill").onAppear{
                        print("지역 이름: \(locationManager.currentLocation)")
                    }
                    
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
            }
        }
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
struct WaveView_Previews: PreviewProvider {
    static var previews: some View {
        WaveView()
    }
}
