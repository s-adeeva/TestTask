//
//  ToDo.swift
//  NewTestTask
//
//  Created by Александра Адеева on 14.09.2023.
//

import Foundation
import RealmSwift

final class ToDo: Object, ObjectKeyIdentifiable {
    @Persisted(primaryKey: true) var id: ObjectId
    @Persisted var name: String
    @Persisted var completed: Bool
    
    convenience init(name: String) {
        self.init()
        self.name = name
    }
}
