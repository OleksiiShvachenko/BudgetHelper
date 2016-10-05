//
//  CounterReducer.swift
//  Meet
//
//  Created by Benjamin Encz on 12/1/15.
//  Copyright © 2015 DigiTales. All rights reserved.
//

import Foundation
import ReSwift

func budgetReducer(action: Action, budget: Int?) -> Int {
    var budget = budget ?? 0

    switch action {
    case _ as CounterActionIncrease:
        budget += 1
    case _ as CounterActionDecrease:
        budget -= 1
    default:
        break
    }

    return budget
}
