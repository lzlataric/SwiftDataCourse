//
//  ActorListView.swift
//  Movies
//
//  Created by Luka Zlataric on 29.01.2025..
//

import SwiftUI

struct ActorListView: View {
    let actors: [MovieActor]
    var body: some View {
        List(actors) { actor in
            NavigationLink(value: actor) {
                ActorCellView(actor: actor)
            }
        }
        .navigationDestination(for: MovieActor.self) { actor in
            ActorDetailScreen(actor: actor)
        }
    }
}

//#Preview {
//    ActorListView()
//}
