
import UIKit

class ContactVC: UIViewController {
    
    @IBOutlet weak var instructionsLbl: UILabel!
    
    @IBOutlet weak var contactLbl: UILabel!
    @IBOutlet weak var contactTxt: UITextField!
    
    @IBOutlet weak var emailLbl: UILabel!
    @IBOutlet weak var emailTxt: UITextField!
    
    
    @IBOutlet weak var addressLbl: UILabel!
    @IBOutlet weak var addressTxt: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setFontAndColors()
    }
    
    private func setFontAndColors(){
        instructionsLbl.textColor = .gray
        instructionsLbl.font = UIFont(name: "futura", size: 15)
        instructionsLbl.text = "Fill your contact details in the fleld."
        
        contactLbl.textColor = .systemPurple
        contactLbl.font = UIFont(name: "futura", size: 20)
        
        emailLbl.textColor = .systemPurple
        emailLbl.font = UIFont(name: "futura", size: 20)
        
        addressLbl.textColor = .systemPurple
        addressLbl.font = UIFont(name: "futura", size: 20)
    }
    
}
