//
//  User.swift
//  DesignCodeiOS15
//
//  Created by Jonathan Hernandez on 11/7/21.
//

import Foundation
import Combine

// By implementing an ObservableObject we ensure we have SwiftUI react to any changes to the properties of this class
// Identifiable will help us with not having to worry to designate IDs when using Firebase
class UserViewModel: ObservableObject, Identifiable {
    // Each ViewMode will hold a reference to the user:
    // @published will set it so any changes on the property will be listened too
    @Published var user: User
    @Published var userRepository = UserRepository()
    
    private var cancellables = Set<AnyCancellable>() // Memory management purposes
    
    var id = ""
    @Published var firstName: String = ""
    @Published var lastName: String = ""
    
    init() {
        self.user = debugUser
        
//        userRepository.map { users in
//            users.map { user in
//                user
//            }
//        }
//        .assign(to: .user, on: self)
        
        $user.map { user in
            user.firstName
        }
        .assign(to: \.firstName, on: self)
        .store(in: &cancellables) // This is for memory management purposes
        
        $user.map { user in
            user.lastName
        }
        .assign(to: \.lastName, on: self)
        .store(in: &cancellables)
    }
}
