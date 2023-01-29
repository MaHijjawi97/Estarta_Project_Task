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
