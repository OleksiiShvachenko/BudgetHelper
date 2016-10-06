//
//  BudgetActions.swift
//  BudgetHelper
//
//  Created by Oleksii Shvachenko on 03.10.16.
//  Copyright © 2016 shalex. All rights reserved.
//

import ReSwift

struct SetBudget: Action {
    let budget: Float;
}
struct AddExpenses: Action {
    let expenses: Float;
}
