//
//  Actor.swift
//  Movies
//
//  Created by Luka Zlataric on 29.01.2025..
//

import Foundation
import SwiftData

@Model
class MovieActor {
    var name: String
    var movies: [Movie] = []
    
    init(name: String) {
        self.name = name
    }
}
