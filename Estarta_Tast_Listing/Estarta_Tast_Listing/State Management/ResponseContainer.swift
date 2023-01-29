//
//  ResponseContainer.swift
//  Estarta_Tast_Listing
//
//  Created by Mohammad Hijjawi on 25/01/2023.
//

import Foundation

struct ResponseContainer<Content> {
    let results: Content
}

extension ResponseContainer: Codable where Content: Codable { }

/**
 This is a protocol in Swift called "LoadableViewModelType" that is used to define the behavior of a view model that can load content. The protocol has a generic type "ContentType" which refers to the type of content that the view model is responsible for loading. The protocol has a single function "loadContents" that is defined as an asynchronous function which returns the content and throws an error if something goes wrong. The function is marked with the "async" keyword which means that the function can be awaited and can be awaited by other functions. The function returns the type of ContentType.

 The view model that conforms to this protocol needs to implement this function which will load the content and return it. This function is called in the StateView struct above to load the content when the view is first loaded.




 */
