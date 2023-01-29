//
//  StateView.swift
//  Estarta_Tast_Listing
//
//  Created by Mohammad Hijjawi on 25/01/2023.
//

import SwiftUI

struct StateView<Content, ContentView: View>: View {
    @State var state: ContentState<Content> = .initial
    @ViewBuilder var viewForContent: ((Content) -> ContentView)
    
    let viewModel: any LoadableViewModelType<Content>
    
    init(viewModel: any LoadableViewModelType<Content>, @ViewBuilder viewForContent: @escaping ((Content) -> ContentView)) {
        self.viewForContent = viewForContent
        self.viewModel = viewModel
    }
    
    var body: some View {
        Group {
            switch self.state {
            case .initial:
                Text("Hello World!")
            case .content(let content):
                viewForContent(content)
            case .failed(let error):
                Text("Failed loading Content: \(error.localizedDescription)")
            case .loading:
                ProgressView()
                    .progressViewStyle(.circular)
            }
        }.task {
            self.state = .loading
            do {
                let content = try await self.viewModel.loadContents()
                self.state = .content(content)
            } catch {
                self.state = .failed(error)
            }
            
        }
    }
}
