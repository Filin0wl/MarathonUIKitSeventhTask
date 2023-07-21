import UIKit

class ViewController: UIViewController, UIScrollViewDelegate {

    private let imageHeight: CGFloat = 270

    private lazy var scrollView: UIScrollView = {
        var scrollView = UIScrollView()
        scrollView.contentSize = CGSize(width: view.bounds.width, height: 1500)
        scrollView.contentInsetAdjustmentBehavior = .never
        scrollView.backgroundColor = .white
        scrollView.delegate = self
        return scrollView
    }()

    private lazy var imageView: UIImageView = {
        let imageView = UIImageView(image: UIImage(named: "image"))
        imageView.frame = CGRect(origin: .zero, size: .init(width: view.bounds.size.width, height: imageHeight))
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        return imageView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view = scrollView
        scrollView.addSubview(imageView)
    }

    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let height = imageHeight - scrollView.contentOffset.y
        imageView.frame = CGRect(x: 0, y: scrollView.contentOffset.y, width: view.bounds.size.width, height: height)
        let topInset = max(height, imageHeight) - view.safeAreaInsets.top
        scrollView.verticalScrollIndicatorInsets = .init(top: topInset, left: 0, bottom: 0, right: 0)
    }
}
