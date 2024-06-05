//
//  MainViewModel.swift
//  TrendingMovies
//
//  Created by Nuhu Sulemana on 30/05/2024.
//

import Foundation

class MainViewModel {
    
    var isLoadingData: Observable<Bool> = Observable(false)
    var dataSource: TrendingMoviesModel?
    var movies: Observable<[MovieTableCellViewModel]> = Observable(nil)
    
    
    func numberofSections() -> Int {
        return 1
    }
    
    func numberOfRows(in section: Int) -> Int {
        return self.dataSource?.results.count ?? 0
    }
    
    func getData() {
        if isLoadingData.value ?? true {
            return
        }
        isLoadingData.value = true

        Task {
            do {
                let trendingMovieData = try await APICaller.getTrendingMovies()
                self.isLoadingData.value = false
                self.dataSource = trendingMovieData
                self.mapMovieCellData()
            } catch {
                print(error)
            }
        }
    }
    
    func mapMovieCellData() {
        movies.value = self.dataSource?.results.compactMap({MovieTableCellViewModel(movie: $0)})
    }
    
    func retrieveMovie( with id: Int) -> Movie? {
        guard let movie = dataSource?.results.first(where: { $0.id == id }) else {
            return nil
        }
        return movie
    }
}

