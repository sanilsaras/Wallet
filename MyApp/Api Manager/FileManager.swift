//
//  FileManager.swift
//  MyApp
//
//  Created by Sanil on 17/06/23.
//

import Foundation

class ApiManager {
    static let shared = ApiManager()
    func walletList(completion: @escaping(Result<WalletModel, Error>)-> ()) {
        guard let url =  URL(string: "https://api.beeone.co.uk/mock-tests/wallets")
        else {
            return     }
        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = "GET"
        let task = URLSession.shared.dataTask(with: urlRequest){ data, response, error in
            if let response = response as? HTTPURLResponse, !(200...299).contains(response.statusCode){
                print(response.statusCode)
            }
            if let error = error {
                print(error.localizedDescription)
                completion(.failure(error))
            }
            guard let data = data else {
                return
            }
            do {
                let reuslt =   try JSONDecoder().decode(WalletModel.self, from: data)
                completion(.success(reuslt))
                print(reuslt)
            } catch let error {
                print(error.localizedDescription)
            }
        }
        task.resume()
    }
}
