
import UIKit

class TabIconCell: UICollectionViewCell {

    @IBOutlet weak var iconImage: UIImageView!
    
    @IBOutlet weak var tabName: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    static let identifier = "TabIconCell"
    
    static func nib() -> UINib{
        return UINib(nibName: "TabIconCell", bundle: nil)
    }

}
