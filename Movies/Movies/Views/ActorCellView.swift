//
//  ActorCellView.swift
//  Movies
//
//  Created by Luka Zlataric on 29.01.2025..
//

import SwiftUI

struct ActorCellView: View {
    let actor: MovieActor
    var body: some View {
        VStack(alignment: .leading) {
            Text(actor.name)
            Text(actor.movies.map { $0.title }, format: .list(type: .and))
                .font(.caption)
        }
    }
}

//#Preview {
//    ActorCellView()
//}
