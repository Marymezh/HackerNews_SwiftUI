//
//  WebView.swift
//  HackerNewsSwifUI
//
//  Created by Мария Межова on 24.06.2022.
//

import Foundation
import WebKit
import SwiftUI

struct WebView: UIViewRepresentable {
    
//    typealias UIViewType = WKWebView
    
    let urlString: String?
    
    @Binding var isLoading: Bool
    
    func makeUIView(context: Context) -> some UIView {
        let webView = WKWebView()
        webView.navigationDelegate = context.coordinator
        
        if let safeString = urlString {
            if let url = URL(string: safeString) {
                let request = URLRequest(url: url)
                webView.navigationDelegate = context.coordinator
                webView.load(request)
            }
        }
        return webView
    }
    
    func updateUIView(_ uiView: UIViewType, context: Context) {

    }
    
    func makeCoordinator() -> WebViewCoordinator {
        return WebViewCoordinator {
            isLoading = true
        } didFinish: {
            isLoading = false
        }

    }
}

class WebViewCoordinator: NSObject, WKNavigationDelegate {
    
    var didStartLoading: (() -> ())
    var didFinishLoading: (() -> ())
    
    
    init(didStart: @escaping () -> () = {}, didFinish: @escaping () -> () = {}) {
        didStartLoading = didStart
        didFinishLoading = didFinish
    }
    
    func webView(_ webView: WKWebView, didStartProvisionalNavigation navigation: WKNavigation!) {
        didStartLoading()
    }
    
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        didFinishLoading()
    }
    
    func webView(_ webView: WKWebView, didFail navigation: WKNavigation!, withError error: Error) {
        print(error.localizedDescription)
    }
    
  
    
    
}
