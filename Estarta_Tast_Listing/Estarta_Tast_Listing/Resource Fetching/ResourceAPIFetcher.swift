//
//  ResourceAPIFetcher.swift
//  Estarta_Tast_Listing
//
//  Created by Mohammad Hijjawi on 25/01/2023.
//

import Foundation

struct ResourceAPIFetcher: ResourceFetcherType {
    enum APIError: LocalizedError {
        case invalidStatusCode
    }
    
    func resource<T>(of type: T.Type, from endpoint: ResourceEndpointType) async throws -> T where T : Decodable {
        let request = try endpoint.asURLRequest()
        
        let response = try await URLSession.shared.data(for: request)
        
        guard let httpResponse = response.1 as? HTTPURLResponse, httpResponse.statusCode >= 200, httpResponse.statusCode <= 300 else {
            throw APIError.invalidStatusCode
        }
        
        let decoder = JSONDecoder()
        let typedResponse = try decoder.decode(T.self, from: response.0)

        return typedResponse
    }
}
