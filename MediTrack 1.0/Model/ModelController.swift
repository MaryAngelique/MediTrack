//
//  ModelController.swift
//  MediTrack 1.0
//
//  Created by Angelique Abacajan on 11/22/19.
//  Copyright © 2019 Angelique Abacajan. All rights reserved.
//

import Foundation

class MedicationController {

    init() {
        //loadFromPersistentStore()
    }

    var medications: [Medication] = []
    
    func create(name: String, dosage: String, dosageType: String?, frequency: Frequency) {
        let medication = Medication(name: name, dosage: dosage, dosageType: dosageType, frequency: frequency)
        medications.append(medication)
    }
    
    
    func addMedication(medication: Medication) {
        medications.append(medication)
        //saveToPersistentStore()
    }

    func removeMedication(medication: Medication) {
        guard let medicationIndex = medications.firstIndex(of: medication) else { return }
        medications.remove(at: medicationIndex)
        
    }

    func updateMedication(for medication: Medication, newName: String?, newDosage: String?, newDosageType: String?, newFrequency: Frequency) {
        guard let medicationIndex = medications.firstIndex(of: medication) else { return }
        var updatedMedication = medication

        if let newMedicationName = newName {
            updatedMedication.name = newMedicationName
        }

        if let newMedicationDosage = newDosage {
            updatedMedication.dosage = newMedicationDosage
        }
        
        if let newMedicationDosageType = newDosageType {
            updatedMedication.dosageType = newMedicationDosageType
        }
        
        medications[medicationIndex] = updatedMedication
        //saveToPersistentStore()
    }
}
