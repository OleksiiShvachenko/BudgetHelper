//
//  Routes.swift
//  SwiftFlowGitHubBrowser
//
//  Created by Benji Encz on 1/5/16.
//  Copyright © 2016 Benji Encz. All rights reserved.
//

import UIKit
import ReSwiftRouter

let createBudgetRoute: RouteElementIdentifier = "CreateBudget"
let dashboardRoute: RouteElementIdentifier = "Dashboard"
//let mainViewRoute: RouteElementIdentifier = "Main"
//let bookmarkRoute: RouteElementIdentifier = "BookMark"
//let repositoryDetailRoute: RouteElementIdentifier = "RepositoryDetail"

private let storyboard = UIStoryboard(name: "Main", bundle: nil)

private let budgetEditViewControllerIdentifier = "Budget Edit"

class RootRoutable: Routable {

    let window: UIWindow

    init(window: UIWindow) {
        self.window = window
    }

    func setToCreateBudgetViewController() -> Routable {
        self.window.rootViewController = storyboard.instantiateViewController(withIdentifier: budgetEditViewControllerIdentifier)

        return CreateBudgetRoutable(self.window.rootViewController!)
    }

    func setToDashboardViewController() -> Routable {
        let dashboard = storyboard.instantiateInitialViewController() as! DashboardTabBarController
        self.window.rootViewController = dashboard

        return dashboard
    }

    func changeRouteSegment(
        _ from: RouteElementIdentifier,
        to: RouteElementIdentifier,
        animated: Bool,
        completionHandler: @escaping RoutingCompletionHandler) -> Routable {
        
        if to == createBudgetRoute {
            completionHandler()
            return self.setToCreateBudgetViewController()
        } else if to == dashboardRoute {
            completionHandler()
            return self.setToDashboardViewController()
        } else {
            fatalError("Route not supported!")
        }
    }
    
    func pushRouteSegment(
        _ routeElementIdentifier: RouteElementIdentifier,
        animated: Bool,
        completionHandler: @escaping RoutingCompletionHandler) -> Routable {
        
        if routeElementIdentifier == createBudgetRoute {
            completionHandler()
            return self.setToCreateBudgetViewController()
        } else if routeElementIdentifier == dashboardRoute {
            completionHandler()
            return self.setToDashboardViewController()
        } else {
            fatalError("Route not supported!")
        }
    }
}

class CreateBudgetRoutable: Routable {
    let viewController: UIViewController
    
    init(_ viewController: UIViewController) {
        self.viewController = viewController
    }
    
    func pushRouteSegment(
        _ routeElementIdentifier: RouteElementIdentifier,
        animated: Bool,
        completionHandler: @escaping RoutingCompletionHandler) -> Routable {

        fatalError("Router could not proceed.")
    }
    
    func popRouteSegment(
        _ routeElementIdentifier: RouteElementIdentifier,
        animated: Bool,
        completionHandler: @escaping RoutingCompletionHandler) {
    }
}

class DashboardTabBarController: UITabBarController, Routable, UITabBarControllerDelegate {

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.delegate = self
    }
    
    func tabBarController(_ shouldSelecttabBarController: UITabBarController,
                          shouldSelect viewController: UIViewController) -> Bool {
//        
//        if viewController is CounterViewController {
//            mainStore.dispatch(
//                SetRouteAction(["TabBarViewController", CounterViewController.identifier])
//            )
//        } else if viewController is StatsViewController {
//            mainStore.dispatch(
//                SetRouteAction(["TabBarViewController", StatsViewController.identifier])
//            )
//        }
        
        return false
    }
}
