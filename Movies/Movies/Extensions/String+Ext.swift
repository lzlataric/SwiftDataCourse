//
//  String+Ext.swift
//  Movies
//
//  Created by Luka Zlataric on 28.01.2025..
//

import Foundation

extension String {
    var isEmptyOrWhitespace: Bool {
        self.trimmingCharacters(in: .whitespaces).isEmpty
    }
}
