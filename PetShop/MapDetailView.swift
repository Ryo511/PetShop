//
//  MapDetailView.swift
//  PetShop
//
//  Created by OLIVER LIAO on 2024/4/30.
//

import SwiftUI
import MapKit

struct MapDetailView: View {
    
    var mapItem: MKMapItem
    
    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
                    Text(mapItem.name ?? "Unknown Location")
                        .font(.title)
                    
                    if let address = mapItem.placemark.title {
                        Text(address)
                            .font(.subheadline)
                            .foregroundColor(.secondary)
                    }
                    
                    // 你可以添加更多地點詳細信息的視圖
                }
                .padding()
                .navigationBarTitle("地點詳情")
    }
}

struct MapDetailView_Previews: PreviewProvider {
    static var previews: some View {
        // 創建一個示例的 MKMapItem 對象
        let mapItem = MKMapItem(placemark: MKPlacemark(coordinate: CLLocationCoordinate2D(latitude: 37.7749, longitude: -122.4194)))
        mapItem.name = "Golden Gate Bridge"
        
        // 在預覽中將 mapItem 傳遞給 MapDetailView
        return MapDetailView(mapItem: mapItem)
            .previewLayout(.sizeThatFits)
    }
}
