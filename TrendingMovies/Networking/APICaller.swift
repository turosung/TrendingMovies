//
//  APICaller.swift
//  TrendingMovies
//
//  Created by Nuhu Sulemana on 31/05/2024.
//

import Foundation

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
