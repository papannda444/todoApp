//
//  ViewController.swift
//  TodoApp
//
//  Created by 三野田脩 on 2018/09/22.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
  
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    if let todoList = UserDefaults.standard.array(forKey: "todoList") {
      return todoList.count
    }
    return 1
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let todoCell: UITableViewCell = tableView.dequeueReusableCell(withIdentifier: "TodoCell", for: indexPath)
    if let todoTexts = UserDefaults.standard.stringArray(forKey: "todoList") {
      todoCell.textLabel?.text = todoTexts[indexPath.row]
    } else {
      todoCell.textLabel?.text = "Todoを登録しよう！！！"
    }
    return todoCell
  }

  override func viewDidLoad() {
    super.viewDidLoad()
  }


}

