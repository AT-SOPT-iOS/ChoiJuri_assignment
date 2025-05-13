//
//  MovieChartViewController.swift
//  TVING
//
//  Created by 최주리 on 5/13/25.
//

import UIKit

import SnapKit
import Then

final class MovieChartViewController: UIViewController {
    
    private let fetchService = FetchMovieService()
    
    private let rootView = MovieChartView()
    
    private var movieList: [Movie] = []
    
    //MARK: - LifeCycle
    override func loadView() {
        view = rootView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setDelegate()
        setRegister()
        
        fetchMovies()
    }
    
}

//MARK: - Functions
extension MovieChartViewController {
    private func setDelegate() {
        rootView.movieTableView.delegate = self
        rootView.movieTableView.dataSource = self
    }
    
    private func setRegister() {
        rootView.movieTableView.register(
            MovieChartTableViewCell.self,
            forCellReuseIdentifier: MovieChartTableViewCell.reuseIdentifier
        )
    }
}

//MARK: - UITableView
extension MovieChartViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        print("count: \(movieList.count)")
        return movieList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(
            withIdentifier: MovieChartTableViewCell.reuseIdentifier,
            for: indexPath
        ) as? MovieChartTableViewCell else { return UITableViewCell() }
        cell.dataBind(movieList[indexPath.row])
        
        return cell
    }
}

extension MovieChartViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 120
    }
}

//MARK: - Network
extension MovieChartViewController {
    private func fetchMovies() {
        Task {
            do {
                let result = try await fetchService.fetchMovie(date: "20250505")
                self.movieList = result.toEntity()
                
                rootView.movieTableView.reloadData()
            } catch {
                print(error.localizedDescription)
            }
        }
    }
}
