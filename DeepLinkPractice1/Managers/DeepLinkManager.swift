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
    @Published var currentDetailCafeID: String?
    
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
    
    func updateNavigationPath() {
        resetNavigationPath()
        if let selectedCafeID = currentDetailCafeID,
           let selectedCafe = DataSource.data.first(where: { $0.id == selectedCafeID }) {
            navigationPath.append(selectedCafe)
        }
    }
    //MVVM을 준수하기 위하여 updateNavigationPath를 만들어 적용했다.
    //NavigationPath을 비우기 위해 일반적으로도 initialize를 하는지 다른 방법이 있는지 궁금함.
}
