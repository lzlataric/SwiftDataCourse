//
//  MovieListScreen.swift
//  Movies
//
//  Created by Luka Zlataric on 28.01.2025..
//

import SwiftUI
import SwiftData

enum Sheets: Identifiable {
    case addMovie
    case addActor
    case showFilters
    
    var id: Int {
        hashValue
    }
}

struct MovieListScreen: View {
    @Environment(\.modelContext) private var context
    //    @Query(filter: #Predicate<Movie> { $0.year > 2001 && $0.actors.count > 1 }) private var movies: [Movie]
    @Query(sort: \Movie.title, order: .forward) private var movies: [Movie]
    @Query(sort: \MovieActor.name, order: .forward) private var actors: [MovieActor]
    @State private var actorName = ""
    
    @State private var activeSheet: Sheets?
    
    private func saveActor() {
        let actor = MovieActor(name: actorName)
        context.insert(actor)
    }
    
    var body: some View {
        VStack(alignment: .leading) {
            Text("Movies")
                .font(.largeTitle)
            MovieListView(movies: movies)
            
            Text("Actors")
                .font(.largeTitle)
            ActorListView(actors: actors)
        }
        .padding()
        .toolbar {
            ToolbarItem(placement: .topBarTrailing) {
                Button("Add Movie") {
                    activeSheet = .addMovie
                }
            }
            
            ToolbarItem(placement: .topBarLeading) {
                Button("Add Actor") {
                    activeSheet = .addActor
                }
            }
        }
        .sheet(item: $activeSheet, content: { activeSheet in
            switch activeSheet {
            case .addMovie:
                addMovieSheet
            case .addActor:
                addActorSheet
                EmptyView()
            case .showFilters:
                Text("Show Filter")
            }
        })
    }
}

extension MovieListScreen {
    var addMovieSheet: some View {
        NavigationStack {
            AddMovieScreen()
        }
    }
    
    var addActorSheet: some View {
        VStack {
            Text("Add Actor")
                .font(.largeTitle)
                .presentationDetents([.fraction(0.25)])
            
            TextField("Actor name", text: $actorName)
                .textFieldStyle(.roundedBorder)
                .presentationDetents([.fraction(0.25)])
                .padding()
            
            Button("Save") {
                saveActor()
                activeSheet = nil
            }
        }
    }
}

#Preview {
    NavigationStack {
        MovieListScreen()
            .modelContainer(for: [Movie.self])
    }
}
