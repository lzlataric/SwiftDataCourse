//
//  MovieListView.swift
//  Movies
//
//  Created by Luka Zlataric on 28.01.2025..
//

import SwiftUI
import SwiftData

struct MovieListView: View {
    @Environment(\.modelContext) private var context
    @Query private var movies: [Movie]
    let filterOption: FilterOption
    
    init(filterOption: FilterOption = .none) {
        self.filterOption = filterOption
        switch self.filterOption {
        case .none:
            break
        case .movieTitle(let movieTitle):
            _movies = Query(filter: #Predicate { $0.title.contains(movieTitle) })
        case .reviewsCount(let numberOfReviews):
            _movies = Query(filter: #Predicate { $0.reviews.count >= numberOfReviews })
        case .actorsCount(let numberOfActors):
            _movies = Query(filter: #Predicate { $0.actors.count >= numberOfActors })
        }
    }
    
    private func deleteMovie(indexSet: IndexSet) {
        indexSet.forEach { index in
            let movie = movies[index]
            context.delete(movie)
            do {
                try context.save()
            } catch {
                print(error.localizedDescription)
            }
        }
    }
    
    var body: some View {
        List {
            ForEach(movies) { movie in
                NavigationLink(value: movie) {
                    HStack(alignment: .firstTextBaseline) {
                        VStack(alignment: .leading) {
                            Text(movie.title)
                            Text("Reviews count: \(movie.reviewsCount)")
                                .font(.caption)
                            Text("Actors count: \(movie.actorsCount)")
                                .font(.caption)
                        }
                        Spacer()
                        Text(movie.year.description)
                    }
                }
            }
            .onDelete(perform: deleteMovie)
        }
        .navigationDestination(for: Movie.self) { movie in
            MovieDetailScreen(movie: movie)
        }
    }
}
