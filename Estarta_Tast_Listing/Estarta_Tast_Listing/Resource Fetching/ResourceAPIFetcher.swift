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
/**
 This is a struct in Swift called "ResourceAPIFetcher" that conforms to the "ResourceFetcherType" protocol, which you defined above. The struct has an internal enumeration called "APIError" that conforms to the "LocalizedError" protocol, which has cases for handling different types of errors.

 The struct has a function "resource" that takes in two parameters, "type" of generic type T and "endpoint" of type "ResourceEndpointType". The function is marked with the "async" keyword which means that the function can be awaited by other functions. Inside the function, it first creates a URLRequest object by calling the "asURLRequest()" function on the endpoint object. It then uses URLSession.shared to fetch the data from the request and parse the response.

 It checks if the status code of the HTTP response is in the range of 200 to 300, if not it throws an error of type "APIError.invalidStatusCode". If the status code is valid, the struct uses the JSONDecoder() to decode the response data into the desired type T. Finally, it returns the decoded object.

 */
