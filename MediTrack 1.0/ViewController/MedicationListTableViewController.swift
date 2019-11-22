//
//  MedicationListTableViewController.swift
//  MediTrack 1.0
//
//  Created by Angelique Abacajan on 11/22/19.
//  Copyright © 2019 Angelique Abacajan. All rights reserved.
//

import UIKit

class MedicationListTableViewController: UITableViewController {
    
        
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.reloadData()
    }

    
    var medicationController: MedicationController?
    
//    override func numberOfSections(in tableView: UITableView) -> Int {
//        return 2
//    }

//     override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
//
//         if section == 0 {
//
//             return "Prescriptions"
//
//         } else {
//            return "Need to refill soon."
//        }
//
//
//     }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        tableView.reloadData()
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return medicationController?.medications.count ?? 0
        
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "MedicationCell", for: indexPath) as? MedicationListTableViewCell else { return UITableViewCell() }
        
        let medication = medicationController?.medications[indexPath.row]
        
        cell.medication = medication
        
//          cell.medicationNameLabel?.text = medication.name
//        cell.dosageLabel?.text = medication.dosage
//        cell.dosageTypeLabel?.text = medication.dosageType
//        cell.frequencyLabel?.text = "\(medication.frequency)"
//        cell.prescribedLabel?.text = medication.prescription ?? false ? "OTC" : "Prescription"

        return cell
    }
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
//        if editingStyle == .remove {
//            medicationModelController.delete(medication: medicationFor(section: indexPath.section)[indexPath.row])
//            tableView.removeRows
//        }
    }


    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        switch segue.identifier {
         case "editMedicationFromListSegue":
            guard let editVC = segue.destination as? AddEditViewController else { return }
                
             let indexPath = tableView.indexPathForSelectedRow
             let medication = medicationController?.medications[indexPath!.row]
             editVC.medication = medication
             editVC.medicationController = medicationController
                     
                     editVC.medicationController = medicationController
                     //viewController.medication = cell.medication
         
         case "addMedicationSegue":
             guard let vc = segue.destination as? AddEditViewController else { return }
             
             vc.medicationController = medicationController
        
         default:
             fatalError("Could not find segue")
              
         }
    }
    
    
}


