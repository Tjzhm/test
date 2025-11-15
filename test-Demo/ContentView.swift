//
//  ContentView.swift
//  test-Demo
//
//  Created by Hongming Zhu on 2025/11/11.
//

import SwiftUI

// MARK: - 根视图（Tab）
struct ContentView: View {
    @State private var selectedTab: RootTab = .home

    var body: some View {
        TabView(selection: $selectedTab) {
            HomeView(viewModel: HomeViewModel.mock())
                .tabItem {
                    Image(systemName: selectedTab == .home ? "house.fill" : "house")
                    Text("首页")
                }
                .tag(RootTab.home)

            ServicesView(viewModel: ServicesViewModel.mock())
                .tabItem {
                    Image(systemName: selectedTab == .services ? "square.grid.2x2.fill" : "square.grid.2x2")
                    Text("服务")
                }
                .tag(RootTab.services)

            CardView(viewModel: CardViewModel.mock())
                .tabItem {
                    Image(systemName: selectedTab == .card ? "person.text.rectangle.fill" : "person.text.rectangle")
                    Text("社保卡")
                }
                .tag(RootTab.card)

            ProfileView(viewModel: ProfileViewModel.mock())
                .tabItem {
                    Image(systemName: selectedTab == .profile ? "person.fill" : "person")
                    Text("我的")
                }
                .tag(RootTab.profile)
        }
        .accentColor(AppTheme.accent)
    }
}

enum RootTab {
    case home
    case services
    case card
    case profile
}

// MARK: - 预览
#Preview {
    ContentView()
}
