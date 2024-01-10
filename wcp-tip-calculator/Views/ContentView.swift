//
//  ContentView.swift
//  wcp-tip-calculator
//
//  Created by Eden  Momchilov on 10/22/21.
//

import SwiftUI

@available(iOS 15.0, *)

struct ContentView: View {
    //creates the home page view for the app
    var body: some View {
        NavigationView {
            VStack(alignment: .center) {
                // logo image & formatting
                Image("wcp-logo")
                    .resizable()
                    .frame(width: 350, height: 400, alignment: .top)
                    .aspectRatio(contentMode: .fill)
                    .padding()
                    .shadow(color: Color.black, radius: 25)
                // START button to navigate to the next page
                NavigationLink(destination: TipInfoView(), label: {
                    Text("START")
                        .font(Font.custom("SMG-Regular", size: 15))
                        .foregroundColor(.wcpBlue)
                })
                .padding(20)
                .background(Color.wcpLightBlue)
                .frame(alignment: .bottom)
                .cornerRadius(25)
                .shadow(color: Color.black, radius: 15)
                Spacer()
            }
            .background(
                Image("wcp-bar")
                    .resizable()
                    .scaledToFill()
                    .ignoresSafeArea()
                    .blur(radius: 1.8)
                    .opacity(0.8)
            )
        }
    }
}

// creates the preview provider
@available(iOS 15.0, *)
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
