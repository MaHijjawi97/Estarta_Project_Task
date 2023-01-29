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
/**
 This is an enumeration in Swift called "ContentState" that is used to represent the different states that a piece of content can be in. The enumeration has a generic type "Content" which refers to the type of content that is being represented. The enumeration has four cases:

 "failed": This case is used when an error occurs while trying to load the content. The case includes an associated value of type "Error" which provides information about the failure.
 "content": This case is used when the content has been successfully loaded. The case includes an associated value of the generic type "Content" which holds the actual content.
 "loading": This case is used when the content is currently in the process of being loaded.
 "initial": This case is used when the content has not yet been loaded or when the view is first initialized.
 This enum is used in the StateView struct above to determine the current state of the content being displayed.

**/
