import UIKit

final class EmojiCell: UICollectionViewCell {
    static let identifier = "EmojiCell"
    
    private let emojiLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 32)
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupContent()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure(with label: String) {
        emojiLabel.text = label
    }
}

private extension EmojiCell {
    func setupContent() {
        contentView.layer.cornerRadius = 16
        contentView.layer.masksToBounds = true
        contentView.addSubview(emojiLabel)
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            emojiLabel.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            emojiLabel.centerYAnchor.constraint(equalTo: contentView.centerYAnchor)
        ])
    }
}

extension EmojiCell: SelectionCellProtocol {
    func select() {
        contentView.backgroundColor = .lightGray
    }
    
    func deselect() {
        contentView.backgroundColor = .clear
    }
}
