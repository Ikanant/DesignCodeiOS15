//
//  User.swift
//  DesignCodeiOS15
//
//  Created by Jonathan Hernandez on 11/7/21.
//

import Foundation

struct User {
    var id: String
    var firstName: String
    var lastName: String
    var admin: Bool
}

#if DEBUG
let debugUser = User(id: "TEST", firstName: "Jonathan", lastName: "Hernandez", admin: true)
#endif
