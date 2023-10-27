//
//  ChantsViewController.swift
//  Football Chants
//
//  Created by Jacob Perez on 10/13/23.
//

import UIKit

class ChantsViewController: UIViewController {
    
    // MARK: - UI
    private lazy var tableVw: UITableView = {
        let tv = UITableView()
        tv.translatesAutoresizingMaskIntoConstraints = false
        tv.backgroundColor = .clear
        tv.rowHeight = UITableView.automaticDimension
        tv.estimatedRowHeight = 44
        tv.separatorColor = .none
        tv.register(UITableViewCell.self, forCellReuseIdentifier: "Cell")
        tv.register(TeamTableViewCell.self, forCellReuseIdentifier: TeamTableViewCell.cellID)
        return tv
    }()
    
    // MARK: - Lifecycle
    // USING loadView IS MORE EFFICIENT TO CALL OR ANY UI STUFF IN THE LOADVIEW FUNCTION COMPARED TO VIEWDIDLOAD IN TERMS OF AUTOLAYERING AND ETC..
    override func loadView() {
        super.loadView()
        setup()
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        self.view.backgroundColor = .systemBlue
    }
}
// ADDS THE TABLEVIEW ONTO THE SCREEN
private extension ChantsViewController {
    
    func setup() {
        
        self.navigationController?.navigationBar.topItem?.title = "Football Chants"
        self.navigationController?.navigationBar.prefersLargeTitles = true
        
        
        tableVw.dataSource = selfz
        
        self.view.addSubview(tableVw)
        
        NSLayoutConstraint.activate([
            tableVw.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor),
            tableVw.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor),
            tableVw.leadingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leadingAnchor),
            tableVw.trailingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.trailingAnchor),
            
        ])
    }
}
// MARK: - UITableViewDataSource
extension ChantsViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // this V "tableVw" couldn't be called tableView because it took the one for the "tableView" label above.
        let cell = tableVw.dequeueReusableCell(withIdentifier: TeamTableViewCell.cellID, for: indexPath) as! TeamTableViewCell
        
        cell.configure()
//        switch indexPath.row {
//        case 0:
//            cell.backgroundColor = .systemTeal
//        case 1:
//            cell.backgroundColor = .systemGray
//        case 2:
//            cell.backgroundColor = .systemPink
//        default:
//            break
//        }
        return cell
    }
}
