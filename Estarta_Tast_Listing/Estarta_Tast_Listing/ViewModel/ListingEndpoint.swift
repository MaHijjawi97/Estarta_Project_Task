//
//  ListingEndpoint.swift
//  Estarta_Tast_Listing
//
//  Created by Mohammad Hijjawi on 25/01/2023.
//

import Foundation

enum ListingEndpoint: ResourceEndpointType {
    case listings
    
    var method: HTTPMethod {
        .get
    }
    
    var path: String {
        "dynamodb-writer"
    }
    
    var baseURL: URL {
        EnvironmentConstants.baseURL
    }
    
    var parameters: [String : Any] { [:] }
}
