//
//  APICaller.swift
//  TrendingMovies
//
//  Created by Nuhu Sulemana on 31/05/2024.
//

import Foundation

// Always remember to use enums to handle any network errors

enum NetworkError: Error {
    case urlError
    case canNotParseData
}

public class APICaller {
    
    static func getTrendingMovies() async throws -> TrendingMoviesModel {
        
        if NetworkConstant.shared.apiKey.isEmpty {
            print("API key missing. Get API key from https://www.themoviedb.org/")
        }
        
        let urlString = NetworkConstant.shared.serverAddress + "trending/all/day?api_key=" + NetworkConstant.shared.apiKey
        
        guard let url = URL(string: urlString) else {
            throw NetworkError.urlError
        }
        
        let (data, _) = try await URLSession.shared.data(from: url)
        
        do {
            let resultData = try JSONDecoder().decode(TrendingMoviesModel.self, from: data)
            return resultData
        } catch {
            throw NetworkError.canNotParseData
        }
    }
}








//MARK: - ASYNC CLASS FOR NETWORK CALL TO FETCH DATA FROM MOVIEDB WEBSITE. WILL USE IT LATER
//public class APICaller {
//
//static func getTrendingMovies(completionHandler: @escaping (_ result: Result<TrendingMoviesModel, NetworkError>) -> Void ) {
//
//    let urlString = NetworkConstant.shared.serverAddress + "trending/all/day?api_key=" + NetworkConstant.shared.apiKey
//
//    guard let url = URL(string: urlString) else {
//        completionHandler(.failure(.urlError))
//        return
//    }
//
//    URLSession.shared.dataTask(with: url) { dataResponse, urlResponse, error in
//
//        if error == nil,
//           let data = dataResponse,
//           let resultData = try? JSONDecoder().decode(TrendingMoviesModel.self, from: data) {
//            completionHandler(.success(resultData))
//
//        } else {
//            completionHandler(.failure(.canNotParseData))
//        }
//    }.resume()
//}

//}




