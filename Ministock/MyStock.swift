//
//  MyStockModel.swift
//  Ministock
//
//  Created by dochanghwan on 2022/02/24.
//

import Foundation


struct MyStock: Decodable {
    let stockName: String
    let currentPrice: Int
    let stockQuantity: Float
    let valueChange: Int
    let percentChange: Float
    let imageURL: String
    
}
