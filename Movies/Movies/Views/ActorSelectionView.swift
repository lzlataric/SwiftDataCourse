//
//  ActorSelectionView.swift
//  Movies
//
//  Created by Luka Zlataric on 29.01.2025..
//

import SwiftUI
import SwiftData

struct ActorSelectionView: View {
    @Query(sort: \MovieActor.name, order: .forward) private var actors: [MovieActor]
    @Binding var selectedActors: Set<MovieActor>
    
    var body: some View {
        List(actors) { actor in
            HStack {
                Image(systemName: selectedActors.contains(actor) ? "checkmark.square" : "square")
                    .onTapGesture {
                        if !selectedActors.contains(actor) {
                            selectedActors.insert(actor)
                        } else {
                            selectedActors.remove(actor)
                        }
                    }
                Text(actor.name)
            }
        }
    }
}

//#Preview {
//    ActorSelectionView()
//}
