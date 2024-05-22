//
//  ContentView.swift
//  PetShop
//
//  Created by OLIVER LIAO on 2024/2/17.
//

import SwiftUI
import WebKit

struct ContentView: View {
    
    let totalpage = 10
    
    var body: some View {
        NavigationView {
            ZStack {
                Rectangle()
                    .frame(width: 420, height: 300)
                    .foregroundColor(.gray.opacity(0.3))
                    .offset(CGSize(width: 10.0, height: 510.0))
                
                WebView(url: URL(string: "https://tomspet.official.ec")!)
                    .edgesIgnoringSafeArea(.all)
                
                //                ScrollViewReader(content: { proxy in
                //                    LazyVStack {
                //                        ForEach(0..<self.totalpage) { page in
                //                            VStack {
                //                                Text("Page \(page)")
                //                            }
                //                        }
                //                    }
                //                })
                
                VStack {
                    HStack {
                        Button(action: {
                            
                        }, label: {
                            Image(systemName: "house")
                                .font(.system(size: 28))
                                .foregroundColor(.brown)
                        })
                        .offset(CGSize(width: -40.0, height: 385.0))
                        
                        NavigationLink(destination: SearchView()) {
                            Image(systemName: "magnifyingglass")
                                .font(.system(size: 30))
                                .foregroundColor(.brown)
                        }
                        .offset(CGSize(width: -15.0, height: 385.0))
                        
                        NavigationLink(destination: CalendarView()) {
                            Image(systemName: "calendar.badge.clock")
                                .font(.system(size: 32))
                                .foregroundColor(.brown)
                        }
                        .offset(CGSize(width: 105.0, height: 390.0))
                        
                        NavigationLink(destination: SettingView()) {
                            Image(systemName: "person.fill")
                                .font(.system(size: 30))
                                .foregroundColor(.brown)
                        }
                        .offset(CGSize(width: 125.0, height: 390.0))
                        
                        ZStack {
                            Circle()
                                .fill()
                                .frame(width: 80)
                                .foregroundColor(.black)
                                .offset(CGSize(width: -85.0, height: 365.0))
                            Circle()
                                .fill()
                                .frame(width: 50)
                                .foregroundColor(.gray)
                                .offset(CGSize(width: -85.0, height: 365.0))
                            
                            NavigationLink(destination: PointView()) {
                                Image(systemName: "dog.fill")
                                    .font(.system(size: 25))
                                    .foregroundColor(Color.white)
                            }
                            .offset(CGSize(width: -85.0, height: 365.0))
                        }
                    }
                }
            }
            .padding()
        }
    }
}



#Preview {
    ContentView()
}
