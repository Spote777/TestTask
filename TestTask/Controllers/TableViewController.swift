//
//  TableViewController.swift
//  TestTask
//
//  Created by Павел Заруцков on 16.10.2021.
//

import UIKit

class TableViewController: UITableViewController {
    
    var data: ResponseData?
    let network = Network()
    var token:String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        network.getDataInfo(token: token ?? "") { item in
            self.data = item
            self.tableView.reloadData()
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        addRightButton()
    }
    
    private func addRightButton() {
        let editButton   = UIBarButtonItem(title: "Log out",  style: .plain, target: self, action: #selector(didTapEditButton))
        
        navigationItem.rightBarButtonItem = editButton
    }
    
   @objc func didTapEditButton(sender: AnyObject) {
        self.token = ""
        dismiss(animated: true)
    }

    
    // MARK: - Table view data source
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return data?.response.count ?? 0
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! TableViewCell
        
        if let data = data {
            cell.config(model: data.response[indexPath.row])
        }
        return cell
    }
}
