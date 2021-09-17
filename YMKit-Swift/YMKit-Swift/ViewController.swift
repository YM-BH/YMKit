//
//  ViewController.swift
//  YMKit-Swift
//
//  Created by 白晗 on 2021/9/17.
//

import UIKit

class ViewController: UIViewController {
    let tableView = UITableView()

    let datas = [
        ["name": "Log输出", "type": 0, "controllerName": "LogViewController"],
        ["name": "xxxx", "type": 1, "controllerName": "xxxx"],
        ["name": "xxxx", "type": 2, "controllerName": "xxxx"],
    ]

    override func viewDidLoad() {
        super.viewDidLoad()

        setupUI()
        loadData()
    }

    private func loadData() {
        printLog(datas)
    }

    private func setupUI() {
        tableView.frame = view.bounds
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        view.addSubview(tableView)
    }
}

// MARK: - UITableViewDataSource, UITableViewDelegate

extension ViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return datas.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)

        cell.textLabel?.text = datas[indexPath.row]["name"] as? String

        return cell
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let vc = LogViewController()
        navigationController?.pushViewController(vc, animated: true)
    }
}
