//
//  Float+.swift
//  wcp-tip-calculator
//
//  Created by Eden Momchilov on 1/7/24.
//

import Foundation

extension Float {
    // formats the currency to $XX.XX
    func asCurrency() -> String {
        return String(format: "$%.02f", self)
    }
}
