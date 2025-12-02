//
//  Character.swift
//  FabiolaOrdinario
//
//  Created by win603 on 01/12/25.
//

import Foundation

struct CharacterResponse: Codable {
    let pagination: Pagination
    let content: [Character]
}

struct Character: Identifiable, Codable {
    let id: Int
    let name: String
    let age: Int?
    let gender: String
    let race: String
    let img: String
    let quote: String
}

struct Pagination: Codable {
    let totalElements: Int
    let elementsOnPage: Int
    let currentPage: Int
    let totalPages: Int
    let previousPage: String
    let nextPage: String
}
