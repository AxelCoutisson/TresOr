//
//  ViewController.swift
//  TresOr
//
//  Created by Celine Waldner on 07/01/2021.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return operations.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! TableViewCell
        //let cell2 = tableView.dequeueReusableCell(withIdentifier: "cell2", for: indexPath) as! TableViewCell2
        
        let row = indexPath.row
        cell.label.text = String(operations[row])
        return cell
    }
    
    var operations = [Double]()

    @IBOutlet weak var titre: UILabel!
    @IBOutlet weak var valeurPortefeuille: UILabel!
    @IBOutlet weak var quantite: UITextField!
    @IBOutlet weak var boutonAjouter: UIButton!
    @IBOutlet weak var listeTransaction: UITableView!
    
    @IBAction func ajouteQuantite(_ sender: UIButton) {
        if var valeurAj: Double = Double(quantite.text!){
            operations.append(valeurAj)
            listeTransaction.reloadData()
            if var valeurSave: Double = Double(valeurPortefeuille.text!){
                valeurPortefeuille.text = String(format: "%.2f", valeurAj + valeurSave)
            }
            else{
                valeurPortefeuille.text = String(format: "%.2f", valeurAj)
            }
        }
    }
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        quantite.delegate = self
        
        listeTransaction.dataSource = self
    }

}

