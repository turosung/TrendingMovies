//
//  TrendingMoviesModel.swift
//  TrendingMovies
//
//  Created by Nuhu Sulemana on 31/05/2024.
//

import Foundation

// MARK: - TrendingMoviesModel
struct TrendingMoviesModel: Codable {
    let page: Int
    let results: [Movie]
    let totalPages, totalResults: Int

    enum CodingKeys: String, CodingKey {
        case page, results
        case totalPages = "total_pages"
        case totalResults = "total_results"
    }
}

// MARK: - Movie
struct Movie: Codable {
    let backdropPath: String?
    let id: Int
    let originalTitle: String?
    let overview, posterPath: String
    let title: String?
    let popularity: Double?
    let releaseDate: String?
    let voteAverage: Double
    let voteCount: Int
    let name: String?
    let originalName, firstAirDate: String?

    enum CodingKeys: String, CodingKey {
        case backdropPath = "backdrop_path"
        case id
        case originalTitle = "original_title"
        case overview
        case posterPath = "poster_path"
        case title
        case popularity
        case releaseDate = "release_date"
        case voteAverage = "vote_average"
        case voteCount = "vote_count"
        case originalName = "original_name"
        case name
        case firstAirDate = "first_air_date"
    }
}

