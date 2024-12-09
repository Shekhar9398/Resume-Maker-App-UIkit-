
import UIKit

enum ResumeFonts: String {
    case helvetica = "Helvetica"
    case helveticaBold = "Helvetica-Bold"
    case timesNewRoman = "TimesNewRomanPSMT"
    case timesNewRomanBold = "TimesNewRomanPS-BoldMT"
    case avenir = "Avenir"
    case avenirBold = "Avenir-Heavy"
    case georgia = "Georgia"
    case georgiaBold = "Georgia-Bold"
    case robotoRegular = "Roboto-Regular"
    case robotoBold = "Roboto-Bold"
    case openSansRegular = "OpenSans-Regular"
    case openSansBold = "OpenSans-Bold"
    case montserratRegular = "Montserrat-Regular"
    case montserratBold = "Montserrat-Bold"
    case verdana = "verdana"

    func font(size: CGFloat) -> UIFont? {
        return UIFont(name: self.rawValue, size: size)
    }
}


@available(iOS 15.0, *)
class DownloadResumeViewController: UIViewController {

    @IBOutlet weak var headingResume: UILabel!
    
    @IBOutlet weak var dividerResume: UILabel!
    @IBOutlet weak var experienceResume: UILabel!
    @IBOutlet weak var educationResume: UILabel!
    @IBOutlet weak var skillsResume: UILabel!

    
    @IBOutlet weak var contactResume: UILabel!
    @IBOutlet weak var emailResume: UILabel!
    @IBOutlet weak var addressResume: UILabel!
    
    @IBOutlet weak var companyNameResume: UILabel!
    @IBOutlet weak var companyDateResume: UILabel!
    @IBOutlet weak var workDeatailsResume: UILabel!
    
    @IBOutlet weak var collegeNameResume: UILabel!
    @IBOutlet weak var collegeDateResume: UILabel!
    @IBOutlet weak var degreeResume: UILabel!
    @IBOutlet weak var percentageResume: UILabel!
    
    @IBOutlet weak var skillListResume: UILabel!
    
    @IBOutlet weak var downloadResumeBtn: UIButton!
    
    var mySkills = ["xcode", "swift", "swiftUI", "firebase", "storyboard", "UIkit", "coredata", "frameworks"]
    
    var recieveSkillsData : String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setColorsAndFonts()
        addInfoInResume()
    }
    
    private func setColorsAndFonts(){
        //Resume title
        headingResume.textColor = .systemTeal
        headingResume.font = UIFont(name: ResumeFonts.georgiaBold.rawValue , size: 25)
        
        dividerResume.textColor = .systemOrange
        
        //heading
        experienceResume.textColor = .systemTeal
        experienceResume.font = UIFont(name: ResumeFonts.georgia.rawValue, size: 20)
        educationResume.textColor = .systemTeal
        educationResume.font = UIFont(name: ResumeFonts.georgia.rawValue, size: 20)
        skillsResume.textColor = .systemTeal
        skillsResume.font = UIFont(name: ResumeFonts.georgia.rawValue, size: 20)
        
        //About info
        contactResume.textColor = .gray
        contactResume.font = UIFont(name: ResumeFonts.verdana.rawValue, size: 10)
        emailResume.textColor = .gray
        emailResume.font = UIFont(name: ResumeFonts.verdana.rawValue, size: 10)
        addressResume.textColor = .gray
        addressResume.font = UIFont(name: ResumeFonts.verdana.rawValue, size: 10)
        
        //Subheading
        companyNameResume.textColor = .black
        companyNameResume.font = UIFont(name: ResumeFonts.verdana.rawValue, size: 12)
        companyNameResume.font = .boldSystemFont(ofSize: 12)
        companyNameResume.font = .italicSystemFont(ofSize: 12)
        
        companyDateResume.textColor = .black
        companyDateResume.font = UIFont(name: ResumeFonts.verdana.rawValue, size: 12)
        companyDateResume.font = .boldSystemFont(ofSize: 12)
        companyDateResume.font = .italicSystemFont(ofSize: 12)
        
        collegeNameResume.textColor = .black
        collegeNameResume.font = UIFont(name: ResumeFonts.verdana.rawValue, size: 12)
        collegeNameResume.font = .boldSystemFont(ofSize: 12)
        collegeNameResume.font = .italicSystemFont(ofSize: 12)
        
        collegeDateResume.textColor = .black
        collegeDateResume.font = UIFont(name: ResumeFonts.verdana.rawValue, size: 12)
        collegeDateResume.font = .boldSystemFont(ofSize: 12)
        collegeDateResume.font = .italicSystemFont(ofSize: 12)
        
        //Details
        workDeatailsResume.textColor = .darkGray
        workDeatailsResume.font = UIFont(name: ResumeFonts.verdana.rawValue, size: 12)
        
        degreeResume.textColor = .darkGray
        degreeResume.font = UIFont(name: ResumeFonts.verdana.rawValue, size: 12)
        
        percentageResume.textColor = .darkGray
        percentageResume.font = UIFont(name: ResumeFonts.verdana.rawValue, size: 12)
        
        skillListResume.textColor = .darkGray
        skillListResume.font = UIFont(name: ResumeFonts.verdana.rawValue, size: 12)
    }

    func addInfoInResume(){
        
        //heading
        headingResume.text = SharedData.shared.name!.uppercased()
        
        //about
        contactResume.text = "Contact : " + SharedData.shared.contact!
        emailResume.text = "Email : " + SharedData.shared.email!
        addressResume.text = "Adress : " + SharedData.shared.address!
        
        //Education details
        collegeNameResume.text = SharedData.shared.collegeName!
        collegeDateResume.text = SharedData.shared.collegeDate!
        degreeResume.text = SharedData.shared.degree!
        percentageResume.text = SharedData.shared.percentage! + "%"
        
        //work details
        companyNameResume.text = SharedData.shared.compamyName!
        companyDateResume.text = SharedData.shared.companyDate!
        workDeatailsResume.text = SharedData.shared.workDetails!
   
        //Skill List
        for skill in SharedData.shared.skills!{
            skillListResume.text! += " * " + "\(skill)" + "\n"
        }
    }
    

    @IBAction func downloadButtonTapped(_ sender: UIButton) {
        // Export the current view controller as a PDF, excluding the download button
        guard let pdfURL = self.exportToPDF(hideViews: [sender]) else {
            print("Failed to generate PDF")
            return
        }

        // Present the document picker for the user to save or share the PDF
        let documentPicker = UIDocumentPickerViewController(forExporting: [pdfURL])
        documentPicker.delegate = self
        present(documentPicker, animated: true, completion: nil)
    }

    }

@available(iOS 15.0, *)
extension DownloadResumeViewController: UIDocumentPickerDelegate {
        func documentPickerWasCancelled(_ controller: UIDocumentPickerViewController) {
            print("Document picker was cancelled")
        }
    }


