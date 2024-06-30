//
//  SearchView.swift
//  DeepLinkPractice1
//
//  Created by 강성찬 on 2024-06-28.
//

import SwiftUI

struct SearchView: View {
    @EnvironmentObject var deepLinkManager: DeepLinkManager
    var body: some View {
        NavigationStack(path: $deepLinkManager.navigationPath) {
            List {
                ForEach(DataSource.data) { cafe in
                    NavigationLink(value: cafe) {
                        HStack {
                            Image(cafe.picture)
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 150, height: 150)
                            Text(cafe.name)
                        }
                    }
                }
            }
            .navigationTitle("Search")
            .navigationDestination(for: ParisCafe.self) { cafe in
                DetailView(cafe: cafe)
            }
        }
        .onAppear(perform: {
            print("## 1. Used .onAppear")
            deepLinkManager.updateNavigationPath()
        })
        
        .onChange(of: deepLinkManager.currentDetailCafeID) {
            print("## 2. Used .onChange")
            deepLinkManager.updateNavigationPath()
        }
        //처음엔 onAppear만으로 충분하다고 생각했으나 동작이 되었다가 안되었다.
        //검색해보니 onChange와 같이 쓰면서 print를 사용해 디버깅하라고 알게되었다.
    }
}

#Preview {
    SearchView()
}
