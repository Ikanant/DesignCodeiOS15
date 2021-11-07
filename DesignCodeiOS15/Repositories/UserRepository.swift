//
//  UserRepository.swift
//  DesignCodeiOS15
//
//  Created by Jonathan Hernandez on 11/7/21.
//

import Foundation
import FirebaseFirestore
import FirebaseFirestoreSwift

class UserRepository: ObservableObject {
    
    let db = Firestore.firestore()
    
    @Published var users = [User]()
    
    init() {
        loadData()
    }
    
    func loadData() {
        db.collection("users").addSnapshotListener { (querySnapshot, err) in
            if let querySnapshot = querySnapshot {
                self.users = querySnapshot.documents.compactMap { document in
                    try? document.data(as: User.self)
                }
            }
        }
    }
}
