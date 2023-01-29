//
//  DateFormatter.swift
//  Estarta_Tast_Listing
//
//  Created by Mohammad Hijjawi on 21/01/2023.
//

import Foundation
/**
 * function to format the date string
 * - Parameter dateString: the date string in the format "yyyy-MM-dd HH:mm:ss.SSSSSS"
 * - Returns: the formatted date string in the format "dd/MM/yyyy"
 */
 func formatDate(_ dateString: String) -> String {
    let dateFormatter = DateFormatter()
    dateFormatter.dateFormat = "yyyy-MM-dd HH:mm:ss.SSSSSS"
    guard let date = dateFormatter.date(from: dateString) else { return "" }
    dateFormatter.dateFormat = "dd/MM/yyyy"
    return dateFormatter.string(from: date)
}

