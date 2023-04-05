import UIKit

final class ListItems: UIView {
    private let border: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .gray
        view.isHidden = true
        return view
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupeView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure(with position: Position = .middle) {
        layer.masksToBounds = true
        layer.cornerRadius = 10
        
        switch position {
            case .first:
            layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
            border.isHidden = false
        case .middle:
            layer.cornerRadius = 0
            border.isHidden = false
        case .last:
            layer.maskedCorners = [.layerMinXMaxYCorner, .layerMaxXMaxYCorner]
        case .alon:
            break
        }
    }
    
    private func setupeView() {
        translatesAutoresizingMaskIntoConstraints = false
        layer.cornerRadius = 16
        backgroundColor = .background
        addSubview(border)
        
        NSLayoutConstraint.activate([
            border.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            border.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            border.bottomAnchor.constraint(equalTo: bottomAnchor),
            border.heightAnchor.constraint(equalToConstant: 0.5)
        ])
    }
}

extension ListItems {
    enum Position {
        case first, middle, last, alon
    }
    
    static let heigth: CGFloat = 75
}
