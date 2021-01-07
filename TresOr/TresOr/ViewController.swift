//
//  ViewController.swift
//  TresOr
//
//  Created by Celine Waldner on 07/01/2021.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate{

    @IBOutlet weak var titre: UILabel!
    @IBOutlet weak var valeurPortefeuille: UILabel!
    @IBOutlet weak var quantite: UITextField!
    @IBOutlet weak var boutonAjouter: UIButton!
    @IBAction func ajouteQuantite(_ sender: UIButton) {
        if var valeurAj: Double = Double(quantite.text!){
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
    }

}

