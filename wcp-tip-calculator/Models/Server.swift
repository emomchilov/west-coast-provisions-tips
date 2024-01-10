//
//  Server.swift
//  wcp-tip-calculator
//
//  Created by Eden Momchilov on 1/7/24.
//

import Foundation
import SwiftUI

// creates a Server object
struct Server: Hashable {
    let name: String
    let netSales: Float
    var houseOwesServer: Float
    var serverOwesHouse: Float
    var cashCollected: Float
    var serverTotal: Float
    
}
