//
//  SearchView.swift
//  PetShop
//
//  Created by OLIVER LIAO on 2024/3/5.
//

import SwiftUI
import MapKit

struct SearchView: View {
    @State private var mapItem: [MKMapItem] = []
    @State private var searchText: String = ""
    
    var body: some View {
        VStack {
            TextField("ここで検索", text: $searchText) {
                searchBar(for: "ペット")
            }
            .padding()
            
            Map {
                Marker("新宿区", systemImage: "house", coordinate: .shinjukuku)
                    .tint(.blue)
                ForEach(mapItem, id: \.self) { result in
                    Marker(item: result)
                }
                
//                Marker("中野区", systemImage: "house", coordinate: .nakanoku)
//                    .tint(.brown)
//                ForEach(mapItem, id: \.self) { result in
//                    Marker(item: result)
//                }
            }
        }
    }
    
    
    func searchBar(for query: String) {
        let request = MKLocalSearch.Request()
        request.naturalLanguageQuery = query
        request.resultTypes = .pointOfInterest
        request.region = MKCoordinateRegion(
            center: .nakanoku,
            span: MKCoordinateSpan(latitudeDelta: 0.01, longitudeDelta: 0.01)
        )
        request.region = MKCoordinateRegion(
            center: .shinjukuku,
            span: MKCoordinateSpan(latitudeDelta: 0.01, longitudeDelta: 0.01)
            )
        
        Task {
            let search = MKLocalSearch(request: request)
            let response = try? await search.start()
            mapItem = response?.mapItems ?? []
        }
    }
}

extension CLLocationCoordinate2D {
    static let shinjukuku = CLLocationCoordinate2D(latitude: 35.7016514, longitude: 139.6679976)
    static let nakanoku = CLLocationCoordinate2D(latitude: 35.7061273, longitude: 139.6180623)
}



struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        SearchView()
    }
}
