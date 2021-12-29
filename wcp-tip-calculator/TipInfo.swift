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
                    Stepper("Servers", value: $numServers)
                        .frame(alignment: .center)
                        .padding(40)
                        .font(Font.custom("SMG-Regular", size: 20))
                    // creates icons for each server
                    HStack {
                        if (numServers == 0) {
                            Image(systemName: "person.fill")
                                .foregroundColor(Color.clear)
                                //.padding()
                        }
                        else {
                            ForEach(0..<numServers, id: \.self) { _ in
                                Image(systemName: "person.fill")
                                    .foregroundColor(Color("WCPBlue"))
                                    //.padding()
                            }
                        }
                    }
                    Text(Int(numServers).description)
                        .padding(30)
                        .font(Font.custom("SMG-Regular", size: 20))
                }
                .overlay(
                    RoundedRectangle(cornerRadius: 15)
                        .stroke(Color("WCPBlue"), lineWidth: 6 ))
                .background(Color.white)
                .cornerRadius(15)
                .padding(25)
                .shadow(color: Color.gray, radius: 10)
                
                // holds server stepper object
                VStack {
                    Stepper("Support", value: $numSupport)
                        .frame(alignment: .center)
                        .padding(40)
                        .font(Font.custom("SMG-Regular", size: 20))
                    // creates icons for each server
                    HStack {
                        if (numSupport == 0) {
                            Image(systemName: "person.fill")
                                .foregroundColor(Color.clear)
                                //.padding()
                        }
                        else {
                            ForEach(0..<numSupport, id: \.self) { _ in
                                Image(systemName: "person.fill")
                                    .foregroundColor(Color("WCPBlue"))
                                    //.padding()
                            }
                        }
                    }
                    Text(Int(numSupport).description)
                        .padding(30)
                        .font(Font.custom("SMG-Regular", size: 20))
                }
                        .overlay(
                            RoundedRectangle(cornerRadius: 15)
                                .stroke(Color("WCPBlue"), lineWidth: 6 ))
                        .background(Color.white)
                        .cornerRadius(15)
                        .padding(25)
                        .shadow(color: Color.gray, radius: 10)

                    NavigationLink(destination: ServerInfoView(numberOfServers: Int(numServers), numberOfSupport: Int(numSupport)),
                                   label: {
                        Text("Next")
                            .padding(20)
                            .foregroundColor(Color("WCPBlue"))
                            .background(Color.white)
                            .cornerRadius(25)
                            .shadow(color: Color.gray, radius: 10)
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
