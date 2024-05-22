//
//  ViewController.swift
//  BullsEye
//
//  Created by Nicole Groeger on 2024-05-21.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func showAlert(){
        let alert = UIAlertController(
            title: "Hello, World", // shows title on popup
            message: "This is my first app!", // main popup text
            preferredStyle: .alert)
        
        let action = UIAlertAction(
            title: "Awesome", // action button text
            style: .default,
            handler: nil)
        
        alert.addAction(action)
        present(alert, animated: true, completion: nil)
    }

}

