//
//  ContentView.swift
//  HackerNewsSwifUI
//
//  Created by Мария Межова on 23.06.2022.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView {
            List(posts) { post in
                Text(post.title)
            }
            .navigationBarTitle("Hacker News")
        }
    }
}

struct Post: Identifiable {
    let id: String
    let title: String
    
}

let posts = [
Post(id: "1", title: "Hello"),
Post(id: "2", title: "Bonjour"),
Post(id: "3", title: "Hola!")
]



struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
