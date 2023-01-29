//
//  ContentView.swift
//  EstartaProject_Listing
//
//  Created by Mohammad Hijjawi on 20/01/2023.
//

import SwiftUI

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ListingListView()
    }
}

struct ListingListView: View {
    var body: some View {
        NavigationView {
            StateView(viewModel: ListingViewModel()) { content in
                List {
                    ForEach(content) { listing in
                        NavigationLink(destination: ListingDetailView(listing: listing)) {
                            ListingRowView(listing: listing)
                        }
                    }
                }.navigationTitle("Listing")
                    .navigationBarTitleDisplayMode(.automatic)
            }
        }
    }
}


