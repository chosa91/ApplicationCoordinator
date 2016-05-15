//
//  ItemsListController.swift
//  ApplicationCoordinator
//
//  Created by Andrey Panov on 23/04/16.
//  Copyright © 2016 Andrey Panov. All rights reserved.
//

import UIKit

class ItemsListController: UIViewController, ItemsFlowOutput {
    
    //controller handler
    var itemDidSelected: (ItemList -> ())?
    var onTapCreateButton: (() -> ())?
    
    @IBOutlet weak var tableView: UITableView!
    //mock datasource
    var items = (0...10).map { index in return ItemList(title: "Item № \(index)", subtitle: "Item descripton") }

    override func viewDidLoad() {
        super.viewDidLoad()

        title = "Items"
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .Add, target: self, action: #selector(ItemsListController.addItemButtonClicked(_:)))
    }
    
    @IBAction func addItemButtonClicked(sender: UIBarButtonItem) {
        onTapCreateButton?()
    }
}

extension ItemsListController: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("Cell", forIndexPath: indexPath)
        
        let item = items[indexPath.row]
        cell.textLabel?.text = item.title
        cell.detailTextLabel?.text = item.subtitle
        return cell
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        itemDidSelected?(items[indexPath.row])
    }
}
