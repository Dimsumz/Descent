//
//  playVC.swift
//  Descent (App Version)
//
//  Created by Jonathan Ouyang on 12/24/22.
//

import Foundation
import UIKit

class playVC: UIViewController {
    
    var rounds: Int! = 1
    var rightCounter: Int!
    var numNum: Int!
    var array1: [String] = []
    
    @IBOutlet weak var buttona1: UIButton!
    @IBOutlet weak var buttona2: UIButton!
    @IBOutlet weak var buttona3: UIButton!
    @IBOutlet weak var buttona4: UIButton!
    @IBOutlet weak var buttona5: UIButton!
    @IBOutlet weak var buttona6: UIButton!
    @IBOutlet weak var buttona7: UIButton!
    @IBOutlet weak var buttona8: UIButton!
    @IBOutlet weak var buttona9: UIButton!
    
    @IBOutlet weak var roundLabel: UILabel!
    
    
    @IBAction func button1(_ sender: UIButton) {numCheck(a: 0)}
    @IBAction func button2(_ sender: UIButton) {numCheck(a: 1)}
    @IBAction func button3(_ sender: UIButton) {numCheck(a: 2)}
    @IBAction func button4(_ sender: UIButton) {numCheck(a: 3)}
    @IBAction func button5(_ sender: UIButton) {numCheck(a: 4)}
    @IBAction func button6(_ sender: UIButton) {numCheck(a: 5)}
    @IBAction func button7(_ sender: UIButton) {numCheck(a: 6)}
    @IBAction func button8(_ sender: UIButton) {numCheck(a: 7)}
    @IBAction func button9(_ sender: UIButton) {numCheck(a: 8)}
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        rounds = 1
        setList()
    }
    
    func setList() {
        rightCounter = 0
        array1 = ["", "", "", "", "", "", "", "", ""]
        resetNumbers()
        loadNumbers()
        loadRNum()
    }
    
    func loadRNum() {
        roundLabel.text = "Round \(rounds ?? 0)"
    }
    
    func boxNumLoad() {
        buttona1.setTitle(array1[0], for: .normal)
        buttona2.setTitle(array1[1], for: .normal)
        buttona3.setTitle(array1[2], for: .normal)
        buttona4.setTitle(array1[3], for: .normal)
        buttona5.setTitle(array1[4], for: .normal)
        buttona6.setTitle(array1[5], for: .normal)
        buttona7.setTitle(array1[6], for: .normal)
        buttona8.setTitle(array1[7], for: .normal)
        buttona9.setTitle(array1[8], for: .normal)
    }
    
    func resetNumbers() {
        buttona1.setTitle("", for: .normal)
        buttona2.setTitle("", for: .normal)
        buttona3.setTitle("", for: .normal)
        buttona4.setTitle("", for: .normal)
        buttona5.setTitle("", for: .normal)
        buttona6.setTitle("", for: .normal)
        buttona7.setTitle("", for: .normal)
        buttona8.setTitle("", for: .normal)
        buttona9.setTitle("", for: .normal)
    }
    
    func loadNumbers() {
        if (rounds < 6) {
            numNum = 3
            setNumbers(cycles: numNum)
        } else if (rounds < 11) {
            numNum = 6
            setNumbers(cycles: numNum)
        } else if (rounds < 16) {
            numNum = 9
            setNumbers(cycles: numNum)
        } else if (rounds == 16) {
            performSegue(withIdentifier: "winSegue", sender: self)
        } else {
            print("error in function loadNumbers")
            
        }
    }
    
    func setNumbers(cycles: Int!) {
        var c1 = 1
        while c1 <= cycles {
            let rButtonNum = Int.random(in: 0...8)
            let rNum = Int.random(in: 1..<1000)
            
            if (array1[rButtonNum] == "") {
                array1[rButtonNum] = String(rNum)
                c1 += 1
            } else if (array1[rButtonNum] != "") {
                c1 += 0
            }
        }
        boxNumLoad()
    }
    
    func numCheck(a: Int) {
        if (array1[a] == "") {
            performSegue(withIdentifier: "loseSegue", sender: self)
        } else if (array1[a] != "") {
            var highVal = 0
            for num in array1 {
                let betterNum = Int(num) ?? 0
                if (betterNum > highVal) {
                    highVal = betterNum
                }
            }
            
            if (array1[a] != String(highVal)) {
                performSegue(withIdentifier: "loseSegue", sender: self)
            } else if (array1[a] == String(highVal)) {
                array1[a] = ""
                rightCounter += 1
                boxNumLoad()
                if (rightCounter == numNum) {
                    rounds += 1
                    print("advance rounds")
                    setList()
                }
            }
        }
    }
    
    
    @IBAction func tempButton(_ sender: UIButton) {
        dismiss(animated: true)
    }
    
}


