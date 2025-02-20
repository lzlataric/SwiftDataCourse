//
//  AddMovieScreen.swift
//  Movies
//
//  Created by Luka Zlataric on 28.01.2025..
//

import SwiftUI
import SwiftData

struct AddMovieScreen: View {
    @Environment(\.dismiss) private var dismiss
    @Environment(\.modelContext) private var context
    @State private var title: String = ""
    @State private var year: Int?
    @State private var selectedActors: Set<MovieActor> = []
    
    private var isFormValid: Bool {
        !title.isEmptyOrWhitespace && year != nil && !selectedActors.isEmpty
    }
    
    var body: some View {
        Form {
            TextField("Title", text: $title)
            TextField("Year", value: $year, format: .number)
            
            Section("Select Actors") {
                ActorSelectionView(selectedActors: $selectedActors)
            }
        }
        .navigationTitle("Add New Movie")
        .toolbar {
            ToolbarItem(placement: .topBarLeading) {
                Button("Close") {
                    dismiss()
                }
            }
            
            ToolbarItem(placement: .topBarTrailing) {
                Button("Save") {
                    guard let year = year else { return }
                    let movie = Movie(title: title, year: year)
                    movie.actors = Array(selectedActors)
                    
                    selectedActors.forEach { actor in
                        actor.movies.append(movie)
                        context.insert(actor)
                    }
                    
                    context.insert(movie)
                    
                    do {
                        try context.save()
                    } catch {
                        print(error.localizedDescription)
                    }
                    dismiss()
                }
                .disabled(!isFormValid)
            }
        }
    }
}

#Preview {
    NavigationStack {
        AddMovieScreen()
            .modelContainer(for: [Movie.self])
    }
}
