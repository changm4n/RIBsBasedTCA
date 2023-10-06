import UIKit
import CombineRIBs
import TinyConstraints

protocol MainPresentableListener: AnyObject {
  func buttonTapped()
}

final class MainViewController: UIViewController, MainPresentable, MainViewControllable {

  weak var listener: MainPresentableListener?
  
  override func viewDidLoad() {
    super.viewDidLoad()
    self.view.backgroundColor = .white
    
    self.setupViews()
  }
  
  private func setupViews() {
    let label = UILabel()
    label.text = "UIKit"
    self.view.addSubview(label)
    label.centerInSuperview(offset: .init(x: 0, y: -100))
    
    let button: UIButton = .init(configuration: .plain())
    button.addAction(.init(handler: { [weak self] _ in
      self?.listener?.buttonTapped()
    }), for: .touchUpInside)
    button.setTitle("Attach Bridge", for: .normal)
    self.view.addSubview(button)
    button.centerInSuperview()
  }
}
