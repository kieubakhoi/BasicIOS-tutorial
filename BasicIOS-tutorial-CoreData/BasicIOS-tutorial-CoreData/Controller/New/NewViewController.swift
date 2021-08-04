//
//  NewViewController.swift
//  BasicIOS-tutorial-CoreData
//
//  Created by Apple on 05/08/2021.
//

import UIKit
import CoreData

class NewViewController: UIViewController {

    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var ageTextField: UITextField!
    @IBOutlet weak var genderSegmentedControl: UISegmentedControl!
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        setupData()
    }
    
    //MARK: -config
    func setupUI() {
        title = "New"
        
        //navigation bar
        let doneBarButton = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(done))
        self.navigationItem.rightBarButtonItem = doneBarButton
        
    }
    func setupData() {}
    
    @objc func done () {
        // get AppDelegate
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else { return }
        
        // get Managed Object Context
        let managedContext = appDelegate.persistentContainer.viewContext
        
        // get Enity Name
        let entity = NSEntityDescription.entity(forEntityName: "User", in: managedContext)!
        
        // make a Manager Object
        let user = User(entity: entity, insertInto: managedContext)
        
        //set value of object
        
        user.name = nameTextField.text
        user.age = Int16(ageTextField.text!) ?? 0
        user.gender = genderSegmentedControl.selectedSegmentIndex == 0 ? true : false
        
        // save Context
        do {
            try managedContext.save()
            self.navigationController?.popViewController(animated: true)
        }catch let error as NSError {
            print("Could not save. \(error), \(error.userInfo)")
        }
    }
}
