//
//  TabBar.swift
//  MicroChallenge1
//
//  Created by DONATO BASTIONE on 14/11/23.
//

import SwiftUI

struct TabBar: View {
    @Binding var state: Bool
    @Binding var state1: Bool
    var body: some View {
        VStack{
            HStack(alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/){
                Spacer()
                Button(action: {withAnimation{
                    state.toggle()
                    state1.toggle()
                }}, label: {
                    Image(systemName: "pencil.tip.crop.circle")
                })
                Spacer()
                Spacer()
                Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                    Image(systemName: "note.text")                })
                Spacer()
                Spacer()
                Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                    Image(systemName: "square.on.circle")
                })
                Spacer()
                Spacer()
                Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                    Image(systemName: "character.textbox")
                })
                Spacer()
                Spacer()
                Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                    Image(systemName: "photo.on.rectangle")
                })
                Spacer()
                
            }
        }.background(.white)

    }
}

#Preview {
    TabBar(state: .constant(true),state1: .constant(true))
}
