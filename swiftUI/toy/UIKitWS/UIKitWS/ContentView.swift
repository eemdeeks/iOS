//
//  ContentView.swift
//  UIKitWS
//
//  Created by 박승찬 on 2023/07/06.
//

import SwiftUI
import MapKit

final class RedViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .red
    }
}

struct RedViewControllerRepresentable: UIViewControllerRepresentable {
    func makeUIViewController(context: Context) -> some UIViewController {
        return RedViewController()
    }
    
    func updateUIViewController(_ uiViewController: UIViewControllerType, context: Context) {
        
    }
    
    
}

struct ContentView: View {
    private var mapViewModel = MapViewModel()
    private let number: Int = 3
    
    var body: some View {
        MapViewRepresentable(viewModel: mapViewModel)
    }
}

//NSObject를 상속하는 클래스만 채택할 수 있는 delegate프로토콜이라서 클래스 만들어 줘야함.

class MapViewModel: NSObject, MKMapViewDelegate {

    func callMap() {
        
    }
    func mapViewWillStartLoadingMap(_ mapView: MKMapView) {
        print("Start loading ..")
    }
}

struct MapViewRepresentable: UIViewRepresentable {
    let viewModel: MapViewModel
    
    func makeUIView(context: Context) -> some UIView {
        let mapView = MKMapView()
        mapView.delegate = viewModel
        return mapView
    }
    func updateUIView(_ uiView: UIViewType, context: Context) {
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

