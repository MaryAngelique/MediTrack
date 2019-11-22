//
//  AddEditViewController.swift
//  MediTrack 1.0
//
//  Created by Angelique Abacajan on 11/22/19.
//  Copyright © 2019 Angelique Abacajan. All rights reserved.
//

import UIKit

class AddEditViewController: UIViewController {
    
    // MARK: - Outlets
    
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var isPrescriptionSegmentedControl: UISegmentedControl!
    @IBOutlet weak var dosageTextField: UITextField!
    @IBOutlet weak var dosageTypeTextField: UITextField!
    @IBOutlet weak var frequencyPickerView: UIPickerView!
  
    @IBOutlet weak var saveBarButton: UIBarButtonItem!
        
        
    // MARK: - Properties
    
    var medicationController: MedicationController?
    var medication: Medication?
    var pickerData: [String] = []
    
    // MARK: - View
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.frequencyPickerView.delegate = self
        self.frequencyPickerView.dataSource = self
        pickerData = Frequency.frequencies
        self.frequencyPickerView.delegate = self
        self.frequencyPickerView.dataSource = self
        self.nameTextField.delegate = self
        self.dosageTextField.delegate = self
        self.dosageTypeTextField.delegate = self
        
        updateViews()
    }
    
    // MARK: - Actions
    @IBAction func isPrescriptionSegmentedControlToggled(_ sender: UISwitch) {
        
    }
    
    @IBAction func saveAction(_ sender: UIBarButtonItem) {
       
        guard isViewLoaded,
        let name = nameTextField.text,
        let dosage = dosageTextField.text,
        let dosageType = dosageTypeTextField.text else { return }
        let frequencyRow = frequencyPickerView.selectedRow(inComponent: 0)
        let frequencyText = pickerData[frequencyRow]
        guard let frequency = Frequency.init(rawValue: frequencyText) else { return }
        
        if nameTextField.text == ""  {
            let alert = UIAlertController(title: "Error", message: "Please fill out the required fields below", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
            present(alert, animated: true)
        }
        
        if let medication = medication {
            medicationController?.updateMedication(for: medication, newName: name, newDosage: dosage, newDosageType: dosageType, newFrequency: frequency)
            navigationController?.popToRootViewController(animated: true)
        } else {
            medicationController?.create(name: name, dosage: dosage, dosageType: dosageType, frequency: frequency)
            navigationController?.popToRootViewController(animated: true)
        }
    }
        
    // MARK: - Methods
    // FIXME: Update Views does not correctly update the picker view to display the current option.
    func updateViews() {
        if let medication = medication {
            nameTextField.text = medication.name
            dosageTextField.text = medication.dosage
            dosageTypeTextField.text = medication.dosageType
            if medication.prescription == false {
                isPrescriptionSegmentedControl.selectedSegmentIndex = 0
            } else {
                isPrescriptionSegmentedControl.selectedSegmentIndex = 1
            }
            
            if dosageTextField.text?.isEmpty ?? false {
                let alert = UIAlertController(title: "Error", message: "Please check prescription for dosage", preferredStyle: .alert)
                alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
                present(alert, animated: true)
            }
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let medicationVC = segue.destination as? MedicationListTableViewController else { return }
             
             medicationVC.medicationController = medicationController
            
         
    }
}

extension AddEditViewController: UIPickerViewDelegate, UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        Frequency.frequencies.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
//        let choice = pickerView.selectedRow(inComponent: row)
        let tempVar = pickerData[row]
        return "\(tempVar)"    }
}

extension AddEditViewController: UITextFieldDelegate {
    // Auto switch text fields
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        let nextTag = textField.tag + 1
        
        if let nextResponder = textField.superview?.viewWithTag(nextTag) {
            nextResponder.becomeFirstResponder()
        } else {
            textField.resignFirstResponder()
        }
        
        return true
    }
    
}

