//
//  NetworkManager.swift
//  H4XOR News
//
//  Created by Abdeljaouad Mezrari on 12/03/2023.
//  Copyright © 2023 Abdeljaouad Mezrari. All rights reserved.
//

import Foundation

class NetworkManager: ObservableObject{
    
    @Published var posts = [Post]()
    func fetchData(){
        let url = URL(string: "https://hn.algolia.com/api/v1/search?tags=front_page")
        let session = URLSession(configuration: .default)
        let task = session.dataTask(with: url!) { data, response, error in
            if error != nil {
               print("Error fetching data")
            }
            
            if let safeData = data{
                if let result = self.PostsDecoder(safeData){
                    DispatchQueue.main.async {
                        self.posts = result.hits
                    }
                }
            }
        }
        task.resume()

    }
    
    
    func PostsDecoder(_ data: Data) -> Result?{
        let decoder = JSONDecoder()
        do{
            let decodedResult = try decoder.decode(Result.self, from: data)
            return decodedResult
        } catch {
            print(error)
        }
        return nil
    }
}
