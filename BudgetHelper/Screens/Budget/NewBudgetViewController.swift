//
//  NewBudgetViewController.swift
//  BudgetHelper
//
//  Created by Oleksii Shvachenko on 05.10.16.
//  Copyright © 2016 shalex. All rights reserved.
//

import UIKit
import ReSwift

extension NewBudgetViewController {
    struct ViewModel {
        let title: String
        let currencySumbol: String
        let enterText: (String) -> Void
        let saveAction: () -> Void
        
        init(state: AppState) {
            if state.budget != nil {
                title = "Set new Budget:"
            } else {
                title = "Add expenses:"
            }
            currencySumbol = NSLocale.current.currencySymbol!
            saveAction = {
                
            }
            enterText = { text in
            }
        }
    }
}

class NewBudgetViewController: UIViewController, StoreSubscriber {
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var expenseTextFiled: UITextField!
    
    var viewModel: ViewModel! {
        didSet {
            render()
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        store.subscribe(self, selector: ViewModel.init)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        store.unsubscribe(self)
    }
    
    func newState(state: ViewModel) {
        viewModel = state
    }

    func render() {
        titleLabel.text = viewModel.title;
        expenseTextFiled.placeholder = viewModel.currencySumbol
    }
    
    @IBAction func textFieldDidEdit(_ sender: UITextView) {
        viewModel.enterText(sender.text)
    }
    
    @IBAction func didPressOnSave(_ sender: AnyObject) {
        viewModel.saveAction()
    }
}
