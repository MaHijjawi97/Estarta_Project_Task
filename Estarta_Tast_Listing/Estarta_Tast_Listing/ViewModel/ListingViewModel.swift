//
//  ListingViewModel.swift
//  Estarta_Tast_Listing
//
//  Created by Mohammad Hijjawi on 25/01/2023.
//

import Foundation
import SwiftUI
import Combine

/**
 Though we can wrap this into protocol first, but this will increase the complexity, so we're going with the ViewModel itself first
 */
@MainActor
class ListingViewModel: ObservableObject, LoadableViewModelType {
    typealias ContentType = [ListingItem]
        
    let fetcher: ResourceFetcherType
    
    init(fetcher: ResourceFetcherType = ResourceAPIFetcher()) {
        self.fetcher = fetcher
    }
    
    func loadContents() async throws -> ContentType {
        try await fetcher.resource(of: ResponseContainer<[ListingItem]>.self, from: ListingEndpoint.listings).results
    }
}
/**
 This is a class in Swift called "ListingViewModel" that conforms to the "ObservableObject" protocol from the SwiftUI framework and the "LoadableViewModelType" protocol which you defined above. The class has a generic type "ContentType" which is set as an array of "ListingItem" objects. The class has a property "fetcher" of type "ResourceFetcherType" which is used to fetch the content. The class has an initializer that takes in a "fetcher" parameter with a default value of "ResourceAPIFetcher()".

 The class implements the "loadContents" function that is defined in the "LoadableViewModelType" protocol, which retrieves the content from the API and returns it. The function is marked with the "async" keyword which means that the function can be awaited by other functions. Inside the function, it uses the await keyword to wait for the fetcher object to fetch the resource, it calls the endpoint 'ListingEndpoint.listings' to fetch the data. The fetcher returns a "ResponseContainer" object, from that it extracts the 'results' property and returns it as the content.

 The class also has the '@MainActor' annotation which signifies that this class is the main actor in this part of the application and it is responsible for handling the main functionality. This is a custom annotation and its use is not standard in Swift.

 */
