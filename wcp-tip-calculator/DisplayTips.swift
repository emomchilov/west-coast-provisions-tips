//
//  DisplayTips.swift
//
//  Manages the tip calculation and distribution to both server & support staff
//  Displays the final result
//
//  Created by Eden  Momchilov on 10/22/21.
//
import SwiftUI

class TipManager {
    
    // variables must be passed in from the ServerInfo View
    static var serverArray: [Server]?
    static var numSupport: Int?
    
    // function to calculate total tips
    static func totalTips(serverArray: [Server], numSupport: Int) -> (netSales: Float, tips: Float, supportTips: Float) {
        // stores the value for total net sales
        var totalNetSales: Float = 0
        // stores the value for overall tips - used for calculation
        var totalTips: Float = 0
        // stores the support staff tips
        var sTips: Float = 0
        // stores the value of tips per server - calculated by totalTips / total servers
        var perServer: Float = 0
        
        // loops through each server to grab end of night values
        for s in serverArray {
            totalTips = totalTips + s.serverTotal
            totalNetSales = totalNetSales + Float(s.netSales)
        }
        // calculates the total amount that goes to support staff
        sTips = (totalNetSales * (0.015 * Float(numSupport))) / Float(numSupport)
        // calculates the tips per server
        perServer = (totalTips - (sTips * Float(numSupport))) / Float(serverArray.count)
        return (totalNetSales, perServer, sTips)
    }
}

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
        DisplayTips(serv: Server.testServers, numSup: 3)
    }
}


