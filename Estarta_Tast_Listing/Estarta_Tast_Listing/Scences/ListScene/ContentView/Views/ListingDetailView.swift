//
//  ListingDetailView.swift
//  EstartaProject_Listing
//
//  Created by Mohammad Hijjawi on 20/01/2023.
//
import SwiftUI

struct ListingDetailView: View {
    var listing: ListingItem
    var body: some View {
        VStack {
            // create a scroll view to display the images
            ScrollView(.horizontal) {
                HStack(alignment: .center){
                    // loop through the images and display them using ImageView
                    ForEach(listing.image_urls, id: \.self) { imageUrl in
//                        ImageView(withURL: imageUrl)
//                        if let url = URL(string: imageUrl) {
                            ImageView(withURL: imageUrl)
                                .frame(width: 400, height: 400)
                                .cornerRadius(5)

//                        }
                    }
                }
            }
            Text(listing.name)
                .font(.title)
            Text(listing.price)
                .font(.body)
            Text("Created at: \(formatDate(listing.created_at))")
                .font(.body)
        }
    }
    
}
