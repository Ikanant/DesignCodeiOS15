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
                    NavigationLink(destination: ContentView()) {
                        Label ("Settings", systemImage: "gear")
                    }
                    // Now there is a new way to do the same thing as NavigationLink but a bit cleaner...
                    // Check link bellow: ACTION and LABEL
                    NavigationLink { ContentView() } label:  {
                        Label ("Billing", systemImage: "creditcard")
                    }
                    NavigationLink { Text("BANANA") } label: {
                        Label ("Help", systemImage: "questionmark")
                    }
                }
                // Modifiers for the parent component will apply to all the child ones:
                .accentColor(.primary)
                .listRowSeparatorTint(.blue)
                .listRowSeparator(.hidden)
                
                Section {
                    Link(destination: URL(string: "https://capturedzeal.com")!) {
                        HStack {
                            Label("Website", systemImage: "house")
                            Spacer()
                            Image(systemName: "link").foregroundColor(.secondary)
                        }
                    }
                    Link(destination: URL(string: "https://instagram.com/capturedzeal")!) {
                        HStack {
                            Label("Website", systemImage: "camera")
                            Spacer()
                            Image(systemName: "link").foregroundColor(.secondary)
                        }
                    }
                }
                .accentColor(.primary)
                .listRowSeparator(.hidden)
            }
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
