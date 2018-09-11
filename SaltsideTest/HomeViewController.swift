//
//  HomeViewController.swift
//  SaltsideTest
//
//  Created by SALTSIDE on 26/07/18.
//  Copyright © 2018 SALTSIDE. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {

    // MARK: - IBOutlets
    @IBOutlet var tableView: UITableView!
    
    // MARK: - Constants and Variables
    let manager = NetworkManager()
    let reuseIdentifier = "cellId"
    var cars = [Car]()
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupTableView()
        fetchCars()
    }
    
    // MARK: - Private Methods
    private func setupTableView() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: reuseIdentifier)
        tableView.tableFooterView = UIView()
        
    }
    
    private func fetchCars() {
        manager.getCars() { [unowned self] cars, success in
            if success {
                if let cars = cars {
               //     print("we have got all the cars: \(cars)")
                    DispatchQueue.main.async {
                        self.cars = cars
                        self.tableView.reloadData()
                    }
                }
            } else {
                print("error in receiving data from server")
            }
            
        }
    }
}

// MARK: - UITableViewDataSource
extension HomeViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cars.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCell(withIdentifier: reuseIdentifier)
        cell = UITableViewCell(style: .subtitle, reuseIdentifier: reuseIdentifier)
        let car = cars[indexPath.row]
        cell?.detailTextLabel?.numberOfLines = 0
        cell?.textLabel?.text = car.title
        cell?.detailTextLabel?.text = car.description
        return cell!
    }
}

// MARK: - UITableViewDelegate
extension HomeViewController: UITableViewDelegate {
    
}

