
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
}


@available(iOS 15.0, *)
class DashboardVC: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {

    @IBOutlet weak var TabsCollectionView: UICollectionView!
    
    @IBOutlet weak var TabScrollView: UIScrollView!
    
    @IBOutlet weak var GenericTabContainer: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        bindCollectionView()
    }
    
    private func bindCollectionView(){
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
        cell.iconImage.tintColor = .systemMint
        
        cell.tabName.text = "\(icon)"
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 130, height: 130)
    }
 
}
