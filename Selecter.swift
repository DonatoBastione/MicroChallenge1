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
                                UnevenRoundedRectangle(topLeadingRadius: 25.0, bottomLeadingRadius: 0.0, bottomTrailingRadius: 0.0, topTrailingRadius: 25.0)
                                    .frame(width: 140.0, height: 100.0)
                                    .foregroundStyle(Color.white)
                                    .padding(.bottom, 40.0)
                                disegni.drawing[i].preview
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .frame(width: 140.0, height: 100.0)
                                    .clipShape(RoundedRectangle(cornerRadius: 25.0))
                                    .padding(.bottom, 40.0)
                                Text(disegni.drawing[i].name)
                                    .foregroundColor(Color.black)
                                    .multilineTextAlignment(.leading)
                                    .padding(.top, 100.0)
                                    
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
                        .accessibilityLabel(/*@START_MENU_TOKEN@*/"New Canvas"/*@END_MENU_TOKEN@*/)
                        .accessibilityHint("Tap here to create a new canvas")
                        
                    }
                    
                    ToolbarItem(placement: .topBarTrailing){
                        Button(action: {}, label: {
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
