//
//  ContentView.swift
//  MicroChallenge1
//
//  Created by DONATO BASTIONE on 14/11/23.
//

import SwiftUI
import PencilKit

struct ContentView: View {
    @State var canvasView: PKCanvasView
    @State var toolBar = true
    @State var brush = false
    var body: some View {
        NavigationStack{
            ZStack(alignment: Alignment(horizontal: .center, vertical: .bottom)){
                
                CanvasView(barCheck: $brush, canvasView: $canvasView)
                        

            
                if toolBar{
                    TabBar(state: $toolBar, state1: $brush).transition(.move(edge: .bottom))
                        .zIndex(1.0)
                        
                        
                }
            }
            .toolbar {
                Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                    Image(systemName: "square.and.arrow.up")
                })
                Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                    Image(systemName: "ellipsis.circle")
                })
                if brush{
                    Button(action: {withAnimation{
                        brush.toggle()
                        toolBar.toggle()
                        
                        
                    }}, label: {
                        Text("Done")
                            .fontWeight(.bold)
                    })
                }else{
                    Button(action: {}, label: {
                        Image(systemName: "square.and.pencil")
                    })
                }
                }
            }
        }
}



#Preview {
    ContentView(canvasView: PKCanvasView())
}
