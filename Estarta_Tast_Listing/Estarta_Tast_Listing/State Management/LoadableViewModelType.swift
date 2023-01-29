//
//  LoadableViewModelType.swift
//  Estarta_Tast_Listing
//
//  Created by Mohammad Hijjawi on 25/01/2023.
//

import Foundation

protocol LoadableViewModelType<ContentType> {
    associatedtype ContentType
    
    func loadContents() async throws -> ContentType
}
