//
//  Review.swift
//  Movies
//
//  Created by Luka Zlataric on 29.01.2025..
//

import Foundation
import SwiftData

@Model
final class Review {
    var subject: String
    var body: String
    var movie: Movie?
    
    init(subject: String, body: String) {
        self.subject = subject
        self.body = body
    }
}
