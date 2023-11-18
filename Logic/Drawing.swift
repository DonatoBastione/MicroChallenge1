//
//  Drawing.swift
//  MicroChallenge1
//
//  Created by DONATO BASTIONE on 16/11/23.
//

import Foundation
import SwiftUI
import PencilKit

struct Drawing: Identifiable{
    var id: UUID = UUID()
    var name: String = "Untitled"
    @State var canvas: PKDrawing
    var preview: Image = Image(systemName: "scribble")

}
