import CombineRIBs
import Main
import Bridge

public protocol MainDependency: Dependency {
  var bridgeBuildable: BridgeBuildable { get }
}

final class MainComponent: Component<MainDependency>, MainRouterDependency {
  var bridgeBuildable: BridgeBuildable { self.dependency.bridgeBuildable }
}

// MARK: - Builder

public final class MainBuilder: Builder<MainDependency>, MainBuildable {
  
  public override init(dependency: MainDependency) {
    super.init(dependency: dependency)
  }
  
  public func build() -> LaunchRouting {
    let component = MainComponent(dependency: self.dependency)
    let viewController = MainViewController()
    let interactor = MainInteractor(presenter: viewController)
    return MainRouter(interactor: interactor, viewController: viewController, dependency: component)
  }
}
