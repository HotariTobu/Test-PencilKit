//
//  PenKitView.swift
//  C-Note
//
//  Created by HotariTobu on 2021/08/07.
//

import SwiftUI
import PencilKit

struct PenKitView: UIViewRepresentable {
    @Binding var isUseTools: Bool
    @Binding var tool: PKTool
    
    typealias UIViewType = PKCanvasView
    let toolPicker = PKToolPicker()
    
    let handler = CanvasEventHandler()
    
    func makeUIView(context: Context) -> PKCanvasView {
        let pkcView = PKCanvasView()
        
        //指とペンからの入力を受け付ける
        pkcView.drawingPolicy = PKCanvasViewDrawingPolicy.anyInput
        
        if isUseTools {
            toolPicker.addObserver(pkcView)
            toolPicker.setVisible(true, forFirstResponder: pkcView)
            pkcView.becomeFirstResponder()
        }
        
        return pkcView
    }
    
    func updateUIView(_ uiView: PKCanvasView, context: Context) {
        uiView.tool = tool

        uiView.delegate = handler
    }
    
}

struct PenKitView_Previews: PreviewProvider {
    static var previews: some View {
        PenKitView(isUseTools: .constant(true), tool: .constant(PKInkingTool(.pen, color: .blue, width: 2)))
    }
}

struct SomeView: UIViewRepresentable {
    typealias UIViewType = UIView
    
    func makeUIView(context: Context) -> UIView {
        UIView()
    }
    
    func updateUIView(_ uiView: UIView, context: Context) {
    }
}
