import CombineRIBs
import Bridge
import ComposableArchitecture

protocol BridgeReducable: Presentable {
  var listener: BridgeReducableListener? { get set }
}

final class BridgeInteractor: PresentableInteractor<BridgeReducable>, BridgeInteractable, BridgeReducableListener {
  
  weak var listener: BridgeListener?
  
  
  override init(presenter: BridgeReducable) {
    super.init(presenter: presenter)
    presenter.listener = self
  }
  
  // MARK: - BridgePresentableListener
  
  func presentableRemoved() {
    self.listener?.bridgeDidCancel()
  }
}

protocol BridgeReducableListener: AnyObject {
  func presentableRemoved()
}

final class BridgeProxy: BridgeReducable {
  weak var listener: BridgeReducableListener?
}

struct BridgeReducer: Reducer {
  let proxy: BridgeReducable
  
  struct State: Equatable {
    
  }

  enum Action: Equatable {
    case buttonTapped
  }

  func reduce(into state: inout State, action: Action) -> Effect<Action> {
    switch action {
    case .buttonTapped:
      self.proxy.listener?.presentableRemoved()
      return .none
    }
  }
}
