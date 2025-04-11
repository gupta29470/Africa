//
//  AnimalModel.swift
//  Africa
//
//  Created by Aakash Gupta on 05/04/25.
//

import SwiftUI

struct Animal: Codable, Identifiable {
    let id: String
    let name: String
    let headline: String
    let description: String
    let link: String
    let image: String
    let gallery: [String]
    let fact: [String]
}
