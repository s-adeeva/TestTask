//
//  StorageView.swift
//  NewTestTask
//
//  Created by Александра Адеева on 14.09.2023.
//

import SwiftUI
import RealmSwift

struct StorageView: View {
    @ObservedResults(ToDo.self) var toDos
    @State private var name: String = ""
    @FocusState private var focus: Bool?
    
    var body: some View {
        NavigationView {
            VStack {
                HStack {
                    TextField("New ToDo", text: $name)
                        .focused($focus, equals: true)
                        .textFieldStyle(.roundedBorder)
                    Button {
                        onTapSave()
                    } label: {
                        Text("Save")
                            .padding(.horizontal, 10)
                    }
                    .buttonStyle(.borderedProminent)
                    .disabled(name.isEmpty)
                }
                .padding()
                List(toDos) { toDo in
                    Text(toDo.name)
                        .listRowSeparator(.hidden)
                }
                .listStyle(.grouped)
            }
            .navigationTitle("Things to do")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
    
    private func onTapSave() {
        $toDos.append(ToDo(name: name))
        name = ""
        focus = nil
    }
}

struct StorageView_Previews: PreviewProvider {
    static var previews: some View {
        StorageView()
    }
}
