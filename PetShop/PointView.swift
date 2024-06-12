//
//  PointView.swift
//  PetShop
//
//  Created by OLIVER LIAO on 2024/5/10.
//

import SwiftUI

struct PointView: View {
    
    @State private var activeTab: Tab = .home
    @Namespace private var animation
    @State private var tabshapePosition: CGPoint = .zero
    init() {
        UITabBar.appearance().isHidden = true
    }
    var body: some View {
        VStack(spacing: 0) {
            TabView(selection: $activeTab) {
                VStack {
                    WebView(url: URL(string: "https://tomspet.official.ec")!)
                        .edgesIgnoringSafeArea(.bottom)
                        .tag(Tab.home)
                }
//                        .toolbar(.hidden, for: .tabBar)
                
                    SearchView()
                    .tag(Tab.search)
//                    .toolbar(.hidden, for: .tabBar)
                
                Text("Diary")
                    .tag(Tab.diary)
//                    .toolbar(.hidden, for: .tabBar)
                
                CalendarView()
                    .tag(Tab.calendar)
//                    .toolbar(.hidden, for: .tabBar)
                
                SettingView()
                    .tag(Tab.setting)
//                    .toolbar(.hidden, for: .tabBar)
            }
            
            CustomTabBar()
        }
    }
    
    @ViewBuilder
    func CustomTabBar(_ tint: Color = .brown, _ inactiveTini: Color = .pink) -> some View {
        HStack(alignment: .bottom, spacing: 0) {
            ForEach(Tab.allCases, id: \.rawValue) {
                TabItem(tint: tint,
                        inactiveTini: inactiveTini,
                        tab: $0, animation: animation,
                        activeTab: $activeTab,
                        position: $tabshapePosition
                )
            }
        }
        .padding(.horizontal, 15)
        .padding(.vertical, 10)
        .animation(.interactiveSpring(response: 0.6, dampingFraction: 0.7, blendDuration: 0.7), value: activeTab)
        .background(content: {
            TabShape(midpoint: tabshapePosition.x)
                .fill(.white)
                .ignoresSafeArea()
                .shadow(color: tint.opacity(0.2), radius: 5, x: 0, y: -5)
                .blur(radius: 2)
                .padding(.top, 25)
        })
    }
}

struct TabItem: View {
    
    var tint: Color
    var inactiveTini: Color
    var tab: Tab
    var animation: Namespace.ID
    @Binding var activeTab: Tab
    @State var tabshapePosition: CGPoint = .zero
    @Binding var position: CGPoint
    var body: some View {
        VStack(spacing: 0) {
            Image(systemName: tab.systemImage)
                .font(.title2)
                .frame(width: activeTab == tab ? 55 : 35, height: activeTab == tab ? 55 : 35)
                .foregroundColor(activeTab == tab ? .white : inactiveTini)
                .background {
                    if activeTab == tab {
                        Circle()
                            .fill(tint.gradient)
                            .matchedGeometryEffect(id: "ACTIVETAB", in: animation)
                    }
                }
            Text(tab.rawValue)
                .font(.caption)
                .foregroundColor(activeTab == tab ? tint : .gray)
        }
        .frame(maxWidth: .infinity)
        .contentShape(Rectangle())
        .viewPosition(completion: { rect in
            tabshapePosition.x = rect.midX
            
            if activeTab == tab {
                position.x = rect.midX
            }
        })
        .onTapGesture {
            activeTab = tab
            
            withAnimation(.interactiveSpring(response: 0.6, dampingFraction: 0.7, blendDuration: 0.7)) {
                position.x = tabshapePosition.x
            }
        }
    }
}

#Preview {
    ContentView()
}
