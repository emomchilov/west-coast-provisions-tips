//
//  TipInfo.swift
//  wcp-tip-calculator
//
//  Created by Eden  Momchilov on 10/22/21.
//

import SwiftUI

@available(iOS 15.0, *)
struct TipInfoView: View {
    
    //want to figure out how to take these numbers and pass them into server info
    @State var numServers: Int = 0
    @State var numSupport: Int = 0
    
    var body: some View {
        ZStack {
            // sets the background for the screen
            Color("WCPLightBlue")
                .ignoresSafeArea()
            // holds both stepper objects
            VStack {
                // holds server stepper object
                VStack {
                    Stepper("Number of Servers", value: $numServers)
                        .frame(alignment: .center)
                        .padding(40)
                        .font(.headline)
                    // creates icons for each server
                    HStack {
                        ForEach(0..<numServers, id: \.self) { _ in
                            Image(systemName: "person.fill")
                                .foregroundColor(Color("WCPBlue"))
                                .padding()
                        }
                    }
                    Text(Int(numServers).description)
                        .padding(20)
                }
                .overlay(
                    RoundedRectangle(cornerRadius: 20)
                        .stroke(Color("WCPBlue"), lineWidth: 6 ))
                .background(Color.white)
                .cornerRadius(20)
                .padding(25)
                
                // holds server stepper object
                VStack {
                    Stepper("Number of Support", value: $numSupport)
                        .frame(alignment: .center)
                        .padding(40)
                        .font(.headline)
                    // creates icons for each server
                    HStack {
                        ForEach(0..<numSupport, id: \.self) { _ in
                            Image(systemName: "person.fill")
                                .foregroundColor(Color("WCPBlue"))
                                .padding()
                        }
                    }
                    Text(Int(numSupport).description)
                        .padding(20)
                }
                        .overlay(
                            RoundedRectangle(cornerRadius: 20)
                                .stroke(Color("WCPBlue"), lineWidth: 6 ))
                        .background(Color.white)
                        .cornerRadius(20)
                        .padding(25)
                    NavigationLink(destination: ServerInfoView(numberOfServers: Int(numServers), numberOfSupport: Int(numSupport)),
                                   label: {
                        Text("Next")
                            .padding(20)
                            .background(Color.white)
                            .cornerRadius(20)
                    })
                }
            }
        }
    
    struct TipInfoView_Previews: PreviewProvider {
        static var previews: some View {
            TipInfoView()
        }
    }
}
