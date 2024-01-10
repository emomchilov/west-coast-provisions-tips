//
//  wcp_tip_calculatorApp.swift
//  wcp-tip-calculator
//
//  Created by Eden  Momchilov on 10/22/21.
//

import SwiftUI

// checks if the device has iOS 15
@available(iOS 15.0, *)
@main
// launches to the home screen
struct wcp_tip_calculatorApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}

// creates the preview provider
struct wcp_tip_calculatorApp_Previews: PreviewProvider {
    static var previews: some View {
        /*@START_MENU_TOKEN@*/Text("Hello, World!")/*@END_MENU_TOKEN@*/
    }
}
