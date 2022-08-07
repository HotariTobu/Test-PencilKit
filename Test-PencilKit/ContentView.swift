//
//  ContentView.swift
//  Test-PencilKit
//
//  Created by HotariTobu on 2021/08/08.
//

import SwiftUI
import PencilKit

struct MyTool: Identifiable {
    let id = UUID()
    let name: String
    let tool: PKTool
}

struct ContentView: View {
    @State var toolIndex = 0
    
    let myTools = [
        MyTool(name: "Pen", tool: PKInkingTool(.pen, color: .red, width: 2)),
        MyTool(name: "Pencil", tool: PKInkingTool(.pencil, color: .green, width: 2)),
        MyTool(name: "Marker", tool: PKInkingTool(.marker, color: .blue, width: 2)),
        MyTool(name: "Lasso", tool: PKLassoTool()),
        MyTool(name: "Bitmap", tool: PKEraserTool(.bitmap)),
        MyTool(name: "Vector", tool: PKEraserTool(.vector)),
    ]
    
    var body: some View {
        VStack {
            PenKitView(isUseTools: .constant(false), tool: .constant(myTools[toolIndex].tool))
            Picker(selection: $toolIndex, label: Text("ToolPicker"), content: {
                ForEach(0 ..< myTools.count) { index in
                    Text(myTools[index].name)
                }
            })
            .pickerStyle(DefaultPickerStyle())
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
