//
//  JsonOpen.swift
//  Ministock
//
//  Created by dochanghwan on 2022/02/24.
//

import Foundation

let url: String = "https://boiling-scrubland-57180.herokuapp.com/my-stock"

struct NetworkManager{
    func requestMyStock(completionHandler: @escaping (([MyStockModel]) -> Void)) {
        URLSession.shared.dataTask(with: URL(string: url)!) { (data, response, error) in
            
            let decoder = JSONDecoder()
            
            if let data = data
            {
                do {
                    let stocks = try decoder.decode([MyStockModel].self, from: data)
                    
                    completionHandler(stocks)
                } catch {
                    print(error.localizedDescription)
                }
                
                
            }
        }.resume()
    }
}

