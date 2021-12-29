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
//    var field: String
    
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
            parent.text = textReader(testString: text)
        }
        
        func deleteBackward() {
            // no function
        }
        
        func textReader(testString: String) -> String {
            
            var group1match = ""
            let stringRange = NSRange(location: 0, length: testString.utf16.count)
            
            let regex = try! NSRegularExpression(pattern: #"ary\n(\w* \w*)"#, options: .anchorsMatchLines)
            
            if let match = regex.firstMatch(in: testString, options: [], range: stringRange) {
                if let group1 = Range(match.range(at: 1), in: testString) {
                    group1match = testString[group1].description
                    print(group1match)
            }
            }
            
            return group1match
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
