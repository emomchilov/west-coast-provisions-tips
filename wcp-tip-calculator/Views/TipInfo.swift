//
//  TipInfo.swift
//  wcp-tip-calculator
//
//  Created by Eden  Momchilov on 10/22/21.
//

import SwiftUI

@available(iOS 15.0, *)
struct TipInfoView: View {
    
    // stores the total number of servers & support staff
    @State var numServers: Int = 0
    @State var numSupport: Int = 0
    
    var body: some View {
        VStack {
            VStack {
                VStack {
                    Stepper("Servers", value: $numServers)
                        .frame(alignment: .center)
                        .padding(40)
                        .font(Font.custom("SMG-Regular", size: 20))
                    HStack {
                        if (numServers == 0) {
                            Image(systemName: "person.fill")
                                .foregroundColor(Color.clear)
                        }
                        else {
                            ForEach(0..<numServers, id: \.self) { _ in
                                Image(systemName: "person.fill")
                                    .foregroundColor(Color("WCPBlue"))
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
                
                VStack {
                    Stepper("Support", value: $numSupport)
                        .frame(alignment: .center)
                        .padding(40)
                        .font(Font.custom("SMG-Regular", size: 20))
                    HStack {
                        if (numSupport == 0) {
                            Image(systemName: "person.fill")
                                .foregroundColor(Color.clear)
                        }
                        else {
                            ForEach(0..<numSupport, id: \.self) { _ in
                                Image(systemName: "person.fill")
                                    .foregroundColor(Color("WCPBlue"))
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
                
                NavigationLink(destination: ServerInfoView(numberOfServers: Int(numServers), numberOfSupport: Int(numSupport), tipManager: TipManager(servers: [], numSupport: numSupport)), label: {
                    Text("Next")
                        .padding(20)
                        .foregroundColor(Color("WCPBlue"))
                        .background(Color.white)
                        .cornerRadius(25)
                        .shadow(color: Color.gray, radius: 10)
                })
            }
        }
        .frame(maxHeight: .infinity)
        .background(Color.wcpLightBlue)
        .ignoresSafeArea()
    }
}

@available(iOS 15.0, *)
struct TipInfoView_Previews: PreviewProvider {
    static var previews: some View {
        TipInfoView()
    }
}
