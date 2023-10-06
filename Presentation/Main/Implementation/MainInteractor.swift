import CombineRIBs
import Main

protocol MainRouting: ViewableRouting {
  func attachBridge()
  func detachBridge()
}

protocol MainPresentable: Presentable {
  var listener: MainPresentableListener? { get set }
}

final class MainInteractor: PresentableInteractor<MainPresentable>, MainInteractable, MainPresentableListener {
  
  weak var router: MainRouting?
  
  
  override init(presenter: MainPresentable) {
    super.init(presenter: presenter)
    presenter.listener = self
  }
  
  // MARK: - MainPresentableListener
  
  func buttonTapped() {
    self.router?.attachBridge()
  }
  
  func bridgeDidCancel() {
    self.router?.detachBridge()
  }
}
