//
//  ApiService.swift
//  Chuck Norris Jokes SwiftUI
//
//  Created by mac on 25/02/2022.
//

import Foundation

func apiService()  async -> Joke?{
    do{
        let (data, response) = try await URLSession.shared.data(from: URL(string:"https://api.chucknorris.io/jokes/random")!)
    guard let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200 else {
         fatalError("something is wrong")
        }
                    let decodedResponse = try? JSONDecoder().decode(Joke.self, from: data)
        guard let   joke = decodedResponse else {
            debugPrint(data)
            return nil
        }
                    return joke
    } catch{
        return nil
    }
                
}
