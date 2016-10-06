//
//  CounterReducer.swift
//  Meet
//
//  Created by Benjamin Encz on 12/1/15.
//  Copyright © 2015 DigiTales. All rights reserved.
//

import Foundation
import ReSwift

func budgetReducer(action: Action, budget: Float?) -> Float? {
    var budget = budget

    switch action {
    case let action as SetBudget:
        budget = action.budget
    case let action as AddExpenses:
        budget! -= action.expenses
    default:
        break
    }

    return budget
}
