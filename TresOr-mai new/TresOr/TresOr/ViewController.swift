//
//  ViewController.swift
//  TresOr
//
//  Created by Celine Waldner on 07/01/2021.
//

import UIKit
import Charts

class ViewController: UIViewController, UITextFieldDelegate, UITableViewDataSource {
    
    @IBOutlet var pieView: PieChartView!
    
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
    
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        quantite.delegate = self
        
        listeTransaction.dataSource = self
        setupPieChart()
    }
    
    func setupPieChart() {
        pieView.chartDescription?.enabled = false
            pieView.drawHoleEnabled = false
            pieView.rotationAngle = 0
            //pieView.rotationEnabled = false
            pieView.isUserInteractionEnabled = false
            
            //pieView.legend.enabled = false
            
            var entries: [PieChartDataEntry] = Array()
            entries.append(PieChartDataEntry(value: 50.0, label: "Takeout"))
            entries.append(PieChartDataEntry(value: 30.0, label: "Healthy Food"))
            entries.append(PieChartDataEntry(value: 20.0, label: "Soft Drink"))
            entries.append(PieChartDataEntry(value: 10.0, label: "Water"))
            entries.append(PieChartDataEntry(value: 40.0, label: "Home Meals"))
            
        let dataSet = PieChartDataSet(entries: entries, label: "")
            
            let c1 = NSUIColor(hex: 0x3A015C)
            let c2 = NSUIColor(hex: 0x4F0147)
            let c3 = NSUIColor(hex: 0x35012C)
            let c4 = NSUIColor(hex: 0x290025)
            let c5 = NSUIColor(hex: 0x11001C)
        
            dataSet.colors = [c1, c2, c3, c4, c5]
            dataSet.drawValuesEnabled = false
            
            pieView.data = PieChartData(dataSet: dataSet)
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

}
