//
//  ContentView.swift
//  MicroChallenge1
//
//  Created by DONATO BASTIONE on 14/11/23.
//

import SwiftUI
import PencilKit

struct ContentView: View {
    @State var canvasView = PKCanvasView()
    @State var toolBar = true
    @State var brush = false
    
    var canvasIn: Drawing
    
    var new: Bool
    
    var disegni: DrawingList
        
    var body: some View {
        
        NavigationStack{
            ZStack(alignment: Alignment(horizontal: .center, vertical: .bottom)){
                
                CanvasView(barCheck: $brush, canvasView: $canvasView)
                        
                if toolBar{
                    TabBar(state: $toolBar, state1: $brush).transition(.move(edge: .bottom))
                        .zIndex(1.0)
                        
                        
                }
            }
            .onAppear(){
                canvasView.drawing = canvasIn.canvas
            }
            .onDisappear{
                if new{
                    disegni.drawing.append(Drawing(canvas: canvasView.drawing))
                    canvasView.drawing = PKDrawing()
                }
            }
            .toolbar {
                Button(action: {
                    
                }, label: {
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
                    Button(action: {
                        canvasView.drawing = PKDrawing()
                    }, label: {
                        Image(systemName: "square.and.pencil")
                    })
                }
                }
            .toolbar{
                ToolbarItem(placement: .topBarLeading){
                    Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                        Image(systemName: "arrow.uturn.backward.circle")
                    })

                }
            }
            }
        }
}



#Preview {
   ContentView(canvasIn: Drawing(canvas: PKDrawing()), new: false, disegni: DrawingList())
}
