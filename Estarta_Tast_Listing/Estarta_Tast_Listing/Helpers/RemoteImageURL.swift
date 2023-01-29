//
//  RemoteImageURL.swift
//  Estarta_Tast_Listing
//
//  Created by Mohammad Hijjawi on 25/01/2023.
//

import Foundation
import SwiftUI
import Combine

class RemoteImageURL: ObservableObject {
    var didChange = PassthroughSubject<Data?, Never>()
    var data: Data? {
        didSet {
            didChange.send(data)
        }
    }
    
    init(url: URL) {
        guard let data = try? Data(contentsOf: url) else {
            return
        }
        
        self.data = data
    }
}
