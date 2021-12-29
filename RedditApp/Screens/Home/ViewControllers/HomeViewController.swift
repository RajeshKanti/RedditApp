//
//  ViewController.swift
//  RedditApp
//
//  Created by Rajesh Ghosh on 2021-12-25.
//

import UIKit

class HomeViewController: UIViewController {

    @IBOutlet weak var homeTableView: UITableView!
    
    private var homeViewModel: HomeViewModel?

    override func viewDidLoad() {
        super.viewDidLoad()

        setupInitialViews()
        setupClosures()
    }
    
    private func setupInitialViews() {
        homeTableView.isHidden = true
        homeTableView.register(UINib(nibName: "HomeTableViewCell", bundle: nil), forCellReuseIdentifier: "HomeTableViewCell")
    }
    
    private func setupClosures() {
        
        homeViewModel = HomeViewModel()
        
        homeViewModel?.refreshData = { [weak self] in
            DispatchQueue.main.async {
                self?.homeTableView.reloadData()
                self?.homeTableView.isHidden = false
            }
        }
        
        homeViewModel?.showError = { [weak self] (error) in
            DispatchQueue.main.async {
                AlertUtility.showAlert(self!, title: "Error", message: error, buttonTitles: ["OK"], completionHandler: nil)
            }
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "navigateDetailsPage",
           let detailsVC = segue.destination as? DetailsViewController {
            
        }
    }
}

extension HomeViewController: UITableViewDelegate, UITableViewDataSource {
        
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return homeViewModel?.redditResponse?.data.children.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "HomeTableViewCell") as? HomeTableViewCell else {
            return UITableViewCell()
        }
        
        if let redditResponse = homeViewModel?.redditResponse {
            cell.setupData(cellVM: redditResponse.data.children[indexPath.row].data)
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "navigateDetailsPage", sender: nil)
    }
}
