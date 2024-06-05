//
//  NetworkConstant.swift
//  TrendingMovies
//
//  Created by Nuhu Sulemana on 31/05/2024.
//

import Foundation

// We will create a Singleton class here which will be used as a shared for network calls
class NetworkConstant {
    public static var shared: NetworkConstant = NetworkConstant()
    
    public var apiKey: String {
        get {
            // Get API Key from https://www.themoviedb.org/
            return ""
        }
    }
    
    public var serverAddress: String {
        get {
            return "https://api.themoviedb.org/3/"
        }
    }
    
    public var imageServerAddress: String {
        get {
            return "https://image.tmdb.org/t/p/w500/"
        }
    }
}
