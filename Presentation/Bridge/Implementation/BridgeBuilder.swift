import CombineRIBs
import Bridge

public protocol BridgeDependency: Dependency {
  
}

// MARK: - Builder

public final class BridgeBuilder: Builder<BridgeDependency>, BridgeBuildable {
  
  public override init(dependency: BridgeDependency) {
    super.init(dependency: dependency)
  }
  
  public func build(withListener listener: BridgeListener) -> ViewableRouting {
    let reducer = BridgeReducer(proxy: BridgeProxy())
    let view = BridgeView(store: .init(initialState: BridgeReducer.State(),
                                       reducer: { reducer }))
    let viewController = BridgeViewController(rootView: view)
    let interactor = BridgeInteractor(presenter: reducer.proxy)
    interactor.listener = listener
    return BridgeRouter(interactor: interactor, viewController: viewController)
  }
}
