//
//  MovieListScreen.swift
//  Movies
//
//  Created by Luka Zlataric on 28.01.2025..
//

import SwiftUI
import SwiftData

struct MovieListScreen: View {
    @Environment(\.modelContext) private var context
    @Query(sort: \Movie.title, order: .forward) private var movies: [Movie]
    @Query(sort: \MovieActor.name, order: .forward) private var actors: [MovieActor]
    @State private var isAddMoviePresented: Bool = false
    @State private var isAddActorPresented: Bool = false
    @State private var actorName = ""
    
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
                    isAddMoviePresented = true
                }
            }
            
            ToolbarItem(placement: .topBarLeading) {
                Button("Add Actor") {
                    isAddActorPresented = true
                }
            }
        }
        .sheet(isPresented: $isAddMoviePresented) {
            NavigationStack {
                AddMovieScreen()
            }
        }
        .sheet(isPresented: $isAddActorPresented) {
            Text("Add Actor")
                .font(.largeTitle)
                .presentationDetents([.fraction(0.25)])
            
            TextField("Actor name", text: $actorName)
                .textFieldStyle(.roundedBorder)
                .presentationDetents([.fraction(0.25)])
                .padding()
            
            Button("Save") {
                isAddActorPresented = false
                saveActor()
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
