import UIKit

class LogInViewController: UIViewController {
    
    @IBOutlet weak var contentView: UIView!
    
    @IBOutlet weak var firstNameLabel: UILabel!
    @IBOutlet weak var firstNameTxtField: UITextField!
    @IBOutlet weak var lastNameLabel: UILabel!
    @IBOutlet weak var lastNameTxtField: UITextField!
    @IBOutlet weak var emailLabel: UILabel!
    @IBOutlet weak var emailTxtField: UITextField!
    @IBOutlet weak var passwordLabel: UILabel!
    @IBOutlet weak var passwordTxtField: UITextField!
    
    @IBOutlet weak var lookPassword: UIButton!
    @IBOutlet weak var forgotPasswordBtn: UIButton!
    @IBOutlet weak var loggingInBtn: UIButton!
    @IBOutlet weak var loggingInSegmentControl: UISegmentedControl!
    
    var loginMode = true
    var passwordHidden = true
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configuringLabelsAndTextFields()
        
    }
    
    func configuringLabelsAndTextFields() {
        
        firstNameTxtField.delegate = self
        lastNameTxtField.delegate = self
        emailTxtField.delegate = self
        passwordTxtField.delegate = self
        
        firstNameLabel.isHidden = true
        firstNameTxtField.isHidden = true
        lastNameLabel.isHidden = true
        lastNameTxtField.isHidden = true
    }
    
    override func viewDidLayoutSubviews() {
        
        let backgroundImageView = UIImageView(frame: contentView.bounds)
        contentView.addSubview(backgroundImageView)
        backgroundImageView.image = UIImage(named: "logoNum1")
        contentView.sendSubviewToBack(backgroundImageView)
        
        let blur = UIBlurEffect(style: .light)
        let blurView = UIVisualEffectView(effect: blur)
        blurView.frame = contentView.bounds
        contentView.addSubview(blurView)
        
        contentView.sendSubviewToBack(blurView)
        contentView.sendSubviewToBack(backgroundImageView)
        
    }
    
    
    
    
    @IBAction func loggingInActionBtn(_ sender: UIButton) {
        
        let mail = emailTxtField.text
        let pass = passwordTxtField.text
        if mail == "", pass == "" {
            emailTxtField.backgroundColor = .systemPink
            passwordTxtField.backgroundColor = .systemPink
            firstNameTxtField.backgroundColor = .systemPink
            lastNameTxtField.backgroundColor = .systemPink
        } else if loggingInSegmentControl.selectedSegmentIndex == 0 {
            let homePage = self.storyboard?.instantiateViewController(withIdentifier: "MainTabBarController") as! UITabBarController
            homePage.modalPresentationStyle = .fullScreen
            present(homePage, animated: true, completion: nil)
        } else {
            let moreInformation = self.storyboard?.instantiateViewController(withIdentifier: "moreInformationViewController") as! UIViewController
        moreInformation.modalPresentationStyle = .fullScreen
        moreInformation.modalTransitionStyle = .partialCurl
        present(moreInformation, animated: true, completion: nil)
        
        }
        
    }
    
    
    @IBAction func forgotPasswordActionBtn(_ sender: UIButton) {
        
        let forgotPasswordController = self.storyboard?.instantiateViewController(withIdentifier: "forgotPassNavigationController") as! UINavigationController
        forgotPasswordController.modalPresentationStyle = .popover
        present(forgotPasswordController, animated: true, completion: nil)
        
    }
    
    
    @IBAction func loggingInSwitch(_ sender: UISegmentedControl) {
        
        emailTxtField.backgroundColor = .clear
        passwordTxtField.backgroundColor = .clear
        firstNameTxtField.backgroundColor = .clear
        lastNameTxtField.backgroundColor = .clear
        
        if sender.selectedSegmentIndex == 0 {
            loginMode = true    // login mode
            firstNameLabel.isHidden = true
            firstNameTxtField.isHidden = true
            lastNameLabel.isHidden = true
            lastNameTxtField.isHidden = true
            loggingInBtn.setTitle("Log in", for: UIControl.State.normal)
        } else {
            loginMode = false   // register mode
            firstNameLabel.isHidden = false
            firstNameTxtField.isHidden = false
            lastNameLabel.isHidden = false
            lastNameTxtField.isHidden = false
            loggingInBtn.setTitle("Register", for: UIControl.State.normal)
        }
        
    }
    
    @IBAction func revealPassword(_ sender: UIButton) {
        if passwordHidden {
            passwordHidden = false // reveal
            sender.setImage( UIImage(systemName: "eye.fill"), for: UIControl.State.normal)
            passwordTxtField.isSecureTextEntry = false
        } else { // hidden
            passwordHidden = true
            sender.setImage(UIImage(systemName: "eye.slash.fill"), for: UIControl.State.normal)
            passwordTxtField.isSecureTextEntry = true
        }
    }
}

extension LogInViewController: UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
//        textField.resignFirstResponder()
        view.endEditing(true)
        return true
    }
    
}
