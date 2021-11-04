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
                VStack(spacing: 8) {
                    Image(systemName: "camera")
                        .symbolVariant(.circle.fill) // This is platform specific and can change in iOS vs ipadOS vs macOS
                        .font(.system(size: 32))
                        .symbolRenderingMode(.palette) // This will allow us to tweak colors across icon layers
                        .foregroundStyle(.blue, .blue.opacity(0.3))
                        .padding()
                        .background (Circle().fill(.ultraThinMaterial))
                        .background(
                            Image (systemName: "hexagon")
                                .symbolVariant(.fill)
                                .foregroundColor(.blue)
                                .font(.system(size: 200))
                                .offset(x: -50, y: -100)
                        )
                    Text("Jonathan Hernandez").font(.title.weight(.semibold))
                    HStack {
                        Image(systemName: "location").imageScale(.small) // This will not work for the Label component
                        Text("Raleigh, NC").foregroundColor(.secondary)
                    }
                }
                .frame (maxWidth: .infinity)
                .padding()
                Section {
                    Label ("Settings", systemImage: "gear")
                    Label ("Billing", systemImage: "creditcard")
                    Label ("Help", systemImage: "questionmark")
                }
            }
            .listRowSeparatorTint(.blue)
            .listRowSeparator(.hidden)
        }
        .listStyle(.sidebar)
        .navigationTitle("Account:")
    }
}

struct AccountView_Previews: PreviewProvider {
    static var previews: some View {
        AccountView()
    }
}
