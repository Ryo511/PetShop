//
//  FirstView.swift
//  PetShop
//
//  Created by OLIVER LIAO on 2024/3/5.
//

import SwiftUI
import WebKit

struct FirstView: View {
    var body: some View {
        HStack {
            WebView(url: URL(string: "https://tomspet.official.ec")!)
                .edgesIgnoringSafeArea(.all)
        }
        .padding()
    }
}


struct WebView: UIViewRepresentable {
    let url: URL
    
    func makeUIView(context: Context) -> WKWebView {
        return WKWebView()
    }
    
    func updateUIView(_ uiView: WKWebView, context: Context) {
        let request = URLRequest(url: url)
        uiView.load(request)
    }
}


#Preview {
    FirstView()
}
