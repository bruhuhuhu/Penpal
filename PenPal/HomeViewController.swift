//
//  HomeViewController.swift
//  PenPal
//
//  Created by hu tsun hao on 3/6/18.
//  Copyright © 2018 hu tsun hao. All rights reserved.
//

import UIKit
import Cartography

class HomeViewController: RootViewController, UITableViewDataSource, UITableViewDelegate {

    private let myArray: NSArray = ["Currently Filled 1","Currently Filled 2","Currently Filled 3"]

    var myTableView = UITableView()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        setupView()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    private func setupView() {
        styleNavBar()

        myTableView.delegate = self
        myTableView.dataSource = self
        myTableView.register(UITableViewCell.self, forCellReuseIdentifier: "MyCell")

        self.view.backgroundColor = .white
        self.view.addSubview(myTableView)
        constrain (self.view, myTableView) { container, myTableView in
            myTableView.top == container.safeAreaLayoutGuide.top
            myTableView.width == container.width
            myTableView.height == container.height

        }
    }

    private func styleNavBar() {
        let addButton = UIBarButtonItem.init(barButtonSystemItem: .add, target: nil, action: nil)
        self.navigationItem.rightBarButtonItem = addButton
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return myArray.count
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("Num: \(indexPath.row)")
        print("Value: \(myArray[indexPath.row])")
    }


    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MyCell", for: indexPath as IndexPath)
        cell.textLabel!.text = "\(myArray[indexPath.row])"
        return cell
    }

}
