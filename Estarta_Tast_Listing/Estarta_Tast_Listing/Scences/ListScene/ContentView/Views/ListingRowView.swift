//
//  ListingRowView.swift
//  Estarta_Tast_Listing
//
//  Created by Mohammad Hijjawi on 21/01/2023.
//
import SwiftUI

struct ListingRowView: View {
    // listing data to display
    var listing: ListingItem
    
    var body: some View {
        HStack(alignment: .center) {
            // create a scroll view to display the images
//            ScrollView(.horizontal) {
                HStack {
                    // loop through the images and display them using ImageView
                    ForEach(listing.image_urls_thumbnails, id: \.self) { imageUrl in
//                        if let url = URL(string: imageUrl) {
                            ImageView(withURL: imageUrl)
                                .frame(width: 70, height: 70)
                                .cornerRadius(5)

//                        }
                    }
                }
            
//            }
            
            VStack(alignment: .leading) {
                Text(listing.name)
                    .font(.headline)
                Text(listing.price)
                    .font(.subheadline)
            }
        }
    }
    }

