//
//  ContentView.swift
//  Chuck Norris Jokes SwiftUI
//
//  Created by mac on 24/02/2022.
//

import SwiftUI
import Foundation
struct ContentView: View {
    
    @State private var jokes : [Joke] = []
    var  buttontext :String {
        if jokes.isEmpty { return "Fetch Jokes"} else{
            return "Fetch More Jokes"}
    }
    var body: some View {
        
        List{
            if jokes.isEmpty{
                Text("No Jokes Loaded Yet")
            }
            
            ForEach(jokes){joke in
                VStack{
                AsyncImage(url: URL(string : joke.icon_url))
                    Text(joke.value)
                }
           
                
            }
            
            
            Button(action: {
                Task {
                    guard let joke = await apiService() else {
                        return
                    }
                    jokes.append(joke)
                    
                            }
            }){
                
                
                Label(buttontext,systemImage: "command.circle.fill")
            }.labelStyle(.titleAndIcon)
                .buttonStyle(.bordered)
                
    }
      
        .onAppear(perform: {
            Task{
                guard let joke = await apiService() else {
                    return
                }
                jokes.append(joke)
            }
            
        })
    }
    
   
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct Joke: Codable,Identifiable {
let id = UUID()
    let value: String
    let icon_url:String
    
}
