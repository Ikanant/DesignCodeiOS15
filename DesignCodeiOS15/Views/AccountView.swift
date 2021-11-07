//
//  AccountView.swift
//  DesignCodeiOS15
//
//  Created by Jonathan Hernandez on 11/3/21.
//

import SwiftUI

struct AccountView: View {
    @State var isDeleted = false
    @State var isPinned = false
    
    var body: some View {
        NavigationView {
            List {
                profile
                menu
                links
            }
        }
        .listStyle(.sidebar)
        .navigationTitle("Account:")
    }
    
    var profile: some View {
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
    }
    
    var menu: some View {
        Section {
            NavigationLink(destination: UpdateUserInfo()) {
                Label ("Update User Info", systemImage: "gear")
            }
            // Now there is a new way to do the same thing as NavigationLink but a bit cleaner...
            // Check link bellow: ACTION and LABEL
            NavigationLink { ContentView() } label:  {
                Label ("Billing", systemImage: "creditcard")
            }
            NavigationLink { HelpView() } label: {
                Label ("Help", systemImage: "questionmark")
            }
        }
        // Modifiers for the parent component will apply to all the child ones:
        .accentColor(.primary)
        .listRowSeparatorTint(.blue)
        .listRowSeparator(.hidden)
    }
    
    var links: some View {
        Section {
            if !isDeleted {
                Link(destination: URL(string: "https://capturedzeal.com")!) {
                    HStack {
                        Label("Website", systemImage: "house")
                        Spacer()
                        Image(systemName: "link").foregroundColor(.secondary)
                    }
                }
                .swipeActions (edge: .leading, allowsFullSwipe: true){
                    Button(action: { isDeleted = true }) {
                        Label("Delete", systemImage: "trash")
                    }
                    .tint(.red) // Will override text and will color entire icon
                    // We can have multiple buttons:
                    pinButton
                }
            }
            
            Link(destination: URL(string: "https://instagram.com/capturedzeal")!) {
                HStack {
                    Label("Website", systemImage: "camera")
                    Spacer()
                    Image(systemName: "link").foregroundColor(.secondary)
                }
            }
            .swipeActions (edge: .leading, allowsFullSwipe: true) {
                pinButton
            }
        }
        .accentColor(.primary)
        .listRowSeparator(.hidden)
    }
    
    var pinButton: some View {
        Button { isPinned.toggle() } label: {
            if isPinned {
                Label("Unpin", systemImage: "pin.slash")
            }
            else {
                Label("Pin", systemImage: "pin")
            }
            Label("Pin", systemImage: "pin")
        }
        .tint(isPinned ? .gray : .yellow)
    }
}

struct AccountView_Previews: PreviewProvider {
    static var previews: some View {
        AccountView()
    }
}
