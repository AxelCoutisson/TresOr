//
//  ViewController.swift
//  TresOr
//
//  Created by Celine Waldner on 07/01/2021.
//

import UIKit
import Charts

class ViewController: UIViewController, UITextFieldDelegate, UITableViewDataSource {
    
    // MARK: - Title6666666666666
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
    
    
    // MARK: - TableView
    var operations = [Double]()
    @IBOutlet weak var listeTransaction: UITableView!
    
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

    
    
    // MARK: — ViewDieLoad
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        listeTransaction.dataSource = self
        setupPieChart()
    }
    
}

