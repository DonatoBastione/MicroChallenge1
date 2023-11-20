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
                    ForEach(0..<disegni.drawing.count, id: \.self){i in
                        NavigationLink(destination: ContentView(canvasIn: disegni.drawing[i], new: false, disegni: disegni, index: i) ,label:{
                            ZStack{
                                Rectangle()
                                    .frame(width: 150.0, height: 150.0)
                                    .foregroundStyle(Color.gray)
                                disegni.drawing[i].preview
                            } .clipShape(RoundedRectangle(cornerRadius: 25.0))
                        }
)
                    
                    }
                }
                .toolbar{
                    
                    ToolbarItem(placement: .topBarTrailing){
                        NavigationLink(
                            destination: ContentView(canvasIn: Drawing(name: "new", canvas: PKDrawing()), new: true, disegni: disegni, index: 0),
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
