//
//  NetworkManager.swift
//  SaltsideTest
//
//  Created by SALTSIDE on 11/09/18.
//  Copyright © 2018 SALTSIDE. All rights reserved.
//

import Foundation

class NetworkManager {
    typealias getCarsClosure = ([Car]?, Bool) -> ()
    
    func getCars(completion: @escaping getCarsClosure) {
        let session = URLSession.shared
        guard let url = URL(string: URLs().fetchData) else { return }
        session.dataTask(with: url) { data, response, error in
            if let error = error {
                print(error.localizedDescription)
                completion(nil, false)
            } else {
                let decoder = JSONDecoder()
                if let data = data {
                    do {
                        let cars = try decoder.decode([Car].self, from: data)
                        completion(cars, true)
                    } catch {
                        print("error in paring the data")
                        completion(nil, false)
                    }
                }
            }
            }.resume()
    }
}
