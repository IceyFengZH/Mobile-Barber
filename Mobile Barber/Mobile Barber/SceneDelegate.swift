

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?


    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        // Use this method to optionally configure and attach the UIWindow `window` to the provided UIWindowScene `scene`.
        // If using a storyboard, the `window` property will automatically be initialized and attached to the scene.
        // This delegate does not imply the connecting scene or session are new (see `application:configurationForConnectingSceneSession` instead).
        guard let _ = (scene as? UIWindowScene) else { return }
        
        // 欢迎页面 只出现一次 的方法
        if !UserDefaults.standard.bool(forKey: "isNotFirstTimeLaunch") {
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            
            window?.rootViewController = storyboard.instantiateViewController(identifier: "WelcomePageVCID")
            
            UserDefaults.standard.setValue(true, forKey: "isNotFirstTimeLaunch")
        }
        
        if UserDefaults.standard.bool(forKey: "isBarber")  {
            // 获取到Main故事版
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            // 让默认的VC 等于 故事版里面的barberVC
            window?.rootViewController = storyboard.instantiateViewController(identifier: "BarberSideVCID")
        }
        
        if UserDefaults.standard.bool(forKey: "isCustomer") {
            // 获取Main故事版
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            // 默认VC 设置为 customer VC
            window?.rootViewController = storyboard.instantiateViewController(withIdentifier: "CustomerSideVCID")
        }
        

    }

    func sceneDidDisconnect(_ scene: UIScene) {
        // Called as the scene is being released by the system.
        // This occurs shortly after the scene enters the background, or when its session is discarded.
        // Release any resources associated with this scene that can be re-created the next time the scene connects.
        // The scene may re-connect later, as its session was not necessarily discarded (see `application:didDiscardSceneSessions` instead).
    }

    func sceneDidBecomeActive(_ scene: UIScene) {
        // Called when the scene has moved from an inactive state to an active state.
        // Use this method to restart any tasks that were paused (or not yet started) when the scene was inactive.
    }

    func sceneWillResignActive(_ scene: UIScene) {
        // Called when the scene will move from an active state to an inactive state.
        // This may occur due to temporary interruptions (ex. an incoming phone call).
    }

    func sceneWillEnterForeground(_ scene: UIScene) {
        // Called as the scene transitions from the background to the foreground.
        // Use this method to undo the changes made on entering the background.
    }

    func sceneDidEnterBackground(_ scene: UIScene) {
        // Called as the scene transitions from the foreground to the background.
        // Use this method to save data, release shared resources, and store enough scene-specific state information
        // to restore the scene back to its current state.
    }


}
