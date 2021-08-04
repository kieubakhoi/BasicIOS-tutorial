//
//  EditViewController.swift
//  BasicIOS-tutorial-CoreData
//
//  Created by Apple on 05/08/2021.
//

import UIKit

class EditViewController: UIViewController {

    var user: User!
    
    //MARK: - Properties
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var ageTextField: UITextField!
    @IBOutlet weak var genderSegmentControl: UISegmentedControl!
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        setupData()
    }
    func setupUI() {
        title = "Update"
        
        // navigation bar
        let doneBarButtonItem = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(done))
        self.navigationItem.rightBarButtonItem = doneBarButtonItem
    }
    
    func setupData() {
        if let user = user {
            nameTextField.text = user.name
            ageTextField.text = "\(user.age)"
            genderSegmentControl.selectedSegmentIndex = user.gender ? 1: 0
            
        }
    }
    //MARK: - navigation bar
    @objc func done() {
        // get App Delegate
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else { return }
        
        // get Managed Object Context
        let managedContext = appDelegate.persistentContainer.viewContext
        
        // set value for Object
        user.name = nameTextField.text
        user.age = Int16(ageTextField.text!) ?? 0
        user.gender = genderSegmentControl.selectedSegmentIndex == 0 ? true : false
        
        //save context
        do {
            try managedContext.save()
            self.navigationController?.popViewController(animated: true)
        } catch let error as NSError {
            print("Could not save. \(error) , \(error.userInfo)")
        }
        
    }

}
