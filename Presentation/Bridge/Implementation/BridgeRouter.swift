import CombineRIBs
import Bridge

protocol BridgeInteractable: Interactable {
  var listener: BridgeListener? { get set }
}

protocol BridgeViewControllable: ViewControllable {
  
}

final class BridgeRouter: ViewableRouter<Interactable, BridgeViewControllable> {
  
  override init(interactor: Interactable, viewController: BridgeViewControllable) {
    super.init(interactor: interactor, viewController: viewController)
  }
}
