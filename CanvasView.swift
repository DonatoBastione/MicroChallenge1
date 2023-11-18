//
//  CanvasView.swift
//  MicroChallenge1
//
//  Created by DONATO BASTIONE on 14/11/23.
//

import Foundation
import PencilKit
import SwiftUI

struct CanvasView : UIViewRepresentable {
    @Binding var barCheck: Bool
    @Binding var canvasView: PKCanvasView
    @State var toolPicker = PKToolPicker()
    
    
    
    func makeUIView(context: Context) -> PKCanvasView {
        
        
        
        canvasView.tool = PKInkingTool(.pen, color: .gray, width: 10)
        
        #if targetEnvironment(simulator)
            canvasView.drawingPolicy = .anyInput
        #endif
        
        showToolPicker()
        
        
        return canvasView
    }
    
    func updateUIView(_ uiView: PKCanvasView, context: Context) {
        toolPicker.setVisible(barCheck, forFirstResponder: canvasView)
    }
    

}

private extension CanvasView {
  func showToolPicker() {
    // 1
    toolPicker.setVisible(true, forFirstResponder: canvasView)
    // 2
    toolPicker.addObserver(canvasView)
    // 3
    canvasView.becomeFirstResponder()
  }
}



