//
//  ViewController.swift
//  TresOr
//
//  Created by Celine Waldner on 07/01/2021.
//

import UIKit
import Charts

class ViewController: UIViewController, UITextFieldDelegate, UITableViewDataSource {
    
    
    
    // MARK: - Title
    @IBOutlet weak var titre: UILabel!
    
    
    
    
    // MARK: - PieChart
    @IBOutlet var pieView: PieChartView!
    func setupPieChart() {
        pieView.chartDescription?.enabled = false
        pieView.drawHoleEnabled = false
        pieView.rotationAngle = 0
        //pieView.rotationEnabled = false
        pieView.isUserInteractionEnabled = false
        
        //pieView.legend.enabled = false
    }
    
    func updatePieChart() {
        var entries: [PieChartDataEntry] = Array()
        
        var valeurs = [0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0]
        
        if categorie.count > 0{
            for i in 0...categorie.count-1{
                let row = categorie[i]
                var index = 0
                switch row {
                case "Aucune":
                    index = 0
                case "Logement":
                    index = 1
                case "Alimentation":
                    index = 2
                case "Loisirs":
                    index = 3
                case "Courses":
                    index = 4
                case "Shopping":
                    index = 5
                case "Santé":
                    index = 6
                case "Transport":
                    index = 7
                default:
                    print("default")
                }
                if operations[i] < 0{
                    index = index + 8
                }
                valeurs[index] = valeurs[index] + operations[i]
            }
            
        }
        let pieLabels = ["Aucune +", "Logement +", "Alimentation +", "Loisirs +", "Courses +", "Shopping +", "Santé +", "Transport +","Aucune -", "Logement -", "Alimentation -", "Loisirs -", "Courses -", "Shopping -", "Santé -", "Transport -"]
        let pieColor = [0x90E0F0, 0x002AFF, 0xFFD480, 0xB37700, 0xFFB3B3, 0xFF2A00, 0xD5FFCC, 0x008015, 0x9900D4, 0x33002A, 0xF2E6FF, 0xBB99FF,0xC4FF4D,0xCCCC00, 0xB3E5FF, 0x4D88FF]
        
        for i in 0...15{
            if valeurs[i] != 0{
                entries.append(PieChartDataEntry(value: abs(valeurs[i]), label: pieLabels[i]))
            }
        }
        let dataSet = PieChartDataSet(entries: entries, label: "")
        
        for i in 0...15{
            if valeurs[i] != 0{
                dataSet.colors.append(NSUIColor(hex: pieColor[i]))
                
            }
        }
        dataSet.drawValuesEnabled = false
        pieView.data = PieChartData(dataSet: dataSet)
        
    }
    
    
    // MARK: - TableView
    @IBOutlet weak var listeTransaction: UITableView!
    var operations = [Double]()
    var descript = [String]()
    var categorie = [String]()
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return operations.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell2 = tableView.dequeueReusableCell(withIdentifier: "cell2", for: indexPath) as! TableViewCell2
        let row = indexPath.row
        cell2.label.text = String(operations[row])
        cell2.descri.text = String(descript[row])
        cell2.catego.text = String(categorie[row])
        if operations[row] >= 0 {
            cell2.backgroundColor = UIColor.green
        }
        else{
            cell2.backgroundColor = UIColor.red
        }
        return cell2
    }
    

    
    
    // MARK: — ViewDieLoad
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        listeTransaction.dataSource = self
        setupPieChart()
        updatePieChart()
        
    }
    // MARK: - Envoie des informations
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let vc = segue.destination as? AddViewController {
            vc.operations = operations
            vc.descript = descript
            vc.categorie = categorie
        }
        
    }
    // MARK: - Retour sur la vue
    @IBAction func retour(_ unwindSegue: UIStoryboardSegue) {
        if let vc = unwindSegue.source as? AddViewController {
            operations = vc.operations
            descript = vc.descript
            categorie = vc.categorie
            updatePieChart()
            listeTransaction.reloadData()
        }
    }
    
}
