import UIKit
import CombineRIBs

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
  
  let rootDependency: RootDependency = RootDependency()
  var launchRouter: LaunchRouting?
  var window: UIWindow?

  func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
    let launchRouter = self.rootDependency.mainBuildable.build()
    let window = UIWindow(frame: UIScreen.main.bounds)
    launchRouter.launch(from: window)
    self.window = window
    self.launchRouter = launchRouter
    return true
  }
}

