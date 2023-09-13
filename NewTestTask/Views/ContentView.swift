//
//  ContentView.swift
//  NewTestTask
//
//  Created by Александра Адеева on 14.09.2023.
//

import SwiftUI

struct ContentView: View {
    @StateObject private var viewModel = Network()
    @AppStorage("status") var status = false
    
    var body: some View {
        Group {
            NavigationStack {
                TabView {
                    StorageView()
                        .tabItem {
                            Label("To Do", systemImage: "square.and.arrow.down")
                        }
                    NetworkView(viewModel: viewModel)
                        .tabItem {
                            Label("New facts", systemImage: "book.fill")
                        }
                    ButtonView()
                        .tabItem {
                            Label("Google", systemImage: "network")
                        }
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
