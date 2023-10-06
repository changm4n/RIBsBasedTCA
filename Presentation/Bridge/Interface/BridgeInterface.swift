import CombineRIBs

public protocol BridgeListener: AnyObject {
  func bridgeDidCancel()
}

public protocol BridgeBuildable: Buildable {
  func build(withListener listener: BridgeListener) -> ViewableRouting
}
