//
//  ContentView.swift
//  Chuck Norris Jokes SwiftUI
//
//  Created by mac on 24/02/2022.
//

import SwiftUI

struct ContentView: View {
    
    @State private var jokes : [Joke] = []
    var body: some View {
        
        List{
            if jokes.isEmpty{
                Text("No Jokes Loaded Yet")
            }
            
            ForEach(jokes){joke in
                Text(joke.value)
                
            }
            
            
            Button(action: {Task {
                let (data, _) = try await URLSession.shared.data(from: URL(string:"https://api.chucknorris.io/jokes/random")!)
                let decodedResponse = try? JSONDecoder().decode(Joke.self, from: data)
              let   joke = decodedResponse!
                jokes.append(joke)
            }}){
                
                
                Label("Fetch Joke",systemImage: "command.circle.fill")
            }.labelStyle(.titleAndIcon)
                .buttonStyle(.bordered)
                
    }
    }
    
    struct Joke: Codable,Identifiable {
        let id = UUID()
        let value: String
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
