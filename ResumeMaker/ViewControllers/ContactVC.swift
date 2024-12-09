
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
    
    //Pass Data to DownloadVC
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        SharedData.shared.contact = contactTxt.text ?? "7075849328"
        SharedData.shared.email = emailTxt.text ?? "johnDoe.global@gmail.com"
        SharedData.shared.address = addressTxt.text ?? "Seasons Street, SangamWadi, Baner, Pune 444108"
    }
}
