//
//  Network.swift
//  NewTestTask
//
//  Created by Александра Адеева on 14.09.2023.
//

import SwiftUI

final class Network: ObservableObject {
    @Published var fact: Fact? = nil
    
    var alertText: String = ""
    @Published var isShowAlert: Bool = false
    
    private static let decoder = JSONDecoder()
    
    func getFacts() async {
        guard let url = URL(string: "https://api.api-ninjas.com/v1/facts?limit=1") else { return }
        
        var urlRequest = URLRequest(url: url)
        urlRequest.setValue("avNvG5iRNfjIvoVHU4Roww==JfRePOlBCsix1skl",
                            forHTTPHeaderField: "X-Api-Key")
        
        do {
            let (data, _) = try await URLSession.shared.data(for: urlRequest)
            let decodedFacts = try Self.decoder.decode([Fact].self, from: data)
            DispatchQueue.main.async {
                self.fact = decodedFacts.first
            }
        } catch {
            self.showAlert(with: error.localizedDescription)
        }
    }
    
    private func showAlert(with text: String) {
        alertText = text
        DispatchQueue.main.async{
            self.isShowAlert = true
        }
    }
}
