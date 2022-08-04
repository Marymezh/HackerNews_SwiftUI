//
//  DetailView.swift
//  HackerNewsSwifUI
//
//  Created by Мария Межова on 24.06.2022.
//

import SwiftUI
import WebKit

struct DetailView: View {
    
    @State private var isLoading: Bool = false
    
    let url: String?
    
    var body: some View {
        
        ZStack{
            
            WebView(urlString: url, isLoading: $isLoading)
            
            if isLoading == true {
                ProgressView("Loading...")
            } else {
                EmptyView()
            }
        }
    }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        DetailView(url: "https://www.google.com")
    }
}
