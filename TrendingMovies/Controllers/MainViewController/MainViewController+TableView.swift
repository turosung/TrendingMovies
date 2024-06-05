//
//  MainViewController+TableView.swift
//  TrendingMovies
//
//  Created by Nuhu Sulemana on 30/05/2024.
//

import Foundation
import UIKit

extension MainViewController: UITableViewDataSource, UITableViewDelegate {
    
    func setupTableView() {
        self.movieTableView.delegate = self
        self.movieTableView.dataSource = self
        self.movieTableView.backgroundColor = .cyan
        
        self.registerCells()
    }
    
    func reloadTableView() {
        DispatchQueue.main.async {
            self.movieTableView.reloadData()
        }
    }
    
    func registerCells() {

        self.movieTableView.register(MovieTableViewCell.register(), forCellReuseIdentifier: MovieTableViewCell.identifier)
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        viewModel.numberofSections()
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        200
    }
    
    func tableView(_  tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.viewModel.numberOfRows(in: section)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: MovieTableViewCell.identifier, for: indexPath) as? MovieTableViewCell else {
            return UITableViewCell()
        }
        cell.setupCell(viewModel: cellDataSource[indexPath.row])
        cell.selectionStyle = .none
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let movieId = cellDataSource[indexPath.row].id
        self.openDetail(movieId: movieId)
    }
    
    
}
