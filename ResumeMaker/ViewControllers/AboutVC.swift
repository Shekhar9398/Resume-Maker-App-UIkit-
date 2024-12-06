
import UIKit

@available(iOS 15.0, *)
class AboutVC: UIViewController {
    @IBOutlet weak var aboutScrollView: UIScrollView!
    
    @IBOutlet weak var instructionsLbl: UILabel!
    
    @IBOutlet weak var nameLbl: UILabel!
    @IBOutlet weak var nameTxt: UITextField!
    
    @IBOutlet weak var ageLbl: UILabel!
    @IBOutlet weak var ageTxt: UITextField!
    
    @IBOutlet weak var genderLbl: UILabel!
    @IBOutlet weak var genderTxt: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setFontAndColors()
    }

   private func setFontAndColors(){
       instructionsLbl.textColor = .gray
       instructionsLbl.font = UIFont(name: "futura", size: 15)
       instructionsLbl.text = "Fill your personal information in the fleld."
       
       nameLbl.textColor = .systemPurple
       nameLbl.font = UIFont(name: "futura", size: 20)
       
       ageLbl.textColor = .systemPurple
       ageLbl.font = UIFont(name: "futura", size: 20)
       
       genderLbl.textColor = .systemPurple
       genderLbl.font = UIFont(name: "futura", size: 20)
    }
    
}
