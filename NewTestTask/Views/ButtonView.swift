//
//  ButtonView.swift
//  NewTestTask
//
//  Created by Александра Адеева on 14.09.2023.
//

import SwiftUI

struct ButtonView: View {
    @State private var isPresentWebView = false
    @AppStorage("status") var status = false
    
    var body: some View {
        NavigationStack {
            Button {
                status = true
            } label: {
                Text("Tap me")
                    .padding(.horizontal, 20)
            }
            .buttonStyle(.borderedProminent)
        }
    }
}

struct ButtonView_Previews: PreviewProvider {
    static var previews: some View {
        ButtonView()
    }
}
