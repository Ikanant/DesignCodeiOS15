//
//  AccountView.swift
//  DesignCodeiOS15
//
//  Created by Jonathan Hernandez on 11/3/21.
//

import SwiftUI

struct AccountView: View {
    var body: some View {
        NavigationView {
            List {
                Section {
                    Text("Settings")
                    Text("Billing")
                    Text("Help")
                }
                .listRowSeparatorTint(.blue)
                .listRowSeparator(.hidden)
            }
            .listStyle(.sidebar)
            .navigationTitle("Account:")
        }
    }
}

struct AccountView_Previews: PreviewProvider {
    static var previews: some View {
        AccountView()
    }
}
