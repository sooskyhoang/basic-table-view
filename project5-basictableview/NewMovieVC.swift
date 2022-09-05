//
//  NewMovieVC.swift
//  project5-basictableview
//
//  Created by nguyen van hoang on 27/07/2022.
//

import UIKit

class NewMovieVC: UIViewController {

    @IBOutlet weak var textField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        setupNavigation()
        
        // keyboard show after loading view
        textField.becomeFirstResponder()
    }
    
    func setupNavigation() {
        navigationItem.title = "New Movie"
        
        let rightButton = UIBarButtonItem(title: "Done", style: .plain, target: self, action: #selector(saveMovie))
        navigationItem.rightBarButtonItem = rightButton
    }

}

extension NewMovieVC {
    @objc func saveMovie() {
        if let count = navigationController?.viewControllers.count, count >= 2 {
            if let vc = navigationController?.viewControllers[0] as? ViewController {
                if let text = textField.text {
                    if text != "" {
                        vc.myArray.append(text)
                        vc.updateTable()
                    }
                }
            }
        }
        
        self.navigationController?.popViewController(animated: true)
    }
}
