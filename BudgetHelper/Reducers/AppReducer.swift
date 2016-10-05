//
//  AppReducer.swift
//  BudgetHelper
//
//  Created by Oleksii Shvachenko on 05.10.16.
//  Copyright © 2016 shalex. All rights reserved.
//

import ReSwift
import ReSwiftRouter

struct AppReducer: Reducer {
    
    func handleAction(action: Action, state: AppState?) -> AppState {
        return AppState(
            budget: budgetReducer(action: action, budget: state?.budget),
            navigationState: NavigationReducer.handleAction(action, state: state?.navigationState)
        )
    }
    
}
