//
//  LocationManager.swift
//  uleng
//
//  Created by 박승찬 on 2023/08/29.
//

import Foundation

import Foundation
import CoreLocation

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
