//
//  ListingViewModel.swift
//  Estarta_Tast_Listing
//
//  Created by Mohammad Hijjawi on 21/01/2023.
//

import Foundation
import Combine

struct ListingItem: Codable, Identifiable {
    
    /// A unique identifier for the listing
    let id = UUID()
    /// The name of the listing
    let created_at: String
    /// The price of the listing
    let price: String
    /// The date and time the listing was created
    let name: String
    /// An array of image IDs associated with the listing
    let uid: String
    /// An array of image URLs associated with the listing
    let image_ids: [String]
    /// An array of thumbnail image URLs associated with the listing
    let image_urls: [String]
    /// A unique identifier for the listing
    let image_urls_thumbnails: [String]
    
    private enum CodingKeys: String, CodingKey {
        case created_at, price, name, uid
        case image_ids = "image_ids"
        case image_urls = "image_urls"
        case image_urls_thumbnails = "image_urls_thumbnails"
    }
}
