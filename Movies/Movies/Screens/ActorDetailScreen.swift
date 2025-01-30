//
//  ActorDetailScreen.swift
//  Movies
//
//  Created by Luka Zlataric on 29.01.2025..
//

import SwiftUI

struct ActorDetailScreen: View {
    @Environment(\.modelContext) private var context
    @State private var selectedMovies: Set<Movie> = []
    let actor: MovieActor
    
    var body: some View {
        VStack {
            MovieSelectionView(selectedMovies: $selectedMovies)
                .onAppear{
                    selectedMovies = Set(actor.movies)
                }
        }
        .onChange(of: selectedMovies, { _, newValue in
            actor.movies = Array(newValue)
            context.insert(actor)
        })
        .navigationTitle(actor.name)
    }
}

//#Preview {
//    ActorDetailScreen()
//}
