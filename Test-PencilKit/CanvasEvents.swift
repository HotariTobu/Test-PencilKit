//
//  CanvasEvents.swift
//  Test-PencilKit
//
//  Created by HotariTobu on 2021/08/08.
//

import Foundation
import PencilKit
import SwiftUI

class CanvasEventHandler: NSObject, PKCanvasViewDelegate {
    func canvasViewDrawingDidChange(_ view: PKCanvasView) {
        print("change")
    }

    func canvasViewDidFinishRendering(_ view: PKCanvasView) {
        print("finish")
    }

    func canvasViewDidBeginUsingTool(_ view: PKCanvasView) {
        print("begin")
    }

    func canvasViewDidEndUsingTool(_ view: PKCanvasView) {
        print("end")
    }
}
