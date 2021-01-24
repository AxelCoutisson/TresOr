//
//  ViewController.swift
//  TresOr
//
//  Created by Celine Waldner on 07/01/2021.
//

import UIKit

class AddViewController: UIViewController, UITextFieldDelegate, UITableViewDataSource, UIPickerViewDataSource, UIPickerViewDelegate {
    
    let categorieText = ["Aucune", "Logement", "Alimentation", "Loisirs","Courses", "Shopping", "Santé", "Transport"]
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return categorieText.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return categorieText[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
       categPick = categorieText[row]
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return operations.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! TableViewCell
        //let cell2 = tableView.dequeueReusableCell(withIdentifier: "cell2", for: indexPath) as! TableViewCell2
        
        let row = indexPath.row
        cell.label.text = String(operations[row])
        cell.descri.text = String(descript[row])
        cell.catego.text = String(categorie[row])
        if operations[row] >= 0 {
            cell.backgroundColor = UIColor.green
        }
        else{
            cell.backgroundColor = UIColor.red
        }
        return cell
    }
    
    var operations = [Double]()
    var descript = [String]()
    var categorie = [String]()
    var categPick = String()

    @IBOutlet weak var titre: UILabel!
    @IBOutlet weak var valeurPortefeuille: UILabel!
    @IBOutlet weak var quantite: UITextField!
    @IBOutlet weak var boutonAjouter: UIButton!
    @IBOutlet weak var labelTotal: UILabel!
    @IBOutlet weak var labelDescriptif: UILabel!
    @IBOutlet weak var testDescription: UITextField!
    @IBOutlet weak var labelMontant: UILabel!
    @IBOutlet weak var listeTransaction: UITableView!
    @IBOutlet weak var picker: UIPickerView!
    
    
    @IBAction func ajouteQuantite(_ sender: UIButton) {
        if var valeurAj: Double = Double(quantite.text!){
            var textDesc: String = String(testDescription.text!)
            operations.append(valeurAj)
            descript.append(textDesc)
            categorie.append(categPick)
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
    
    var data: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        quantite.delegate = self
        testDescription.delegate = self
        listeTransaction.dataSource = self
        picker.dataSource = self
        picker.delegate = self
        
    }
    
    
}

