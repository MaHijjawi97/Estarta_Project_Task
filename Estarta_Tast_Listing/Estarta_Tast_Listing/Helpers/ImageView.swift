//
//  ImageView.swift
//  Estarta_Tast_Listing
//
//  Created by Mohammad Hijjawi on 25/01/2023.
//

import Foundation
import SwiftUI

struct ImageView: View {
    @ObservedObject var imageLoader: ImageLoader
    init(withURL url: String) {
        imageLoader = ImageLoader(url: url)
    }
    var body: some View {
        Image(uiImage: (imageLoader.data.isEmpty) ? UIImage(named: "photo_placeholder")! : UIImage(data: imageLoader.data)!)
            .resizable()
            .aspectRatio(contentMode: .fit)
            .frame(width: 50, height: 50)
            .clipped()
    }
}
