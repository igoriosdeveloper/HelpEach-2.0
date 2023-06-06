import UIKit

class SecondViewController: UIViewController {

    @IBOutlet weak var completedTableView: UITableView!
    
    let completedJobs = [
        CompletedJobInfo(speciality: "HR", info: "Added 30+ users to new job", image: UIImage(named: "jess")),
        CompletedJobInfo(speciality: "Architector", info: "Finished a project with 4 flours in 10 days", image: UIImage(named: "alfred"))
        ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        completedTableView.delegate = self
        completedTableView.dataSource = self
        
    }
    
    
    @IBAction func goToUserViewController(_ sender: UIBarButtonItem) {
        
        let controller = storyboard?.instantiateViewController(withIdentifier: "UserViewController") as! UIViewController
        controller.modalPresentationStyle = .popover
        controller.modalTransitionStyle = .coverVertical
        present(controller, animated: true, completion: nil)
        
    }
    
}

extension SecondViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        completedJobs.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = completedTableView.dequeueReusableCell(withIdentifier: "cell1", for: indexPath) as! CompletedTableViewCell
        let compl = completedJobs[indexPath.row]
        cell.info.text = compl.info
        cell.avatarImage.image = compl.image
        cell.spec.text = compl.speciality
        
        return cell
    }
    
    
    
    
}
