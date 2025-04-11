//
//  ExternalWebLinkView.swift
//  Africa
//
//  Created by Aakash Gupta on 06/04/25.
//

import SwiftUI

struct ExternalWebLinkView: View {
    // MARK: - PROPERTIES
    let link: String
    let name: String
    
    // MARK: - BODY
    var body: some View {
        GroupBox {
            HStack {
                Image(systemName: "globe")
                
                Text("Wikipedia")
                
                Spacer()
                
                Group {
                    Image(systemName: "arrow.up.right.square")
                    
                    Link(
                        name,
                        destination: URL(string: link) ?? URL(string: "https://wikipedia.org")!
                    )
                }
            }
        }
    }
}

// MARK: - PREVIEW
#Preview {
    ExternalWebLinkView(
        link: "https://en.wikipedia.org/wiki/Lion",
        name: "Lion"
    )
        .previewLayout(.sizeThatFits)
        .padding()
}
