//
//  Selecter.swift
//  MicroChallenge1
//
//  Created by DONATO BASTIONE on 16/11/23.
//

import SwiftUI
import PencilKit

struct Selecter: View {
    let columns = [GridItem(.flexible()), GridItem(.flexible())]
    
    @State private var searchText = ""
    
    @StateObject var disegni = DrawingList()
    

    var body: some View {
        NavigationStack{
            ScrollView{
                LazyVGrid(columns: columns){
                    ForEach(disegni.drawing){drawing in
                        NavigationLink(destination: ContentView(canvasIn: drawing, new: false, disegni: disegni) ,label:{
                            ZStack{
                                Rectangle()
                                    .frame(width: 150.0, height: 150.0)
                                    .foregroundStyle(Color.gray)
                                drawing.preview
                            } .clipShape(RoundedRectangle(cornerRadius: 25.0))
                        }
)
                    
                    }
                }
                .toolbar{
                    
                    ToolbarItem(placement: .topBarTrailing){
                        NavigationLink(
                            destination: ContentView(canvasIn: Drawing(name: "new", canvas: PKDrawing()), new: true, disegni: disegni),
                            label: {
                                    Image(systemName: "square.and.pencil")

                            })
                    }
                    
                    ToolbarItem(placement: .topBarTrailing){
                        Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                            Image(systemName: "ellipsis.circle")
                        })

                    }
                    
                }
                
            }
            .navigationTitle("All Boards")
        }.searchable(text: $searchText)
    }
}

#Preview {
    Selecter()
}
