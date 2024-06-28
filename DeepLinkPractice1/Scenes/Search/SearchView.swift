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
    }
}

#Preview {
    SearchView()
}
