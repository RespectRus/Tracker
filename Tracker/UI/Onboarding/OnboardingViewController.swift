import UIKit

final class OnboardingViewController: UIPageViewController {
    
    // MARK: - Properties
    
    var onConfirm: (() -> Void)?
    private let pages: [UIViewController] = [
        OnboardingPageViewController(
            text: "Отслеживайте только то, что хотите",
            backgroundImage: UIImage(named: "OnboardingBlue")!
        ),
        OnboardingPageViewController(
            text: "Даже если это не литры воды и йога",
            backgroundImage: UIImage(named: "OnboardingRed")!
        )
    ]
    
    // MARK: - Layout elements
    
    private lazy var pageControl: UIPageControl = {
        let pageControl = UIPageControl()
        pageControl.translatesAutoresizingMaskIntoConstraints = false
        
        pageControl.numberOfPages = pages.count
        pageControl.currentPage = 0
        
        pageControl.currentPageIndicatorTintColor = .black
        
        return pageControl
    }()
    
    private lazy var confirmButton: UIButton = {
        let button = Button(color: .black, titleColor: .white, title: "Вот это технологии!")
        button.addTarget(self, action: #selector(didTapConfirmButton), for: .touchUpInside)
        return button
    }()
    
    
    // MARK: - ViewDidLoad
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupContent()
        setupConstraints()
    }
    
    // MARK: - Actions
    
    @objc
    private func didTapConfirmButton() {
        onConfirm?()
    }
}

// MARK: - Layout methods

private extension OnboardingViewController {
    func setupContent() {
        dataSource = self
        delegate = self
        
        if let firstPage = pages.first {
            setViewControllers(
                [firstPage],
                direction: .forward,
                animated: true
            )
        }
        
        view.addSubview(pageControl)
        view.addSubview(confirmButton)
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            confirmButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            confirmButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            confirmButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -50),
            confirmButton.heightAnchor.constraint(equalToConstant: 60),
            
            pageControl.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            pageControl.bottomAnchor.constraint(equalTo: confirmButton.topAnchor, constant: -24)
        ])
    }
}

// MARK: - UIPageViewControllerDataSource

extension OnboardingViewController: UIPageViewControllerDataSource {
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        guard let currentIndex = pages.firstIndex(of: viewController) else {
            return nil
        }
        
        let previousIndex = currentIndex - 1
        
        guard previousIndex >= 0 else {
            return nil
        }
        
        return pages[previousIndex]
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        guard let currentIndex = pages.firstIndex(of: viewController) else {
            return nil
        }
        
        let nextIndex = currentIndex + 1
        
        guard nextIndex < pages.count else {
            return nil
        }
        
        return pages[nextIndex]
    }
}

// MARK: - UIPageViewControllerDelegate

extension OnboardingViewController: UIPageViewControllerDelegate {
    func pageViewController(
        _ pageViewController: UIPageViewController,
        didFinishAnimating finished: Bool,
        previousViewControllers: [UIViewController],
        transitionCompleted completed: Bool
    ) {
        guard
            let currentViewController = pageViewController.viewControllers?.first,
            let currentIndex = pages.firstIndex(of: currentViewController)
        else { return }
        
        pageControl.currentPage = currentIndex
    }
}
