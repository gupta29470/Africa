//
//  VideoModel.swift
//  Africa
//
//  Created by Aakash Gupta on 06/04/25.
//

import SwiftUI

struct Video: Codable, Identifiable {
    let id: String
    let name: String
    let headline: String
    
    var thumbnail: String {
        "video-\(id)"
    }
}
