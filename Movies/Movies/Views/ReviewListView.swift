//
//  ReviewListView.swift
//  Movies
//
//  Created by Luka Zlataric on 29.01.2025..
//

import SwiftUI
import SwiftData

struct ReviewListView: View {
    @Environment(\.modelContext) private var context
    let movie: Movie
    
    private func deleteReview(at indexSet: IndexSet) {
        indexSet.forEach { index in
            let review = movie.reviews[index]
            context.delete(review)
            do {
                movie.reviews.remove(at: index)
                try context.save()
            } catch {
                print(error.localizedDescription)
            }
        }
    }
    
    var body: some View {
        List {
            ForEach(movie.reviews) { review in
                VStack(alignment: .leading) {
                    Text(review.subject)
                        .fontWeight(.bold)
                    Text(review.body)
                }
            }.onDelete(perform: deleteReview)
        }
    }
}

//#Preview {
//    ReviewListView()
//}
