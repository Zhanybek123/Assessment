//
//  ViewController.swift
//  AssessmentTask
//
//  Created by zhanybek salgarin on 7/26/23.
//

import UIKit

class ViewController: UIViewController {
    
    var viewModel: CountryViewModelProtocol
    
    var tableView: UITableView = {
        let table = UITableView()
        table.backgroundColor = .systemCyan
        table.register(CountryTableViewCell.self, forCellReuseIdentifier: CountryTableViewCell.id)
        table.translatesAutoresizingMaskIntoConstraints = false
        return table
    }()
    
    init(viewModel: CountryViewModelProtocol) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .darkGray
        tableView.frame = view.bounds
        title = "COUNTRIES 🏳️‍🌈"
        
        tableView.delegate = self
        tableView.dataSource = self
        
        view.addSubview(tableView)
        
        viewModel.didDataLoad = { [weak self] in
            self?.tableView.reloadData()
        }
        viewModel.didErrorOccur = { [weak self] error in
//            TODO: Handle Error
        }
        
        viewModel.fetchData()
    }
    
    // A little bit of glitter :)
    func animateCell(duration: Double, indexPath: IndexPath, cell: UITableViewCell) {
        cell.alpha = 0
        
        UIView.animate(
            withDuration: 0.9,
            delay: 0.05 * Double(indexPath.row),
            animations: {
                cell.alpha = 1
            })
    }
}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        viewModel.countries.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: CountryTableViewCell.id, for: indexPath) as? CountryTableViewCell
        let countryRow = viewModel.countries[indexPath.row]
        cell?.configureProperties(with: countryRow)
        return cell ?? UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        100
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        animateCell(duration: 0, indexPath: indexPath, cell: cell)
    }
}

