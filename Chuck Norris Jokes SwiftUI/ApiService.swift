//
//  ApiService.swift
//  Chuck Norris Jokes SwiftUI
//
//  Created by mac on 25/02/2022.
//

import Foundation

func apiService()  async -> Result<Joke,ApiError>{
    
    do{
        let (data, response) = try await URLSession.shared.data(from: URL(string:"https://api.chucknorris.io/jokes/random")!)
        guard let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200 else {
           // fatalError("something is wrong")
            let decodedError  = try? JSONDecoder().decode(ApiError.self, from: data)
            
            debugPrint(decodedError)
            if(decodedError != nil){
                return Result.failure(decodedError!)
            }
            
            return Result.failure(
                ApiError.defaulterror())
        }
    
           
                       let decodedResponse = try? JSONDecoder().decode(Joke.self, from: data)
          
        if let decodedResponse{
            return Result.success(decodedResponse)
        }
       } catch{
           debugPrint(error)
           return Result.failure(ApiError.defaulterror())
       }
    


    
    return Result.failure(ApiError.defaulterror())
                
}
