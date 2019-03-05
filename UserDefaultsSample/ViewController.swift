//
//  ViewController.swift
//  UserDefaultsSample
//
//  Created by Fleischauer, Joseph on 3/5/19.
//  Copyright © 2019 Fleischauer, Joseph. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var rosterLabel: UILabel!
    @IBOutlet weak var chosenNameLabel: UILabel!
    
    let defaults = UserDefaults.standard
    var nameArray: [String] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadNames()
    }

    @IBAction func onAddButtonTapped(_ sender: Any) {
        if let name = nameTextField.text {
            nameArray.append(name)
            defaults.set(nameArray, forKey: "roster")
        }
        rosterLabel.text = nameArray.joined(separator: ", ")
        chosenNameLabel.text = nameArray.randomElement()
    }
    
    @IBAction func onClearButtonTapped(_ sender: Any) {
        nameArray.removeAll()
        defaults.set(nameArray, forKey: "roster")
        rosterLabel.text = ""
    }
    
    
    func loadNames() {
        if let savedArray = defaults.object(forKey: "roster") as? [String] {
            nameArray = savedArray
        }

    }
    
    
}

