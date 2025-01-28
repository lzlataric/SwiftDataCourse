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
    let movies: [Movie]
    
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
                HStack {
                    Text(movie.title)
                    Spacer()
                    Text(movie.year.description)
                }
            }
            .onDelete(perform: deleteMovie)
        }
    }
}

#Preview {
    MovieListView(movies: [])
        .modelContainer(for: [Movie.self])
}
