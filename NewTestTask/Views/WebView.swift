//
//  WebView.swift
//  NewTestTask
//
//  Created by Александра Адеева on 14.09.2023.
//

import SwiftUI
import WebKit

struct WebView: UIViewRepresentable {
    
    let url: URL
    
    func makeUIView(context: Context) -> WKWebView {
        let webView = WKWebView()
        webView.navigationDelegate = context.coordinator
        
        // for handling swipe left gesture
        let swipeLeftGesture = UISwipeGestureRecognizer(
            target: context.coordinator,
            action: #selector(context.coordinator.handleSwipeGesture(_:)))
        swipeLeftGesture.direction = .left
        webView.addGestureRecognizer(swipeLeftGesture)
        
        // for handling swipe right gesture
        let swipeRightGesture = UISwipeGestureRecognizer(
            target: context.coordinator,
            action: #selector(context.coordinator.handleSwipeGesture(_:)))
        swipeRightGesture.direction = .right
        webView.addGestureRecognizer(swipeRightGesture)
        
        return webView
    }
    
    func updateUIView(_ webView: WKWebView, context: Context) {
        let request = URLRequest(url: url)
        webView.load(request)
    }
    
    func makeCoordinator() -> Coordinator {
        Coordinator()
    }
    
    class Coordinator: NSObject, WKNavigationDelegate {
        @objc func handleSwipeGesture(_ gesture: UISwipeGestureRecognizer) {
            switch gesture.direction {
            case .left:
                if let webView = gesture.view as? WKWebView, webView.canGoForward {
                    webView.goForward()
                }
            case .right:
                if let webView = gesture.view as? WKWebView, webView.canGoBack {
                    webView.goBack()
                }
            default:
                break
            }
        }
    }
}
