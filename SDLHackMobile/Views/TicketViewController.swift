//
//  TicketViewController.swift
//  SDLHackMobile
//
//  Created by Bryan Norden on 9/11/18.
//  Copyright © 2018 Bryan Norden. All rights reserved.
//

import UIKit

final class TicketViewController: UIViewController {
    
    @IBOutlet private weak var noPassesImageView: UIImageView! {
        
        didSet {
            noPassesImageView.isHidden = false
        }
    }
    
    @IBOutlet private weak var tableView: UITableView!
    
    private var items: [PurchaseItem] = []
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        items = [PurchaseItem(title: "Lakers Game", dateString: "September 13, 2018", location: "LA Live", price: 30, image: UIImage(named: "lakersImage")!)]
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            self.tableView.insertRows(at: [IndexPath(row: 0, section: 0)], with: .top)
            
            self.tableView.beginUpdates()
            self.noPassesImageView.isHidden = true
            self.tableView.endUpdates()
            
//            self.tableView.reloadData()
        }
    }
    
}

// MARK: - UITableViewDataSource

extension TicketViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "itemCell", for: indexPath) as! PurchaseItemTableViewCell
        
        let item = items[indexPath.row]
        
        cell.configure(item)
        
        return cell
        
    }
    
}

// MARK: - UITableViewDelegate

extension TicketViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 246
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 0.0001
    }
    
}
