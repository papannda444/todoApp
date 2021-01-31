//
//  TodoAddPresenter.swift
//  TodoApp
//
//  Created by papannda444 on 2021/01/31.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    var window: UIWindow?

    func application(_ application: UIApplication,
                     didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        let todoListViewController = UIStoryboard(name: "TodoListViewController",
                                                  bundle: nil)
            .instantiateInitialViewController() as! TodoListViewController
        let navigationController = UINavigationController(rootViewController: todoListViewController)

        let presenter = TodoListPresenter(view: todoListViewController)
        todoListViewController.inject(presenter: presenter)

        window = UIWindow(frame: UIScreen.main.bounds)
        window?.rootViewController = navigationController
        window?.makeKeyAndVisible()

        return true
    }
}
