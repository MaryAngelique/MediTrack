//
//  MedicationListTableViewCell.swift
//  MediTrack 1.0
//
//  Created by Angelique Abacajan on 11/22/19.
//  Copyright © 2019 Angelique Abacajan. All rights reserved.
//

import UIKit

class MedicationListTableViewCell: UITableViewCell {

    @IBOutlet weak var medicationNameLabel: UILabel!
    @IBOutlet weak var dosageLabel: UILabel!
    @IBOutlet weak var dosageTypeLabel: UILabel!
    @IBOutlet weak var frequencyLabel: UILabel!
    @IBOutlet weak var prescribedLabel: UILabel!
    
    
    var medication: Medication? {
        didSet {
            updateViews()
        }
    }
    
    func updateViews() {
        guard let medication = medication else { return }
            medicationNameLabel?.text = medication.name
            dosageLabel?.text = medication.dosage
            dosageTypeLabel.text = medication.dosageType
            frequencyLabel.text = medication.frequency.howOften
            prescribedLabel.text = medication.prescription ? "This is a perscription medication." : "This is an over the counter medication."
    }

}
