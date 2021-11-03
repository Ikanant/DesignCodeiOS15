//
//  Styles.swift
//  DesignCodeiOS15
//
//  Created by Jonathan Hernandez on 11/3/21.
//

import SwiftUI

struct StrokeStyle: ViewModifier {
    var cornerRadious: CGFloat
    
    @Environment(\.colorScheme) var colorScheme // This means I can get whatever the user set for his color: DARK or LIGHT mode
    func body(content: Content) -> some View {
        content.overlay(
            RoundedRectangle(
                cornerRadius: cornerRadious,
                style: .continuous
            )
                .stroke(
                    .linearGradient(
                        colors: [
                            .white.opacity(colorScheme == .dark ? 0.6: 0.3),
                            .black.opacity(colorScheme == .dark ? 0.3: 0.1)
                        ],
                        startPoint: .top,
                        endPoint: .bottom
                    )
                )
                .blendMode(.overlay)
        )
    }
}

// Having this extension allows me to not have to specify modifier
// for the View that consumes this style
extension View {
    func strokeStyle(cornerRadious: CGFloat = 30) -> some View {
        modifier(StrokeStyle(cornerRadious: cornerRadious))
    }
}
