//
//  AddEditTableViewController.swift
//  Table Views
//
//  Created by Konstantin Ryabtsev on 08.02.2022.
//

import UIKit

class AddEditTableViewController: UITableViewController {
    // MARK: - Outlets
    @IBOutlet weak var symbolTextField: UITextField!
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var descriptionTextField: UITextField!
    @IBOutlet weak var usageTextField: UITextField!
    @IBOutlet weak var saveButton: UIBarButtonItem!
    
    // MARK: - Properties
    var emoji = Emoji()
    
    // MARK: - UIViewController Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()
    }
    
    // MARK: - Methods
    func updateUI() {
        symbolTextField.text = emoji.symbol
        nameTextField.text = emoji.name
        descriptionTextField.text = emoji.description
        usageTextField.text = emoji.usage
        
        checkCanSave()
    }
    
    func saveEmoji() {
        emoji.symbol = symbolTextField.text ?? ""
        emoji.name = nameTextField.text ?? ""
        emoji.description = descriptionTextField.text ?? ""
        emoji.usage = usageTextField.text ?? ""
    }
    
    func checkCanSave() {
        if symbolTextField.text!.count != 1 || nameTextField.text!.count == 0 || descriptionTextField.text!.count == 0 {
            saveButton.isEnabled = false
        } else {
            saveButton.isEnabled = true
        }
    }
    
    // MARK: - Actions
    @IBAction func editingChanged(_ sender: UITextField) {
        checkCanSave()
    }
    
    
    // MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        saveEmoji()
    }
}
