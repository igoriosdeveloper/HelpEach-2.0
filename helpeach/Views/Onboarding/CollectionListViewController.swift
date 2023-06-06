import UIKit

class CollectionListViewController: UIViewController {

    @IBOutlet weak var colorCollectionView: UICollectionView!
    @IBOutlet weak var configuringPagesBtn: UIButton!
    @IBOutlet weak var pageControl: UIPageControl!
    
    var slides: [OnboardingSlide] = [
            OnboardingSlide(title: "You started your help already!", description: "This is an app what's made to help, for help, HelpEach", img: UIImage(named: "first_page")!),
            OnboardingSlide(title: "Every little, make a mickle!", description: "It's a place where everyone can help with your issues, and you can help to another", img: UIImage(named: "second_page")!),
            OnboardingSlide(title: "Only honest users", description: "We checking every user who want to sign up, so here is no any bad guy))", img: UIImage(named: "third_page")!)]
    
    var currentPage = 0 {
        didSet {
            pageControl.currentPage = currentPage
            if currentPage == slides.count - 1 {
                configuringPagesBtn.setTitle("Get Started", for: .normal)
            } else {
                configuringPagesBtn.setTitle("Next", for: .normal)
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configurePageControl()
        configureCollection()
        
    }
    
    func configurePageControl(){
        pageControl.numberOfPages = slides.count
    }
    
    func configureCollection () {
        colorCollectionView.delegate = self
        colorCollectionView.dataSource = self
        if let layout = colorCollectionView.collectionViewLayout as? UICollectionViewFlowLayout {
            layout.scrollDirection = .horizontal
        }
        colorCollectionView.isPagingEnabled = true
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        if scrollView is UICollectionView {
            let currentPageNumber = scrollView.contentOffset.x / scrollView.frame.size.width
            pageControl.currentPage = Int(currentPageNumber)
        }
    }
    
    
    
    @IBAction func pageChanging(_ sender: UIPageControl) {
        let currentPage = sender.currentPage
        colorCollectionView.scrollToItem(at: IndexPath(row: currentPage, section: 0), at: .centeredHorizontally, animated: true)

    }
    
    @IBAction func nextBtn(_ sender: UIButton) {
        if currentPage == slides.count - 1 {
            let controller = storyboard?.instantiateViewController(identifier: "LogInViewController") as! UIViewController
            controller.modalPresentationStyle = .fullScreen
            controller.modalTransitionStyle = .partialCurl
            present(controller, animated: true, completion: nil)
            
        } else {
            
            currentPage += 1
            let indexPath = IndexPath(item: currentPage, section: 0)
            colorCollectionView.scrollToItem(at: indexPath, at: .centeredHorizontally, animated: true)
        }
    }
    
}

extension CollectionListViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout  {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return slides.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "collectionViewCell", for: indexPath) as! CollectionViewCell
        cell.setup(slides[indexPath.row])
        return cell
    }
        
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width, height: collectionView.frame.height)
        
        
    }
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        let width = scrollView.frame.width
        currentPage = Int(scrollView.contentOffset.x / width)
    }
    
}

