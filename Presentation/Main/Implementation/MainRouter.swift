import CombineRIBs
import Bridge

protocol MainInteractable: Interactable, BridgeListener {
  var router: MainRouting? { get set }
}

protocol MainViewControllable: ViewControllable {
  
}

protocol MainRouterDependency {
  var bridgeBuildable: BridgeBuildable { get }
}

final class MainRouter: LaunchRouter<MainInteractable, MainViewControllable>, MainRouting {
  
  private let dependency: MainRouterDependency
  private var routing: ViewableRouting?
  
  init(interactor: MainInteractable, viewController: MainViewControllable, dependency: MainRouterDependency) {
    self.dependency = dependency
    super.init(interactor: interactor, viewController: viewController)
    interactor.router = self
  }
  
  func attachBridge() {
    if routing != nil { return }
    let router = self.dependency.bridgeBuildable.build(withListener: interactor)
    router.viewControllable.ui.isModalInPresentation = true
    self.viewControllable.presentViewControllable(router.viewControllable, animated: true)
    self.routing = router
    self.attachChild(router)
  }
  
  func detachBridge() {
    guard let router = routing else { return }
    self.viewControllable.dismissViewControllableIfNeeded(router.viewControllable, animated: true)
    self.detachChild(router)
    self.routing = nil
  }
}
