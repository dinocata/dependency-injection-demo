import UIKit
import RxSwift

class MVVMController<ViewModel: ViewModelType>: UIViewController {
    
    private let viewModel: ViewModel = InstanceContainer.instance.resolve()
    private(set) var disposeBag = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        bindOutput(output: viewModel.transform(input: bindInput()))
    }
    
    func setupView() {
        // Override in subclass for setting up your view before binding it to the view model
    }
    
    func bindInput() -> ViewModel.Input {
        fatalError("bindInput must be implemented in subclass")
    }
    
    func bindOutput(output: ViewModel.Output) {
        fatalError("output must be implemented in subclass")
    }
}
