//
//  ContentView.swift
//  Mobile
//
//  Created by Dwayne Langley on 6/23/22.
//

import SwiftUI

struct ContentView: View {
    @State var content: AttributedString = "Tap Button to Get a Post"
    
    var body: some View {
        ScrollView {
            Text(content)
        }
        Button("Grab A Post") {
        }.border(.cyan, width: 1)
            .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
