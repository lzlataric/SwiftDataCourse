//
//  Movie.swift
//  Movies
//
//  Created by Luka Zlataric on 28.01.2025..
//

import Foundation
import SwiftData

@Model
final class Movie {
    var title: String
    var year: Int
    
    @Relationship(deleteRule: .cascade, inverse: \Review.movie) // .cascade means that if you delete movie it will delete all the reviews assosiated with that movie
    var reviews: [Review]? = []
    
    init(title: String, year: Int) {
        self.title = title
        self.year = year
    }
}

// @Attribute(.unique) -> Macro for unique data
