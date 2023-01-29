//
//  ResourceEndpoint.swift
//  Estarta_Tast_Listing
//
//  Created by Mohammad Hijjawi on 25/01/2023.
//

import Foundation

/// more types to be supported later
enum HTTPMethod: String {
    case get = "GET"
    case post = "POST"
}

protocol ResourceEndpointType {
    
    var baseURL: URL { get }
    
    var method: HTTPMethod { get }
    
    /// path, exluding the base URL
    var path: String { get }
    
    /// parameters will be encoded per the method
    var parameters: [String: Any] { get }
    
    
    /// converts the endpoint to a request
    func asURLRequest() throws -> URLRequest
}

extension ResourceEndpointType {
    func asURLRequest() throws -> URLRequest {
        var request = URLRequest(url: baseURL.appendingPathComponent(path))
        request.httpMethod = method.rawValue
        
        if method == .get {
            let queryItems = parameters.map {
                URLQueryItem(name: $0.key, value: "\($0.value)")
            }
            
            var components = URLComponents(url: baseURL.appendingPathComponent(path), resolvingAgainstBaseURL: false)!
            components.queryItems = queryItems
            request.url = components.url
        } else {
            request.httpBody = try JSONSerialization.data(withJSONObject: parameters)
        }
        
        return request
    }
}
/**
 This code defines a protocol named ResourceEndpointType and an extension that provides a default implementation of the asURLRequest() method. The ResourceEndpointType protocol defines several properties and one method, asURLRequest(), that converts the endpoint to a URL request. The protocol defines the base URL, HTTP method, path, and parameters for the request. The asURLRequest() method creates a URLRequest object using the base URL and path, sets the HTTP method, and encodes the parameters as part of the request. If the method is "GET", the parameters are added as query items. If the method is anything other than "GET", the parameters are encoded as JSON and added to the request body.
 */
