//
//  NetworkView.swift
//  NewTestTask
//
//  Created by Александра Адеева on 14.09.2023.
//

import SwiftUI

struct NetworkView: View {
    @ObservedObject var viewModel: Network
    
    var body: some View {
        NavigationView {
            VStack {
                if let fact = viewModel.fact?.fact {
                    Text(fact)
                        .foregroundColor(.white)
                        .padding()
                        .background(Color.accentColor)
                        .cornerRadius(10)
                } else {
                    Text("Loading facts...")
                }
            }
            .padding()
            .navigationTitle("Facts")
            .navigationBarTitleDisplayMode(.inline)
        }
        .task {
            await viewModel.getFacts()
        }
        .alert(viewModel.alertText, isPresented: $viewModel.isShowAlert) {
            Button("OK", action: { viewModel.isShowAlert = false })
        }
    }
}

struct NetworkView_Previews: PreviewProvider {
    static var previews: some View {
        NetworkView(viewModel: Network())
    }
}
