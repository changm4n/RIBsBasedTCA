import CombineRIBs

public protocol MainBuildable: Buildable {
  func build() -> LaunchRouting
}
