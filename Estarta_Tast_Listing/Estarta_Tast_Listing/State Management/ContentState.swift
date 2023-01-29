//
//  ContentState.swift
//  Estarta_Tast_Listing
//
//  Created by Mohammad Hijjawi on 25/01/2023.
//

import Foundation

enum ContentState<Content> {
    case failed(Error)
    case content(Content)
    case loading
    case initial
}
