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

    //何も登録されていなければ変数の最初に値を代入
    if var todoList = UserDefaults.standard.stringArray(forKey: "todoList") {
      todoList.append(todoText)
    } else {
      todoList[0] = todoText
    }
    UserDefaults.standard.set(todoList, forKey: "todoList")

  }

  override func viewDidLoad() {
    super.viewDidLoad()
  }

  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
  }

}
