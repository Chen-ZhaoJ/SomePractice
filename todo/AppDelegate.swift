//
//  AppDelegate.swift
//  todo
//
//  Created by Zhaojie CHEN(陳昭潔) on 2022/7/7.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {


#if DEVELOPMENT
let SERVER_URL = "http://dev.server.com/api/"
let API_TOKEN = "DI2023409jf90ew"
#else
let SERVER_URL = "http://prod.server.com/api/"
let API_TOKEN = "71a629j0f090232"
#endif
    public struct ServicesURL {
        static var baseurl: String {
            return (Bundle.main.infoDictionary?["API_URL"] as? String)?.replacingOccurrences(of: "\\", with: "") ?? ""
        }
    }
    func test(){
        print("\(SERVER_URL)")
        print("\(ServicesURL.baseurl)")
    }
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        return true
    }

    // MARK: UISceneSession Lifecycle

    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        // Called when a new scene session is being created.
        // Use this method to select a configuration to create the new scene with.
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }

    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
        // Called when the user discards a scene session.
        // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
        // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
    }


}

