//
//  DeepLinkPractice1App.swift
//  DeepLinkPractice1
//
//  Created by 강성찬 on 2024-06-27.
//

import SwiftUI

@main
struct DeepLinkPractice1App: App {
    @StateObject var deepLinkManager: DeepLinkManager = DeepLinkManager()
    var body: some Scene {
        WindowGroup {
            MainTabView()
                .environmentObject(deepLinkManager)
                .onOpenURL(perform: { url in
                    if deepLinkManager.checkDeepLink(url: url) {
                        print("yes")
                    }
                    //Text결과 checkDeepLink를 한번 실행해 줘야 Deeplink가 정상동작한다.
                })
        }
    }
}
