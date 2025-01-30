//
//  FilterSelectionScreen.swift
//  Movies
//
//  Created by Luka Zlataric on 30.01.2025..
//

import SwiftUI

enum FilterOption {
    case none
    case movieTitle(String)
    case reviewsCount(Int)
    case actorsCount(Int)
}

struct FilterSelectionScreen: View {
    @Environment(\.dismiss) private var dismiss
    @Binding var filterOption: FilterOption
    @State private var movieTitle: String = ""
    @State private var numberOfRevies: Int?
    @State private var numberOfActors: Int?
    var body: some View {
        Form {
            Section("Filter by Title"){
                TextField("Movie Title", text: $movieTitle)
                Button("Search") {
                    filterOption = .movieTitle(movieTitle)
                    dismiss()
                }
            }
            
            Section("Filter by Reviews Count") {
                TextField("Number of Reviews", value: $numberOfRevies, format: .number)
                    .keyboardType(.numberPad)
                Button("Search") {
                    filterOption = .reviewsCount(numberOfRevies ?? 1)
                    dismiss()
                }
            }
            
            Section("Filter by Actors Count") {
                TextField("Number of Actors", value: $numberOfActors, format: .number)
                    .keyboardType(.numberPad)
                Button("Search") {
                    filterOption = .actorsCount(numberOfActors ?? 1)
                    dismiss()
                }
            }
        }
    }
}
