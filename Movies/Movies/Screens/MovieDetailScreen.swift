//
//  MovieDetailScreen.swift
//  Movies
//
//  Created by Luka Zlataric on 28.01.2025..
//

import SwiftUI
import SwiftData

struct MovieDetailScreen: View {
    @Environment(\.modelContext) private var context
    @Environment(\.dismiss) private var dismiss
    let movie: Movie
    @State private var title: String = ""
    @State private var year: Int?
    @State private var showReviewScreen = false
    
    var body: some View {
        Form {
            TextField("Title", text: $title)
            TextField("Year", value: $year, format: .number)
            
            Section{
                Button {
                    showReviewScreen = true
                } label: {
                    Image(systemName: "plus")
                        .frame(maxWidth: .infinity, alignment: .trailing)
                }
                
                if let reviews = movie.reviews {
                    if reviews.isEmpty {
                        ContentUnavailableView {
                            Text("No Reviews")
                        }
                    }
                    else {
                        ReviewListView(reviews: reviews)
                    }
                }
            }
        }
        .toolbar {
            ToolbarItem(placement: .topBarTrailing) {
                Button("Edit") {
                    guard let year = year else { return }
                    movie.title = title
                    movie.year = year
                    do {
                        try context.save()
                    } catch {
                        print(error.localizedDescription)
                    }
                    dismiss()
                }
            }
        }
        .onAppear {
            title = movie.title
            year = movie.year
        }
        .sheet(isPresented: $showReviewScreen) {
            NavigationStack {
                AddReviewScreen(movie: movie)
            }
        }
    }
}

//For Previews
struct MovieDetailContainerScreen: View {
    @Environment(\.modelContext) private var context
    @State private var movie: Movie?
    var body: some View {
        ZStack {
            if let movie {
                MovieDetailScreen(movie: movie)
            }
        }
        .onAppear {
            let movie = Movie(title: "Shutter Island", year: 2009)
            context.insert(movie)
        }
    }
}

#Preview {
    MovieDetailContainerScreen()
        .modelContainer(for: [Movie.self])
}
