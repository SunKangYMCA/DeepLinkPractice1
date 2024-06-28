//
//  MainTabView.swift
//  DeepLinkPractice1
//
//  Created by 강성찬 on 2024-06-27.
//

import SwiftUI

struct MainTabView: View {
    @EnvironmentObject var deepLinkManager: DeepLinkManager
    
    var body: some View {
        TabView(selection: $deepLinkManager.currentTab) {
            Text("Home")
                .tag(ParisCafeTab.home)
                .tabItem {
                    Image(systemName: "house.fill")
                }
            
            SearchView()
                .tag(ParisCafeTab.search)
                .tabItem {
                    Image(systemName: "magnifyingglass")
                }
            
            Text("Setting")
                .tag(ParisCafeTab.setting)
                .tabItem {
                    Image(systemName: "gearshape.fill")
                }
        }
    }
}

#Preview {
    MainTabView()
}
