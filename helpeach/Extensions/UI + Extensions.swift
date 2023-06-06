import UIKit

extension UIView {
    @IBInspectable var cornerRadius: CGFloat {
        get {return self.cornerRadius}
        set {
            self.layer.cornerRadius = newValue
        }
    }
    
}


extension UIColor {
    static var randomColor: UIColor {
        let red = CGFloat(drand48())
        let green = CGFloat(drand48())
        let blue = CGFloat(drand48())
        return UIColor(red: red, green: green, blue: blue, alpha: 1.0)
    }
}

