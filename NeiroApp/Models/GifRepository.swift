//
//  GifRepository.swift
//  NeiroApp
//
//  Created by Максим Ломакин on 19.02.2023.
//

import Foundation

// MARK: - GifRepository for get data from URL
class GifRepository {
    func getData(completion: @escaping (GiphyResponse) -> Void) {
        guard let url = URL(string: "https://api.giphy.com/v1/gifs/trending?api_key=\(Constants().API_KEY)&limit=50&rating=g") else {
            print("Wrong URL")
            return
        }
        let task = URLSession.shared.dataTask(with: url) { data, _, error in
            guard let data = data, error == nil else {
                print("DataTask have error:")
                print(error as Any)
                return
            }
            do {
                let response = try JSONDecoder().decode(GiphyResponse.self, from: data)
                completion(response)
            } catch  {
                print("Decoder have error:")
                print(error)
            }
        }
        task.resume()
    }
}
