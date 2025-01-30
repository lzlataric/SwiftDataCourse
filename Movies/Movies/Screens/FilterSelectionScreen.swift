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
}

struct FilterSelectionScreen: View {
    @Environment(\.dismiss) private var dismiss
    @Binding var filterOption: FilterOption
    @State private var movieTitle: String = ""
    var body: some View {
        Form {
            Section("Filter by Title"){
                TextField("Movie Title", text: $movieTitle)
                Button("Search") {
                    filterOption = .movieTitle(movieTitle)
                    dismiss()
                }
            }
        }
    }
}
