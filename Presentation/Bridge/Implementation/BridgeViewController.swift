import SwiftUI
import UIKit
import CombineRIBs
import ComposableArchitecture

final class BridgeViewController: UIHostingController<BridgeView>, BridgeViewControllable {
}

struct BridgeView: View {
  let store: StoreOf<BridgeReducer>

  var body: some View {
    WithViewStore(self.store, observe: { $0 }) { viewStore in
      VStack {
        Text("SwiftUI")
        Button {
          viewStore.send(.buttonTapped)
        } label: {
          Text("Close")
        }
      }
    }
  }
}
