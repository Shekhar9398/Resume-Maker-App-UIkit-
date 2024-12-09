
import UIKit

class ExperienceVC: UIViewController {
    
    @IBOutlet weak var instructionLabel: UILabel!
    
    @IBOutlet weak var companyNameLbl: UILabel!
    @IBOutlet weak var companyNameTxt: UITextField!
    
    @IBOutlet weak var companyDateLbl: UILabel!
    @IBOutlet weak var companyDateTxt: UITextField!
    
    @IBOutlet weak var workDetailLbl: UILabel!
    @IBOutlet weak var workDetailTxt: UITextField!

    override func viewDidLoad() {
        super.viewDidLoad()
        setFontAndColors()
    }

    private func setFontAndColors(){
        instructionLabel.textColor = .gray
        instructionLabel.font = UIFont(name: "futura", size: 15)
        instructionLabel.text = "Please fill your college and degree Information in the related field."
        
        companyNameLbl.textColor = .systemPurple
        companyNameLbl.font = UIFont(name: "futura", size: 20)
        
        companyDateLbl.textColor = .systemPurple
        companyDateLbl.font = UIFont(name: "futura", size: 20)
        
        workDetailLbl.textColor = .systemPurple
        workDetailLbl.font = UIFont(name: "futura", size: 20)
    }
    
    //Pass Data to DownloadVC
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        SharedData.shared.compamyName = companyNameTxt.text ?? "Global Tech India, Pune"
        SharedData.shared.companyDate = companyDateTxt.text ?? "Feb23 - Dec24"
        SharedData.shared.workDetails = workDetailTxt.text ?? "an iOS Developer Intern - with 3months of experience in Swift UIkit as well as SwiftUI framewok"
    }


}
