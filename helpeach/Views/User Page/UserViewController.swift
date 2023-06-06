//
//  UserViewController.swift
//  helpeach
//
//  Created by Igor Astsatryan on 18.05.23.
//

import UIKit

class UserViewController: UIViewController {

    @IBOutlet weak var contentView: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        UINavigationBar.appearance().setBackgroundImage(UIImage(), for: .default)
        UINavigationBar.appearance().shadowImage = UIImage()
        UINavigationBar.appearance().tintColor = .black

    }
    
    
    override func viewDidLayoutSubviews() {
        
        let backgroundImageView = UIImageView(frame: contentView.bounds)
        contentView.addSubview(backgroundImageView)
        backgroundImageView.image = UIImage(named: "sunset")
        contentView.sendSubviewToBack(backgroundImageView)
        
        let blur = UIBlurEffect(style: .light)
        let blurView = UIVisualEffectView(effect: blur)
        blurView.frame = contentView.bounds
        contentView.addSubview(blurView)
        
        contentView.sendSubviewToBack(blurView)
        contentView.sendSubviewToBack(backgroundImageView)
        
    }
    @IBAction func makeRequest(_ sender: Any) {
        
        let controller = storyboard?.instantiateViewController(withIdentifier: "RequestViewController") as! UIViewController
        controller.modalPresentationStyle = .automatic
        controller.modalTransitionStyle = .flipHorizontal
        present(controller, animated: true, completion: nil)
        
    }
    
}
