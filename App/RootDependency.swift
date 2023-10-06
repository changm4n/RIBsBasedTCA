import Foundation
import Main
import MainImp
import Bridge
import BridgeImp

typealias ChildDependency = MainDependency & BridgeDependency

final class RootDependency: ChildDependency {
  
  lazy var mainBuildable: MainBuildable = MainBuilder(dependency: self)
  lazy var bridgeBuildable: BridgeBuildable = BridgeBuilder(dependency: self)
}
