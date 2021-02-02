//
//  ViewController.swift
//  AnquetinRomain
//
//  Created by Romain Anquetin on 02/02/2021.
//

//Question 1,2,3,4,5 : ok
//

import UIKit

let fullnames = [ "Felisha Toal", "Katharina Pauly", "Vella Vanauken", "Pauletta Thelen", "Kandace Eguia", "Howard Krikorian", "Toby Caya", "Ed Abbott", "Alena Grund", "Dorcas Durazo", "Clora Thurston", "Lekisha Musich", "Harriette Tuten", "Yolanda Will", "Lasonya Mccaffery", "Tracee Fulks", "Antionette Tews", "Latia Wheatley", "Neta Kelton", "Elaine Clark" ]

let ages = [20, 44, 34, 17, 78, 56, 49, 40, 12, 45, 67, 90, 53, 92, 08, 34, 29, 39, 10, 45]

class People{
    var nom = ""
    var age = 0
    
    
    init(nom:String,age:Int) {
        self.age = age
        self.nom = nom
        print(self.nom)
        print(self.age)
    }
}

class ViewController: UIViewController, UITableViewDataSource {
    @IBOutlet weak var peopleTableView: UITableView!
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return peopleTab.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = peopleTableView.dequeueReusableCell(withIdentifier: "peopleCell", for: indexPath)
        let row = indexPath.row
        let labelnom = cell.viewWithTag(1) as! UILabel
        let labelage = cell.viewWithTag(2) as! UILabel
        
        labelnom.text = peopleTab[row].nom
        labelage.text = String(peopleTab[row].age)
        //cell.textLabel?.text = peopleTab[row].age
        
        return cell
    }
    
    var tricroi = true
    
    @IBAction func reverseTri(_ sender: UISwitch) {
        if tricroi {
            tricroi = false
        }
        else{
            tricroi = true
        }
    }
    @IBAction func triage(_ sender: UIButton) {
        if tricroi{
            peopleTab = peopleTab.sorted { ($0.age < $1.age)}
        }
        else{
            peopleTab = peopleTab.sorted { ($0.age > $1.age)}
        }

        peopleTableView.reloadData()

        
    }
    
    var peopleTab = [People]()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        for i in 0...19 {
            peopleTab.append(People(nom: fullnames[i], age: ages[i]))
            print(peopleTab[i])
        }
        
        peopleTableView.dataSource = self
        
    }


}

