//
//  ScanButton.swift
//  wcp-tip-calculator
//
//  Created by Eden  Momchilov on 12/10/21.
//

import SwiftUI

@available(iOS 15.0, *)


struct ScanButton: UIViewRepresentable {
    @Binding var text: String
    var patternID: String
    
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
            parent.text = textReader(input: text)
        }
        
        func deleteBackward() {
            // no function
        }
        
        func textReader(input: String) -> String {
            var pattern = ""
            if (parent.patternID == "Name") {
                pattern = #"ary\n(\w* \w*)"#
            }
            else if (parent.patternID == "Net Sales") {
                pattern = #"Total Net Sales\n\$(\d+.\d+)"#
            }
            else if (parent.patternID == "House Owes Server") {
                pattern = #"Tips & Fees\n\$(\d+.\d+)"#
            }
            else if (parent.patternID == "Server Owes House") {
                pattern = #"Cash Bank\n\$(\d+.\d+)"#
            }
            
            var convertedText = ""
            let stringRange = NSRange(location: 0, length: input.utf16.count)
            
            let regex = try! NSRegularExpression(pattern: pattern, options: .anchorsMatchLines)
            
            if let match = regex.firstMatch(in: input, options: [], range: stringRange) {
                if let group1 = Range(match.range(at: 1), in: input) {
                    convertedText = input[group1].description
                }
            }
            
            return convertedText
        }
    }
}

@available(iOS 15.0, *)
struct Test_Previews: PreviewProvider {
    static var previews: some View {
        ScanButton(text: .constant(""), patternID: "")
            .previewLayout(.sizeThatFits)
    }
}
