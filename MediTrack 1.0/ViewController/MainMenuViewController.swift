//
//  MainMenuViewController.swift
//  MediTrack 1.0
//
//  Created by Angelique Abacajan on 11/22/19.
//  Copyright © 2019 Angelique Abacajan. All rights reserved.
//

import UIKit

class MainMenuViewController: UIViewController {
    
    let medicationController = MedicationController()
    
    @IBOutlet weak var logoLabel: UILabel!
    
    @IBOutlet weak var viewMedicationsButton: UIButton!
    
    @IBAction func viewMedicationsButton(_ sender: Any) {
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
   override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        switch segue.identifier {
            
         case "addMedicationSegue":
            guard let addVC = segue.destination as? AddEditViewController else { return }
             
             addVC.medicationController = medicationController
             
         case "viewMedicationsSegue":
             guard let medicationVC = segue.destination as? MedicationListTableViewController else { return }
             
             medicationVC.medicationController = medicationController
            
         default:
             fatalError("Could not find segue")
              
        }
    }
}

