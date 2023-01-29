//
//  ResponseContainer.swift
//  Estarta_Tast_Listing
//
//  Created by Mohammad Hijjawi on 25/01/2023.
//

import Foundation

struct ResponseContainer<Content> {
    let results: Content
}

extension ResponseContainer: Codable where Content: Codable { }

