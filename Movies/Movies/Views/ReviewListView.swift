//
//  ReviewListView.swift
//  Movies
//
//  Created by Luka Zlataric on 29.01.2025..
//

import SwiftUI

struct ReviewListView: View {
    let reviews: [Review]
    var body: some View {
        List {
            ForEach(reviews) { review in
                VStack(alignment: .leading) {
                    Text(review.subject)
                        .fontWeight(.bold)
                    Text(review.body)
                }
            }
        }
    }
}

//#Preview {
//    ReviewListView()
//}
