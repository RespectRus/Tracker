import UIKit

final class TrackerButton: UIButton {

    init(frame: CGRect, title: String) {
        super.init(frame: frame)
        setupView(title: title)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupView(title: String) {
        translatesAutoresizingMaskIntoConstraints = false
        setTitle(title, for: .normal)
        backgroundColor = .black
        titleLabel?.font = UIFont.ypMediumSize16
        setTitleColor(.white, for: .normal)
        layer.cornerRadius = Constants.cornerRadius
    }
}
