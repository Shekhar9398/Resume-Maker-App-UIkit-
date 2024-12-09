
import UIKit

class SkillsVC: UIViewController {
    
    @IBOutlet weak var instructionsLbl: UILabel!
    
    @IBOutlet weak var skillLbl : UILabel!
    @IBOutlet weak var skillTxt : UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setFontAndColors()
    }
    
    private func setFontAndColors(){
        instructionsLbl.textColor = .gray
        instructionsLbl.font = UIFont(name: "futura", size: 15)
        instructionsLbl.text = "Fill your personal information in the fleld."
        
        skillLbl.textColor = .systemPurple
        skillLbl.font = UIFont(name: "futura", size: 20)
    }
    
    //Pass Data to DownloadVC
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        // Check if the text field contains valid data
        if let skillsText = skillTxt.text, !skillsText.isEmpty {
            // Initialize skills array if nil
            if SharedData.shared.skills == nil {
                SharedData.shared.skills = []
            }
            
            // Split the text into an array and append skills
            let skillsArray = skillsText.components(separatedBy: ", ")
            SharedData.shared.skills?.append(contentsOf: skillsArray)
        }
    }

    
}
