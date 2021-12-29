//
//  ContentView.swift
//  wcp-tip-calculator
//
//  Created by Eden  Momchilov on 10/22/21.
//

import SwiftUI

@available(iOS 15.0, *)
struct ContentView: View {
    
    
    var body: some View {
        NavigationView {
            ZStack(alignment: .top) {
                Image("wcp-bar")
                    .resizable()
                    .offset(x: -200)
                    .aspectRatio(contentMode: .fill)
                    .ignoresSafeArea()
                    .blur(radius: 1.8)
                    .opacity(0.8)
                
                VStack(alignment: .center) {
                    Image("wcp-logo")
                        .resizable()
                        .frame(width: 350, height: 400, alignment: .top)
                        .aspectRatio(contentMode: .fill)
                        .padding()
                        .shadow(color: Color.black, radius: 25)
                    NavigationLink(destination: TipInfoView(), label:
                                    { Text("START")
                            .font(Font.custom("SMG-Regular", size: 15))
                            .bold()
                    })
                        .padding(20)
                        .background(Color("WCPLightBlue"))
                        .foregroundColor(Color("WCPBlue"))
                        .frame(alignment: .bottom)
                        .cornerRadius(25)
                        .shadow(color: Color.black, radius: 15)
                }
            }
        }
    }
    
    
    struct ContentView_Previews: PreviewProvider {
        static var previews: some View {
            ContentView()
        }
    }
}
