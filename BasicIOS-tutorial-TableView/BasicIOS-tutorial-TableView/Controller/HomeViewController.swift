//
//  HomeViewController.swift
//  BasicIOS-tutorial-TableView
//
//  Created by Apple on 31/07/2021.
//

import UIKit

class HomeViewController: UIViewController {
    // add an array
//    var names: [String] = ["Khôi","Hưng", "Nguyên", "Long", "Khương","An"]
    // add arrays
//    var names: [[String]] = [
//    ["Khôi","Hưng", "Nguyên", "Long", "Khương","An"],
//    ["Swift","Oject Type C","Android","Java"]
//    ]
    
    var titles: [String] = ["iOS", "Android"]
    // set array by class
    var users: [User] = []
    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()

        // title
        title = "Home"
        // make Custem Cell
        let nib = UINib(nibName: "HomeCell", bundle: .main)
        // resigster Custem cell
        tableView.register(nib, forCellReuseIdentifier: "cell")
//        // register cell in this file
//        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        // Delegate and Data Source
        tableView.delegate = self
        tableView.dataSource = self
        // make value for user
        users = getUsers()
        
    }
    func getUsers() -> [User] {
            //1
            var users = [User]()
            //2
            for i in 0...30 {
                //3
                let user = User(name: "Name \(i+1)", age: Int.random(in: 10...30), gender: Bool.random())
                //4
                users.append(user)
            }
            
            return users
        }
}

extension HomeViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return users.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        //Ex3:
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! HomeCell
        let user = users[indexPath.row]
        cell.nameLabel.text = user.name
        cell.subTitle.text = user.getSubTitle()
        return cell
        
//        // Ex2:
//        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! HomeCell
//
//        cell.nameLabel.text = names[indexPath.section][indexPath.row]
//        cell.subTitle.text = "Sub Title"
//        return cell
        
        // this is Ex1 :
//        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
//        cell.textLabel?.text = names[indexPath.section][indexPath.row]
//
//        // make custom label
//        let label = UILabel(frame: CGRect(x: 20, y: 30, width: 100, height: 15))
//        label.text = "sub Title"
//        label.textColor = .red
//        cell.addSubview(label)
//        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //Ex3:
        let user = users[indexPath.row]
        let vc = DetailViewController()
        vc.name = user.name
        
        self.navigationController?.pushViewController(vc, animated: true)
        
//  //    Ex1 and Ex2:
//        print("Select cell: \(names[indexPath.section][indexPath.row])")
//        //  let make object Detail View Controller
//        let vc = DetailViewController()
//        // set value variable name in Detail View Controller by name of arrays when click
//        vc.name = names[indexPath.section][indexPath.row]
//        // push View Detail by navigation Controller
//        self.navigationController?.pushViewController(vc, animated: true)
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
            return titles[section]
        }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
            return 80
        }
}
