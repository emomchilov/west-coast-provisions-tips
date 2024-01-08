//
//  ServerModel.swift
//  wcp-tip-calculator
//
//  Created by Eden Momchilov on 1/7/24.
//

import Foundation

// Model class to store the server array
class TipManager {
    var serverArray: [Server]?
    var numSupport: Int?
    
    // function to calculate total tips
    func totalTips(serverArray: [Server], numSupport: Int) -> (netSales: Float, tips: Float, supportTips: Float) {
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
