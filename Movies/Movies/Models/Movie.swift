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
    
    var reviewsCount: Int {
        reviews.count
    }
    
    var actorsCount: Int {
        actors.count
    }
    
    @Relationship(deleteRule: .cascade, inverse: \Review.movie) // .cascade means that if you delete movie it will delete all the reviews assosiated with that movie
    var reviews: [Review] = []
    
    @Relationship(deleteRule: .noAction, inverse: \MovieActor.movies)
    var actors: [MovieActor] = []
        
    init(title: String, year: Int) {
        self.title = title
        self.year = year
    }
}

// @Attribute(.unique) -> Macro for unique data
