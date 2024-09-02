//
//  ViewData.swift
//  converter
//
//  Created by User on 28.08.2024.
//

import Foundation

struct Currency {
    let code: String
    let name: String
}
struct ExchangeRate {
    let from: Currency
    let to: Currency
    let rate: Double
}
