//
//  HomeViewController.swift
//  BasicIOS-tutorial-Connect-Networking
//
//  Created by Apple on 03/08/2021.
//

import UIKit

class HomeViewController: BaseViewController {

    @IBOutlet weak var tableView: UITableView!
    
    var viewModel =  HomeViewModel()
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    //MARK: - config
    override func setupUI() {
        super.setupUI()
        // title
        self.title = "Home"
        
        // table view
        tableView.delegate = self
        tableView.dataSource = self
        
        let nib = UINib(nibName: "HomeCell", bundle: .main)
        tableView.register(nib, forCellReuseIdentifier: "cell")
        
        // navi
        let resetTabbrItem = UIBarButtonItem(image: UIImage(named: "icon-refresh" ), style: .plain , target: self, action: #selector(loadAPI))
        self.navigationItem.rightBarButtonItem = resetTabbrItem
    }
    
    override func setupData() {
            
    }
    func updateUI() {
        tableView.reloadData()
    }
    
    //MARK: - API
    @objc func loadAPI() {
        print("Load API")
        viewModel.loadAPI3 { (done, msg) in
            if done {
                self.updateUI()
            } else {
                print("API ERROR: \(msg)")
            }
        }
    }
}

extension HomeViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        viewModel.musics.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        200
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell",for: indexPath) as! HomeCell
        let item = viewModel.musics[indexPath.row]
        cell.titleLabel.text = item.name
        cell.txtLabel.text = item.artistName
        
        if item.thumbnaiImage != nil {
            cell.imageLabel.image = item.thumbnaiImage
        } else {
            cell.imageLabel.image = nil
            
            // dowloaded
            NetWorking.shared().downloadImage(url: item.artworkUrl100) { (image) in
                if let image = image {
                    cell.imageLabel.image = image
                    item.thumbnaiImage = image
                } else {
                    cell.imageLabel.image = nil
                }
            }
        }
        return cell
    }
}
