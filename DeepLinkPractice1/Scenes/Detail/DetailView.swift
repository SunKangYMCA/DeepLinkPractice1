//
//  DetailView.swift
//  DeepLinkPractice1
//
//  Created by 강성찬 on 2024-06-28.
//

import SwiftUI

struct DetailView: View {
    var cafe: ParisCafe
    
    var body: some View {
        VStack {
            Image(cafe.picture)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 350, height: 350)
            Text("💛 Rating:  ")
            Text(cafe.rating)
        }
        .navigationTitle(cafe.name)
    }
}

#Preview {
    DetailView(cafe: ParisCafe(id: "", name: "", rating: "", picture: ""))
}
