//
//  model.swift
//  Chuck Norris Jokes SwiftUI
//
//  Created by Michael Ndiritu on 14/04/2023.
//

import Foundation
struct Joke: Codable,Identifiable {
    let id = UUID()
    let value: String
    let icon_url:String
    let categories : [String]
    let created_at : String
    
}


struct ApiError : Codable,Error{
    let error: Bool
    let message : String
    
    
    
    
}

extension ApiError{
    static func defaulterror() -> ApiError {
        return ApiError(
        error: true, message: "Something went wrong please try again")
        
    }
}
