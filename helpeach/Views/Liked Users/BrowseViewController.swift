//
//  ViewController.swift
//  helpeach
//
//  Created by Igor Astsatryan on 28.02.23.
//

import UIKit

class BrowseViewController: UIViewController {
    
    
    @IBOutlet weak var table: UITableView!
    
    let likedUsers = [
        LikedUser(image: UIImage(named: "alfred"), name: "Alfred", speciality: "Front-End Specialist"),
        LikedUser(image: UIImage(named: "jess"), name: "Jess", speciality: "HR Specialist"),
        LikedUser(image: UIImage(named: "frank"), name: "Frank", speciality: "Plumber Specialist"),
        LikedUser(image: UIImage(named: "katie"), name: "Katie", speciality: "Clening at home")
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        configureTable()
    }


    func configureTable() {
        table.delegate = self
        table.dataSource = self
    }
    @IBAction func goToUserViewController(_ sender: UIBarButtonItem) {
        let controller = storyboard?.instantiateViewController(withIdentifier: "UserViewController") as! UIViewController
        controller.modalPresentationStyle = .popover
        controller.modalTransitionStyle = .coverVertical
        present(controller, animated: true, completion: nil)
    }
    
    
}

extension BrowseViewController: UITableViewDelegate, UITableViewDataSource {
    
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 120
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return likedUsers.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = table.dequeueReusableCell(withIdentifier: "cell1", for: indexPath) as! infoTableCell
        let user = likedUsers[indexPath.row]
        cell.title.text = user.name
        cell.speciality.text = user.speciality
        cell.imageView!.image = user.image
        
        return cell
    }
    
    
}
