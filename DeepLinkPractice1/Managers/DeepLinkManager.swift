//
//  DeepLinkManager.swift
//  DeepLinkPractice1
//
//  Created by 강성찬 on 2024-06-27.
//


import SwiftUI

class DeepLinkManager: ObservableObject {
    @Published var navigationPath = NavigationPath()
    @Published var currentTab: ParisCafeTab = .home
    @Published var currentDetailCafeID: String = ""
    // @Published var currentDetailCafeID: String?
    // Tutorial에서는 옵셔널을 사용했는데 왜 그랬는지 모르겠어서 Default value를 주고
    // Test 중
    
    func checkDeepLink(url: URL) -> Bool {
        guard let deepLinkComponent = URLComponents(url: url, resolvingAgainstBaseURL: true)?.host else {
            return false
        }
        print(deepLinkComponent)
        if deepLinkComponent == ParisCafeTab.home.title {
            resetNavigationPath()
            currentTab = .home
        } else if deepLinkComponent == ParisCafeTab.search.title {
            resetNavigationPath()
            currentTab = .search
        } else if deepLinkComponent == ParisCafeTab.setting.title {
            resetNavigationPath()
            currentTab = .setting
        } else {
            return self.checkInternalDeeplinks(component: deepLinkComponent)
        }
        return true
    }
    
    func checkInternalDeeplinks(component: String) -> Bool {
        if let index = DataSource.data.firstIndex(where: { cafe in
        cafe.id == component
        }) {
            currentTab = .search
            resetNavigationPath()
            currentDetailCafeID = DataSource.data[index].id
            return true
        }
        
        return false
    }
    
    func resetNavigationPath() {
        navigationPath = NavigationPath()
    }
}
