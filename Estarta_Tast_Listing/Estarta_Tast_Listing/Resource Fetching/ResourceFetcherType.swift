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
/**
 This is a protocol in Swift called "ResourceFetcherType" that defines a single function called "resource". The function takes in two parameters: "type" of generic type T which must conform to the "Decodable" protocol and "endpoint" of type "ResourceEndpointType". The function is marked with the "async" keyword, which means that the function can be awaited by other functions. The function is expected to fetch the resource of the given type with the given endpoint and return the resource in the form of the generic type T. It can throw errors, so it's declared with the "throws" keyword.
 */
