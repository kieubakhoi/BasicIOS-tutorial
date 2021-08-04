//
//  HomeViewController.swift
//  BasicIOS-tutorial-CoreData
//
//  Created by Apple on 05/08/2021.
//

import UIKit
import CoreData

class HomeViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    var fetchedResultsController: NSFetchedResultsController<User>!
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        setupData()
    }
    func setupData() {
//        save(name: "Tí", age: 10, gender: true)
//        save(name: "Tèo", age: 12, gender: true)
//        save(name: "Linh", age: 9, gender: false)
//        save(name: "Trang", age: 8, gender: false)
        initializeFetchedResultsController()
    }
    
    
    //MARK: - Config
    func setupUI() {
        title = "Home"
        
        //tableView
        tableView.delegate = self
        tableView.dataSource = self
        
        let nib = UINib(nibName: "HomeCell", bundle: .main)
        tableView.register(nib, forCellReuseIdentifier: "cell")
        
//        navigation bar
        let addNewBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(gotoAddNew))
        self.navigationItem.rightBarButtonItem = addNewBarButtonItem

        let deleteBarButtonItem = UIBarButtonItem(barButtonSystemItem: .trash, target: self, action: #selector(deleleAll))
        self.navigationItem.leftBarButtonItem = deleteBarButtonItem
    }
    
    //MARK: - Navigation Bar
    @objc func gotoAddNew() {
        let vc = NewViewController()
        self.navigationController?.pushViewController(vc, animated: true)
    }
    @objc func deleleAll() {
        let alert = UIAlertController(title: "Confirm",
                                       message: "Do you want to delete all item?",
                                       preferredStyle: .alert)
         
        let saveAction = UIAlertAction(title: "OK", style: .default) { (alert) in
            print("DELETE ALL")
            
            // lấy AppDelegate
            guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else { return }
            
            // lấy Managed Object Context
            let managedContext = appDelegate.persistentContainer.viewContext
            
            // Create Fetch Request
            let deleteFetch = NSFetchRequest<NSFetchRequestResult>(entityName: "User")
            
            // Initialize Batch Delete Request
            let deleteRequest = NSBatchDeleteRequest(fetchRequest: deleteFetch)
            
            do {
                // execute delete
                try managedContext.execute(deleteRequest)
                
                // save
                try managedContext.save()
                
                // Perform Fetch
                try self.fetchedResultsController.performFetch()
                
                // Reload Table View
                self.tableView.reloadData()
                
            } catch let error as NSError {
                print("Could not save. \(error), \(error.userInfo)")
            }
            
        }
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel)
        
        alert.addAction(saveAction)
        alert.addAction(cancelAction)
        
        present(alert, animated: true)
    }
    
    //MARK: - Dummy Data
    func save(name: String, age: Int, gender: Bool) {
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else { return }
        
        let managedContext = appDelegate.persistentContainer.viewContext
        
        let entity = NSEntityDescription.entity(forEntityName: "User", in: managedContext)!
        
        let user = NSManagedObject(entity: entity, insertInto: managedContext)
        
        user.setValue(name, forKeyPath: "name")
        user.setValue(age, forKeyPath: "age")
        user.setValue(gender, forKeyPath: "gender")
        
        do {
            try managedContext.save()
        } catch let error as NSError {
            print("Could not save. \(error), \(error.userInfo)")
        }
    }

}

extension HomeViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            fetchedResultsController.fetchedObjects!.count
        }
        
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! HomeCell
        
        let user = fetchedResultsController.object(at: indexPath)
        
        cell.nameLabel.text = user.name
        cell.ageLabel.text = "\(user.age) years old"
        cell.genderLabel.text = user.gender ? "Male" : "Female"
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
            tableView.deselectRow(at: indexPath, animated: true)
            let vc = EditViewController()

            //lấy đối tượng và gán
            vc.user = fetchedResultsController.object(at: indexPath)

            self.navigationController?.pushViewController(vc, animated: true)
        }
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // get AppDelegate
            guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else { return }
            
            // get Managed Object Context
            let managedContext = appDelegate.persistentContainer.viewContext
            
            // get item to delete
            let user = fetchedResultsController.object(at: indexPath)
            
            // delete
            managedContext.delete(user)
            
            // save context
            do {
                try managedContext.save()
            } catch let error as NSError {
                print("Could not save. \(error), \(error.userInfo)")
            }
        }
    }
}

//MARK: - CoreData
extension HomeViewController : NSFetchedResultsControllerDelegate {
    //init fetch result
        func initializeFetchedResultsController() {

            // Create Fetch Request
            let fetchRequest: NSFetchRequest<User> = User.fetchRequest()
            // Configure Fetch Request
            fetchRequest.sortDescriptors = [NSSortDescriptor(key: "name", ascending: true)]

            // lấy AppDelegate
            guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else { return }

            // lấy Managed Object Context
            let managedContext = appDelegate.persistentContainer.viewContext

            fetchedResultsController = NSFetchedResultsController(fetchRequest: fetchRequest,
                                                                  managedObjectContext: managedContext,
                                                                  sectionNameKeyPath: nil,
                                                                  cacheName: nil)
            fetchedResultsController.delegate = self

            do {
                try fetchedResultsController.performFetch()
            } catch {
                fatalError("Failed to initialize FetchedResultsController: \(error)")
            }
        }
    
    func controller(_ controller: NSFetchedResultsController<NSFetchRequestResult>, didChange anObject: Any, at indexPath: IndexPath?, for type: NSFetchedResultsChangeType, newIndexPath: IndexPath?) {
        switch (type) {
        case .insert:
            print("insert")
            if let indexPath = newIndexPath {
                tableView.insertRows(at: [indexPath], with: .fade)
            }
            break;
        case .delete:
            print("delete")
            if let indexPath = indexPath {
                tableView.deleteRows(at: [indexPath], with: .fade)
                break;
            }
        case .update:
            print("update")
            tableView.reloadRows(at: [indexPath!], with: .automatic)
        default:
            print("Default")
        }
        }
}
