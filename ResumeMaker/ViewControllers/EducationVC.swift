
import UIKit

class EducationVC: UIViewController {
    
    @IBOutlet weak var instructionLabel: UILabel!
    
    @IBOutlet weak var collegeNameLbl: UILabel!
    @IBOutlet weak var collegeNameTxl: UITextField!
    
    @IBOutlet weak var collegeDateLbl: UILabel!
    @IBOutlet weak var collegeDateTxt: UITextField!
    
    @IBOutlet weak var degreeLbl: UILabel!
    @IBOutlet weak var degreeTxt: UITextField!
    
    @IBOutlet weak var percentageLbl : UILabel!
    @IBOutlet weak var percentageTxt : UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .gray
        setFontAndColors()
    }

    private func setFontAndColors(){
        instructionLabel.textColor = .gray
        instructionLabel.font = UIFont(name: "futura", size: 15)
        instructionLabel.text = "Please fill your college and degree Information in the related field."
        
        collegeNameLbl.textColor = .systemPurple
        collegeNameLbl.font = UIFont(name: "futura", size: 20)
        
        collegeDateLbl.textColor = .systemPurple
        collegeDateLbl.font = UIFont(name: "futura", size: 20)
        
        degreeLbl.textColor = .systemPurple
        degreeLbl.font = UIFont(name: "futura", size: 20)
        
        percentageLbl.textColor = .systemPurple
        percentageLbl.font = UIFont(name: "futura", size: 20)
    }
    
    //Pass Data to DownloadVC
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        SharedData.shared.collegeName = collegeNameTxl.text ?? "M G College, Pune"
        SharedData.shared.collegeDate = collegeDateTxt.text ?? "March22 - June24"
        SharedData.shared.degree = degreeTxt.text ?? "Information Technology"
        SharedData.shared.percentage = percentageTxt.text ?? "80"
    }
}
