import UIKit

@available(iOS 15.0, *)
enum IconSystemNames: String, CaseIterable {
    case about = "info.circle"
    case contact = "phone.circle"
    case education = "book.circle"
    case experience = "briefcase.circle"
    case skills = "hammer.circle"
    case done = "checkmark.circle"
    
    var image: UIImage? {
        return UIImage(systemName: self.rawValue)
    }
    
    var displayName: String {
        switch self {
        case .about: return "About"
        case .contact: return "Contact"
        case .education: return "Education"
        case .experience: return "Experience"
        case .skills: return "Skills"
        case .done: return "Done"
        }
    }
}

@available(iOS 15.0, *)
class DashboardVC: UIViewController {
    @IBOutlet weak var TabsCollectionView: UICollectionView!
    @IBOutlet weak var TabScrollView: UIScrollView!
    @IBOutlet weak var commonChildeView: UIView!
    @IBOutlet weak var nextBtnOutlet : UIButton!
    
    var selectedIconIndex: Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        bindCollectionView()
        
        // Initialize the view with the first icon's related VC
        if let defaultVC = UIStoryboard(name: "Main", bundle: nil)
            .instantiateViewController(withIdentifier: IconSystemNames.allCases[selectedIconIndex].displayName + "VC") as? UIViewController {
            displayContentViewController(defaultVC)
        }
    }

    // Handle Next button tap
    @IBAction func nextBtnTapped(_ sender: UIButton) {
        // Update the index to the next icon
        selectedIconIndex = (selectedIconIndex + 1) % IconSystemNames.allCases.count

            let nextIcon = IconSystemNames.allCases[selectedIconIndex]
            navigateToViewController(for: nextIcon)
        
        nextBtnOutlet.setTitle("Next", for: .normal)
        nextBtnOutlet.setTitle("Next", for: .selected)
        nextBtnOutlet.setTitle("Next", for: .highlighted)

            // Scroll to the next item in the collection view
            TabsCollectionView.scrollToItem(
                at: IndexPath(item: selectedIconIndex, section: 0),
                at: .centeredHorizontally,
                animated: true
            )
            TabsCollectionView.reloadData()
            
                        
        if selectedIconIndex == 5{
            nextBtnOutlet.setTitle("Done", for: .normal)
            nextBtnOutlet.setTitle("Done", for: .selected)
            nextBtnOutlet.setTitle("Done", for: .highlighted)
        //Write process after DoneBtn
            let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "DownloadResumeViewController") as! DownloadResumeViewController
            
            navigationController?.pushViewController(vc, animated: true)
        }
    }

    private func navigateToViewController(for icon: IconSystemNames) {
        let storyboardIDs: [IconSystemNames: String] = [
            .about: "AboutVC",
            .contact: "ContactVC",
            .education: "EducationVC",
            .experience: "ExperienceVC",
            .skills: "SkillsVC",
            .done: "DoneVC"
        ]
        
        guard let storyboardID = storyboardIDs[icon] else {
            print("Error: Storyboard ID not found for \(icon)")
            return
        }
        
        if let viewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: storyboardID) as? UIViewController {
            displayContentViewController(viewController)
        }
    }

    private func displayContentViewController(_ viewController: UIViewController) {
//         Remove existing child view controllers
        for child in children {
            child.willMove(toParent: nil)
            child.view.removeFromSuperview()
            child.removeFromParent()
        }
        
        // Add the new child view controller
        addChild(viewController)
        viewController.view.frame = commonChildeView.bounds
        commonChildeView.addSubview(viewController.view)
        viewController.didMove(toParent: self)
    }
}

@available(iOS 15.0, *)
extension DashboardVC: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    private func bindCollectionView() {
        TabsCollectionView.register(TabIconCell.nib(), forCellWithReuseIdentifier: TabIconCell.identifier)
        TabsCollectionView.delegate = self
        TabsCollectionView.dataSource = self
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return IconSystemNames.allCases.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = TabsCollectionView.dequeueReusableCell(withReuseIdentifier: TabIconCell.identifier, for: indexPath) as! TabIconCell
        
        let icon = IconSystemNames.allCases[indexPath.row]
        cell.iconImage.image = icon.image
        cell.tabName.text = icon.displayName

        // Update tint color based on the currently selected icon
        cell.iconImage.tintColor = indexPath.row == selectedIconIndex ? .black : .systemPurple
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 130, height: 130)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let selectedIcon = IconSystemNames.allCases[indexPath.row]
        navigateToViewController(for: selectedIcon)
        TabsCollectionView.reloadData()
        
        selectedIconIndex = indexPath.row
        
        if selectedIconIndex < 5 {
            nextBtnOutlet.setTitle("Next", for: .normal)
            nextBtnOutlet.setTitle("Next", for: .selected)
            nextBtnOutlet.setTitle("Next", for: .highlighted)
        } else{
                nextBtnOutlet.setTitle("Done", for: .normal)
                nextBtnOutlet.setTitle("Done", for: .selected)
                nextBtnOutlet.setTitle("Done", for: .highlighted)
                
                let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "DownloadResumeViewController") as! DownloadResumeViewController
                
                navigationController?.pushViewController(vc, animated: true)
            }

    }
}
