//
//  TipInfo.swift
//  wcp-tip-calculator
//
//  Created by Eden  Momchilov on 10/22/21.
//

import SwiftUI

struct TipInfoView: View {
    
    //want to figure out how to take these numbers and pass them into server info
    @State var numServers: Float = 0
    @State var numSupport: Float = 0
    
    var body: some View {
        VStack {
            VStack {
                Stepper("Number of Servers", value: $numServers)
                    .frame(alignment: .center)
                    .padding(30)
                    .font(.headline)
                    .background(Color.white)
                Text(Int(numServers).description)
                    .padding()
            }
            .cornerRadius(25)
            .padding(25)
            VStack {
                Stepper("Number of Support", value: $numSupport)
                    .frame(alignment: .center)
                    .padding(30)
                    .font(.headline)
                Text(Int(numSupport).description)
                    .padding()
            }
            .cornerRadius(25)
            .padding(25)
            NavigationLink(destination: ServerInfoView(numberOfServers: Int(numServers), numberOfSupport: Int(numSupport)),
                           label: {
                Text("Next")
            })
        }
    }
    

    struct TipInfoView_Previews: PreviewProvider {
        static var previews: some View {
            TipInfoView()
        }
    }
}
