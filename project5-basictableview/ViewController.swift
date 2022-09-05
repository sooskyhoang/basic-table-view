//
//  ViewController.swift
//  project5-basictableview
//
//  Created by nguyen van hoang on 26/07/2022.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    var myArray = [
        "spiderman",
        "superman",
        "batman",
        "aquaman"
    ]
    
    let refreshControl = UIRefreshControl()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        setupNavigation()
        
        setupTableView()
    }
    
    func setupNavigation() {
        navigationItem.title = "Movies"
        
        let leftButton = UIBarButtonItem(title: "Edit", style: .done, target: self, action: #selector(editAction))
        navigationItem.leftBarButtonItem = leftButton
        
        let rightButton = UIBarButtonItem(image: UIImage(systemName: "plus"), style: .plain, target: self, action: #selector(addAction))
        navigationItem.rightBarButtonItem = rightButton
    }
    
    func setupTableView() {
        
        
        tableView.delegate = self
        tableView.dataSource = self
        
//        refreshControl.attributedTitle = NSAttributedString(string: "Pull to refresh")
        refreshControl.addTarget(self, action: #selector(self.refresh(_:)), for: .valueChanged)
        tableView.addSubview(refreshControl) // not required when using UITableViewController
    }

}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return myArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "abc", for: indexPath) as! TableCell
        cell.label.text = myArray[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    func tableView(_ tableView: UITableView, moveRowAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
        // Đổi vị trí của 2 phần tử trong mang myArray
        myArray.insert(myArray.remove(at: sourceIndexPath.row), at: destinationIndexPath.row)
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            myArray.remove(at: indexPath.row)
            tableView.reloadData()
        }
    }
}

extension ViewController {
    @objc func editAction(_ sender: UIBarButtonItem) {
        if tableView.isEditing {
            sender.title = "Edit"
            // Tắt editing mode
            tableView.setEditing(false, animated: true)
        } else {
            sender.title = "Done"
            // Bật editing mode
            tableView.setEditing(true, animated: true)
        }
    }
    
    @objc func addAction() {
        self.navigationController?.pushViewController(NewMovieVC(), animated: true)
    }
    
    func updateTable() {
        tableView.reloadData()
    }
    
    @objc func refresh(_ sender: AnyObject) {
        // Code to refresh table view
        self.myArray.append("new text")
        self.tableView.reloadData()
        refreshControl.endRefreshing()
    }
}

