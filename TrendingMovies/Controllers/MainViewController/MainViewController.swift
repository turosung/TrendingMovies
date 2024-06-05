//
//  MainViewController.swift
//  TrendingMovies
//
//  Created by Nuhu Sulemana on 30/05/2024.
//

import UIKit

class MainViewController: UIViewController {
    
    @IBOutlet weak var movieTableView: UITableView!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    
    var viewModel: MainViewModel = MainViewModel()
    
    var cellDataSource: [MovieTableCellViewModel] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configView()
        spinnerIndicator()

    }
    
    func configView() {
        self.title = "Top Trending movies"
        self.view.backgroundColor = .cyan
        
        setupTableView()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        viewModel.getData()
    }
    
    func spinnerIndicator() {
        
        viewModel.isLoadingData.bind { [weak self] isLoading in
            guard let isLoading = isLoading else {
                return
            }
            DispatchQueue.main.async {
                if isLoading {
                    self?.activityIndicator.startAnimating()
                } else {
                    self?.activityIndicator.stopAnimating()
                }
            }
        }
        
        viewModel.movies.bind { [weak self] movies in
            guard let self = self,
                  let movies = movies else {
                      return
                  }
            self.cellDataSource = movies
            DispatchQueue.main.async {
                self.movieTableView.reloadData()
            }
        }

    }
    
    
    func openDetail(movieId: Int) {
        guard let movie = viewModel.retrieveMovie(with: movieId) else {
            return
        }
        let detailsViewModel = DetailsMovieViewModel(movie: movie)
        let detailsController = DetailsMovieViewController(viewModel: detailsViewModel)
        DispatchQueue.main.async {
            self.navigationController?.pushViewController(detailsController, animated: true)
        }
    }
}

