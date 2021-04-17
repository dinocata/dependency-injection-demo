import UIKit
import SnapKit

final class ShopVC: MVVMController<ShopVM> {
    
    // MARK: View definition
    private lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.register(cellType: ShopItemCell.self)
        return tableView
    }()
    
    private lazy var purchaseButton: UIBarButtonItem = {
        .init(title: "Purchase", style: .plain, target: nil, action: nil)
    }()
    
    // MARK: Stored data
    private var selectedProducts: ShopVM.SelectedProducts?
    
    override func setupView() {
        
        view.backgroundColor = .white
        navigationItem.rightBarButtonItem = purchaseButton
        
        view.addSubview(tableView)
        
        tableView.snp.makeConstraints { make in
            make.top
                .equalTo(view.safeAreaLayoutGuide.snp.top)
           
            make.left
                .equalToSuperview()
            
            make.right
                .equalToSuperview()
            
            make.bottom
                .equalToSuperview()
        }
        
        tableView.rx.setDelegate(self)
            .disposed(by: disposeBag)
        
        let initialPrice = Float(0).formatPrice ?? ""
        self.title = "Total price: \(initialPrice)"
    }
    
    override func bindInput() -> ShopVM.Input {
        .init(
            selectProduct: tableView.rx.modelSelected(Product.self).asDriver(),
            purchase: purchaseButton.rx.tap.asDriver()
        )
    }
    
    override func bindOutput(output: ShopVM.Output) {
        output.productList
            .drive(tableView.rx.items(cellIdentifier: ShopItemCell.reuseIdentifier, cellType: ShopItemCell.self)) { [weak self] (row, item, cell) in
                
                guard let self = self else {
                    return
                }
                
                cell.configure(with: item)
                cell.setChecked(self.selectedProducts?[item.id] != nil)
                
            }.disposed(by: disposeBag)
        
        output.selectedProducts
            .drive(onNext: { [weak self] selectedProducts in
                guard let self = self else {
                    return
                }
                
                self.selectedProducts = selectedProducts
                self.tableView.reloadData()
            })
            .disposed(by: disposeBag)
        
        output.totalPrice
            .drive(self.rx.title)
            .disposed(by: disposeBag)
    }
}

extension ShopVC: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 64
    }
}
