//
//  RemoteImageView.swift
//  Estarta_Tast_Listing
//
//  Created by Mohammad Hijjawi on 21/01/2023.
//

import SwiftUI
import Combine

struct RemoteImageView: View {
    @ObservedObject var remoteImageURL: RemoteImageURL
    
    init(url: URL) {
        remoteImageURL = RemoteImageURL(url: url)
    }
    
    var body: some View {
        if let imageData = remoteImageURL.data {
            Image(uiImage: UIImage(data: imageData) ?? UIImage())
                .resizable()
                .aspectRatio(contentMode: .fit)
        } else {
            Image(systemName: "questionmark.square")
                .resizable()
                .aspectRatio(contentMode: .fit)
        }
    }
}
