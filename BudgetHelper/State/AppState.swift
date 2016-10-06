//
//  AppState.swift
//  Meet
//
//  Created by Benjamin Encz on 12/1/15.
//  Copyright © 2015 DigiTales. All rights reserved.
//

import ReSwift
import ReSwiftRouter

struct AppState: StateType, HasNavigationState {
    var budget: Float? = nil
    var navigationState: NavigationState
}
