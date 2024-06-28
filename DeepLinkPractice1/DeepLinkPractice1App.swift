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
                  //아무것도 없이 비워놔도 되는지 Test, 그러나 명령 자체가 없으면 동작안함.
                })
        }
    }
}
