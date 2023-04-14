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
    @State private var errorMessage : String? = nil
    var body: some View {
        
        List{
            if jokes.isEmpty{
                Text("No Jokes Loaded Yet")
            }
            if errorMessage != nil{
                Text("\(errorMessage!)")
                
            }
            
            ForEach(jokes){joke in
                VStack{
                AsyncImage(url: URL(string : joke.icon_url))
                    Text(joke.value)
                }
           
                
            }
            
            
            Button(action: {
                fetchJokes()
            }){
                
                
                Label(buttontext,systemImage: "command.circle.fill")
            }.labelStyle(.titleAndIcon)
                .buttonStyle(.bordered)
                
    }
      
        .onAppear(perform: {
           
            fetchJokes()
        })
    }
    
    func fetchJokes ()  {
    Task{
  
        let result =  await apiService()
        switch result {
        case .success(let joke):
            jokes.append(joke)
        case .failure(let failure):
            errorMessage = failure.message
           
        }
        
         
       
        }
        
    }
    
   
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}


