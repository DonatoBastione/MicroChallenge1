//
//  ToolBarTest.swift
//  MicroChallenge1
//
//  Created by DONATO BASTIONE on 14/11/23.
//

import SwiftUI

struct ToolBarTest: View {
    var body: some View {
            NavigationStack {
                VStack{
                    Text("boh")
                    TabBar()
                }
                .toolbar {
                    Text("Save")
                }
                .padding()
            }
    }
}

#Preview {
    ToolBarTest()
}
