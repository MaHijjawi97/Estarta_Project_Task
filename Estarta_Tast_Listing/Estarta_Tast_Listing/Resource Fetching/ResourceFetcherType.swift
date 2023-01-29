//
//  ResourceFetcherType.swift
//  Estarta_Tast_Listing
//
//  Created by Mohammad Hijjawi on 25/01/2023.
//

import Foundation

protocol ResourceFetcherType {
    
    /**
     Fetches the resource of given type with given endpoint
     */
    func resource<T: Decodable>(of type: T.Type, from endpoint: ResourceEndpointType) async throws -> T
}
