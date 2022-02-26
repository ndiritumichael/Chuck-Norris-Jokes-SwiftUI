//
//  Chuck_Norris_Jokes_SwiftUIApp.swift
//  Chuck Norris Jokes SwiftUI
//
//  Created by mac on 24/02/2022.
//

import SwiftUI

@main
struct Chuck_Norris_Jokes_SwiftUIApp: App {
    var body: some Scene {
        WindowGroup {
            NavigationView{
            ContentView()
                    .navigationTitle("Norris Jokes")
                        .navigationBarTitleDisplayMode(.large)
                        
            }
        }
    }
}
