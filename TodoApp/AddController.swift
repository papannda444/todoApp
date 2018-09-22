//
//  AddController.swift
//  TodoApp
//
//  Created by 三野田脩 on 2018/09/22.
//

import UIKit

class AddController: UIViewController {
  
  @IBOutlet weak var todoTextField: UITextField!
  var todoList: [String] = []
  
  @IBAction func todoAddButton(_ sender: Any) {
    //何も入力されていなければ処理しない
    guard let todoText = todoTextField.text else {
      return
    }
    if todoText == "" {
      return
    }
    todoTextField.text = ""
    
    //何も登録されていなければUDに値を直接代入
    if var todoList = UserDefaults.standard.stringArray(forKey: "todoList") {
      todoList.append(todoText)
      UserDefaults.standard.set(todoList, forKey: "todoList")
    } else {
      UserDefaults.standard.set([todoText], forKey: "todoList")
    }
    
  }

  override func viewDidLoad() {
    super.viewDidLoad()
  }

  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
  }

}
