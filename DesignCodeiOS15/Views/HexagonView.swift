//
//  HexagonView.swift
//  DesignCodeiOS15
//
//  Created by Jonathan Hernandez on 11/9/21.
//

import SwiftUI

struct HexagonView: View {
    var body: some View {
        // Canvas are way better than using the SwiftUI View instead
        // Canvas works as a graphic that will provide great performance gain (great for animations)
        Canvas { context, size in
            
            // I can use modifier in the Text but NOT in the context
            context.draw(Text("Design").font(.largeTitle), at: CGPoint(x: 50,y: 20))
            context.fill(Path(ellipseIn: CGRect(x: 0, y: 0, width: 100, height: 100)), with: .color(Color.pink))
            context.draw(Image("Blob 1"), in: CGRect(x: 0, y: 0, width: 200, height: 200))
            context.draw(Image(systemName: "hexagon.fill"), in: CGRect(x: 0, y: 0, width: size.width, height: size.height))
        }
        .frame(width: 200, height: 212)
        .foregroundStyle(.linearGradient(colors: [.pink, .blue], startPoint: .topLeading, endPoint: .bottomTrailing))
    }
}

struct HexagonView_Previews: PreviewProvider {
    static var previews: some View {
        HexagonView()
    }
}
