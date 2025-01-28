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
    
    init(title: String, year: Int) {
        self.title = title
        self.year = year
    }
}

// @Attribute(.unique) -> Macro for unique data
