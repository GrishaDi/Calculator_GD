//
//  OperationsHistoryViewController.swift
//  NewCalculator_GD
//
//  Created by Grisha Dil' on 12.06.2022.
//

import UIKit

class OperationsHistoryViewController: UIViewController, Coordinating {

    private let resultsTableView = UITableView()
    private let model = Model()
    private var results = [String]()
    
    var coordinator: Coordinator?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "History of results, from last to early:"
        view.backgroundColor = .systemOrange
        navigationController?.navigationBar.barTintColor = .black
        navigationController?.navigationBar.tintColor = .systemYellow
        navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor : UIColor.systemYellow]
        view.addSubview(resultsTableView)
        resultsTableView.backgroundColor = .systemOrange
        resultsTableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        resultsTableView.delegate = self
        resultsTableView.dataSource = self
        
        results = model.defaults.stringArray(forKey: "resultsKey") ?? []
        }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        resultsTableView.frame = view.bounds
    }
}


extension OperationsHistoryViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return results.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        if #available(iOS 14.0, *) {
            var content = cell.defaultContentConfiguration()
            var backround = cell.backgroundConfiguration
            content.text = results[indexPath.row]
            content.textProperties.alignment = .center
            content.textProperties.font = UIFont.systemFont(ofSize: 18)
            backround?.backgroundColor = .systemOrange
            cell.contentConfiguration = content
            cell.backgroundConfiguration = backround
        } else {
            cell.textLabel?.text = "\(results[indexPath.row])"
            cell.textLabel?.textAlignment = .center
            cell.textLabel?.font = UIFont.systemFont(ofSize: 18)
            cell.backgroundColor = .systemOrange
        }
        return cell
    }
}
