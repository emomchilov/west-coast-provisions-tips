//
//  DisplayTips.swift
//
//  Manages the tip calculation and distribution to both server & support staff
//  Displays the final result
//
//  Created by Eden  Momchilov on 10/22/21.
//
import SwiftUI



// displays the final output
struct DisplayTips: View {
    
    let serv: [Server]
    let numSup: Int
    
    // displays the final server & support staff tip amount
    var body: some View {
        let dataCollecter = TipManager.totalTips(serverArray: serv, numSupport: numSup)
        VStack {
            Text("Each server walks with:")
                .bold()
                .padding()
                .font(Font.custom("SMG-Regular", size: 20))
            Text(dataCollecter.tips.asCurrency())
                .font(Font.custom("SMG-Regular", size: 40))
                .foregroundColor(Color("WCPBlue"))
            Text("Each support walks with:")
                .bold()
                .padding()
                .font(Font.custom("SMG-Regular", size: 20))
            Text(dataCollecter.supportTips.asCurrency())
                .font(Font.custom("SMG-Regular", size: 40))
                .foregroundColor(Color("WCPBlue"))
        }
    }
}

// creates the preview provider
struct DisplayTips_Previews: PreviewProvider {
    static var previews: some View {
        // for preview purposes
        let testServers = [Server(name: "Eden", netSales: 250, houseOwesServer: 3, serverOwesHouse: 4, cashCollected: 5, serverTotal: 5), Server(name: "Weston", netSales: 3, houseOwesServer: 4, serverOwesHouse: 5, cashCollected: 6, serverTotal: 7)]
        
        DisplayTips(serv: testServers, numSup: 3)
    }
}


