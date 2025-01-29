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
            Text(actor.name)
        }
    }
}

//#Preview {
//    ActorListView()
//}
