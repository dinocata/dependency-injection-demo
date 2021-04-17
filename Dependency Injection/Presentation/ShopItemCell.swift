import UIKit

final class ShopItemCell: UITableViewCell {
    
    private lazy var itemLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 16, weight: .semibold)
        label.numberOfLines = 2
        return label
    }()
    
    private lazy var priceLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 14, weight: .regular)
        label.numberOfLines = 1
        return label
    }()
    
    private lazy var checkmarkView: UIImageView = {
        let imageView = UIImageView(image: .checkmark)
        imageView.isHidden = true
        return imageView
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        // Do nothing
    }
    
    override func setHighlighted(_ highlighted: Bool, animated: Bool) {
        // Do nothing
    }
    
    private func setupView() {
        contentView.addSubview(itemLabel)
        contentView.addSubview(priceLabel)
        contentView.addSubview(checkmarkView)
        
        itemLabel.snp.makeConstraints { make in
            make.top
                .equalToSuperview()
                .offset(8)
            
            make.left
                .equalToSuperview()
                .offset(16)
            
            make.right
                .equalTo(checkmarkView.snp.left)
                .offset(-8)
        }
        
        priceLabel.snp.makeConstraints { make in
            make.top
                .equalTo(itemLabel.snp.bottom)
                .offset(4)
            
            make.left
                .equalTo(itemLabel.snp.left)
            
            make.right
                .equalTo(itemLabel.snp.right)
        }
        
        checkmarkView.snp.makeConstraints { make in
            make.centerY
                .equalToSuperview()
            
            make.size
                .equalTo(CGSize(width: 24, height: 24))
            
            make.right
                .equalToSuperview()
                .offset(-16)
        }
    }
}

extension ShopItemCell: Configurable {
    
    func configure(with data: Product) {
        self.itemLabel.text = data.name
        self.priceLabel.text = data.pricePerKg.formatPrice
    }
    
    func setChecked(_ checked: Bool) {
        self.checkmarkView.isHidden = !checked
    }
}
