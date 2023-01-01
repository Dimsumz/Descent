//
//  ViewController.swift
//  Descent (App Version)
//
//  Created by Jonathan Ouyang on 12/10/22.
//

import UIKit

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func playButton(_ sender: UIButton) {
        performSegue(withIdentifier: "pToPlay", sender: self)
    }
    
    
    @IBAction func buttonDismiss(_ sender: UIButton) {
        dismiss(animated: true)
    }
    
    @IBAction func unwind(_ sender: UIStoryboardSegue) {
    }
    
    
}

