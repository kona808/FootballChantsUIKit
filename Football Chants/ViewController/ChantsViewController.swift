//
//  ChantsViewController.swift
//  Football Chants
//
//  Created by Jacob Perez on 10/13/23.
//

import UIKit

class ChantsViewController: UIViewController {
    
    // MARK: - UI
    private lazy var tableView: UITableView = {
        let tv = UITableView()
        tv.translatesAutoresizingMaskIntoConstraints = false
        tv.backgroundColor = .clear
        tv.rowHeight = UITableView.automaticDimension
        tv.estimatedRowHeight = 44
        tv.separatorColor = .none
        tv.register(UITableView.self, forCellReuseIdentifier: "Cell")
        return tv
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        self.view.backgroundColor = .systemBlue
    }
}

private extension ChantsViewController {
    
    func setup() {
        self.view.addSubview(tableView)
        
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor),
            tableView.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor),
            tableView.trailingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.trailingAnchor),
            tableView.leadingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leadingAnchor)
        ])
    }
}
// MARK: - UITableViewDataSource
extension ChantsViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        switch indexPath.row {
        case 0:
            cell.backgroundColor = .systemTeal
        case 1:
            cell.backgroundColor = .systemGray
        case 2:
            cell.backgroundColor = .systemPink
        default:
            break
        }
        return cell
    }
    
    
    
}
