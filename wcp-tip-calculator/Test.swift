//
//  Test.swift
//  wcp-tip-calculator
//
//  Created by Eden  Momchilov on 12/10/21.
//

import SwiftUI

@available(iOS 15.0, *)
struct ScanButton: UIViewRepresentable {
    
    @Binding var text: String
    
    func makeUIView(context: Context) ->
    UIButton {
        let textFromCamera = UIAction.captureTextFromCamera(responder: context.coordinator, identifier: nil)
        let button = UIButton(primaryAction: textFromCamera)
        return button
    }
    
    func updateUIView(_ uiView: UIButton, context: Context) {
        // no function
    }
    
    func makeCoordinator() ->
    Coordinator {
        Coordinator(self)
    }
    
    class Coordinator: UIResponder, UIKeyInput {
        let parent: ScanButton
        init(_ parent: ScanButton) {
            self.parent = parent
        }
        
        var hasText = false
        func insertText(_ text: String) {
            parent.text = text
        }
        func deleteBackward() {
            // no function
        }
    }
}

@available(iOS 15.0, *)
struct Test_Previews: PreviewProvider {
    static var previews: some View {
        ScanButton(text: .constant(""))
            .previewLayout(.sizeThatFits)
    }
}
