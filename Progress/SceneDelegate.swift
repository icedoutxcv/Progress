//
//  SceneDelegate.swift
//  Progress
//
//  Created by xcv on 21/11/2020.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?
    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else { return }
    
        window = UIWindow(windowScene: scene as! UIWindowScene)
        window?.windowScene = windowScene

        let navigationController = UINavigationController()
        let galleryViewController = GalleryViewController()
        navigationController.viewControllers = [galleryViewController]
    
        window?.rootViewController = navigationController
        window?.makeKeyAndVisible()
    }
    
}

