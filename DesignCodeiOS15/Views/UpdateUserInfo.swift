//
//  UpdateUserInfo.swift
//  DesignCodeiOS15
//
//  Created by Jonathan Hernandez on 11/7/21.
//

import SwiftUI

struct UpdateUserInfo: View {
    // In order to bind the UI to the object it needs to be an observable object
    @ObservedObject var userVM = UserViewModel(user: debugUser)
    
    var onCommit: (User) -> (Void) = { _ in }
    
    var body: some View {
        NavigationView {
            List {
                Label("First Name", systemImage: "person")
                TextField("First Name", text: $userVM.user.firstName)
                Label("Last Name", systemImage: "person")
                TextField("Last Name", text: $userVM.user.lastName)
                Spacer()
                
                Button(action: {
                    self.onCommit(self.userVM.user)
                }) {
                    Text("SAVE")
                }.frame(alignment: .trailing)
            }
        }
        .listStyle(.sidebar)
        .navigationTitle("Account:")
    }
}

struct UpdateUserInfo_Previews: PreviewProvider {
    static var previews: some View {
        UpdateUserInfo()
    }
}
