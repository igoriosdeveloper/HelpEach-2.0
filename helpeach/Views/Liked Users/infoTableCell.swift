import UIKit

class infoTableCell: UITableViewCell {

    
    @IBOutlet weak var cardView: UIView!
    @IBOutlet weak var personImg: UIImageView!
    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var speciality: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        
    }
    
    
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        
    }

}

