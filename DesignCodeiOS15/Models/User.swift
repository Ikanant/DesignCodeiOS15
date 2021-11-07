//
//  User.swift
//  DesignCodeiOS15
//
//  Created by Jonathan Hernandez on 11/7/21.
//

import Foundation
import FirebaseFirestore
import FirebaseFirestoreSwift

struct User: Codable, Identifiable {
    @DocumentID var id: String?
    var firstName: String
    var lastName: String
    var admin: Bool
}

#if DEBUG
let debugUser = User(id: "TEST", firstName: "Jonathan", lastName: "Hernandez", admin: true)
#endif
