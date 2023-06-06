//
//  MoreInformationViewController.swift
//  helpeach
//
//  Created by Igor Astsatryan on 11.05.23.
//

import UIKit

class MoreInformationViewController: UIViewController {
    
    @IBOutlet weak var genderTxtField: UITextField!
    @IBOutlet weak var specialityTxtField: UITextField!
    @IBOutlet weak var nextBtn: UIButton!
    @IBOutlet weak var datePick: UIDatePicker!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
    }
    

    @IBAction func nextActionBtn(_ sender: Any) {
        
        let mainHomeController = self.storyboard?.instantiateViewController(withIdentifier: "MainTabBarController") as! UITabBarController
    mainHomeController.modalPresentationStyle = .fullScreen
    mainHomeController.modalTransitionStyle = .partialCurl
    present(mainHomeController, animated: true, completion: nil)
        
    }
    
}
