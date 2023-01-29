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
/**
 This is a SwiftUI view called "StateView" that is used to display the content of a view model that conforms to the "LoadableViewModelType" protocol. The view has a generic type "Content" and a generic type "ContentView" which is a view. The view has a state variable "state" that is used to keep track of the current state of the view, such as initial, content, failed, and loading. The view also has a function "viewForContent" that takes in the content and returns a view. The view takes in a view model as an input and uses it to load the content. The body of the view uses a switch statement to display different views based on the state of the view. If the state is "initial" or "loading" it will display a Text or ProgressView. When the view first loads it will execute a task that sets the state to loading and attempts to load the content from the view model. If it is successful the state will be set to content and the content will be displayed. If it is unsuccessful the state will be set to failed and an error message will be displayed.
 **/
