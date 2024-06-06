

import UIKit

class DetailsModalViewController: UIViewController {
    
    let tableView = UITableView()
    let contactsService = ContactsService()
    
    
    var selectedContact: UserInfo?
    var similarContacts: [UserInfo] = []
    var selectedContactCreationDate: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = Constants.Color.grayColor
        view.addSubview(tableView)
        tableView.register(DetailsModelTableCell.self, forCellReuseIdentifier: "DetailsModelTableCell")
        tableView.register(SimilarContactsTitleCell.self, forCellReuseIdentifier: "SimilarContactsTitleCell")
        tableView.register(SimilarContactsDetailsCell.self, forCellReuseIdentifier: "SimilarContactsDetailsCell")
        tableView.register(ButtonCloseCell.self, forCellReuseIdentifier: "ButtonCloseCell")
        tableView.dataSource = self
        tableView.delegate = self
        setuptableView()
        
    }

    func setuptableView() {
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.backgroundColor = Constants.Color.grayColor
        
        tableView.topAnchor.constraint(equalTo: view.topAnchor, constant: 36).isActive = true
        tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0).isActive = true
        tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0).isActive = true
    }
    
}

extension DetailsModalViewController: UITableViewDataSource, UITableViewDelegate {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2 + similarContacts.count + 1
    }
    
    
//    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        switch indexPath.row{
//        case 0:
//            let customCell = DetailsModelTableCell(style: .default, reuseIdentifier: nil)
//            
//            if let contact = selectedContact {
//                customCell.configures(contact: contact)
//            }
//            
//            return customCell
//        case 1:
//            let customCell = tableView.dequeueReusableCell(withIdentifier: "SimilarContactsTitleCell", for: indexPath) as! SimilarContactsTitleCell
//            return customCell
//        case 2:
//            let customCell = tableView.dequeueReusableCell(withIdentifier: "SimilarContactsDetailsCell", for: indexPath) as! SimilarContactsDetailsCell
//            
//            let similarContact = similarContacts[indexPath.row - 2]
//            customCell.configures(contact: similarContact)
//            
//            return customCell
//        default:
//            let customCell = tableView.dequeueReusableCell(withIdentifier: "ButtonCloseCell", for: indexPath) as! ButtonCloseCell
//            return customCell
//        }
//    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row == 0 {
            let customCell = DetailsModelTableCell(style: .default, reuseIdentifier: nil)
            if let contact = selectedContact {
                customCell.configures(contact: contact)
            }
            return customCell
        } else if indexPath.row == 1 {
            let customCell = tableView.dequeueReusableCell(withIdentifier: "SimilarContactsTitleCell", for: indexPath) as! SimilarContactsTitleCell
            return customCell
        } else if indexPath.row <= 1 + similarContacts.count {
            let customCell = tableView.dequeueReusableCell(withIdentifier: "SimilarContactsDetailsCell", for: indexPath) as! SimilarContactsDetailsCell
            let similarContact = similarContacts[indexPath.row - 2]
            customCell.configures(contact: similarContact)
            return customCell
        } else {
            let customCell = tableView.dequeueReusableCell(withIdentifier: "ButtonCloseCell", for: indexPath) as! ButtonCloseCell
            return customCell
        }
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return nil
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = UIView()
        headerView.backgroundColor = Constants.Color.grayColor
        
        let label = UILabel()
        label.text = "Основная информация"
        label.textColor = Constants.Color.grayColorHeader
        label.font = .boldSystemFont(ofSize: 15)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .left
        
        headerView.addSubview(label)
        
        NSLayoutConstraint.activate([
            label.topAnchor.constraint(equalTo: headerView.topAnchor, constant: -34),
            label.leadingAnchor.constraint(equalTo: headerView.leadingAnchor, constant: 15),
            label.trailingAnchor.constraint(equalTo: headerView.trailingAnchor, constant: -15),
            label.bottomAnchor.constraint(equalTo: headerView.bottomAnchor)
        ])
        
        return headerView
    }
    
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        let footerView = UIView()
        
        let label = UILabel()
        label.text = "Дата создания карточки:\n\(selectedContactCreationDate ?? "Unknown")"
        label.textColor = Constants.Color.grayColorHeader
        label.font = .boldSystemFont(ofSize: 15)
        label.numberOfLines = 0
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        
        footerView.addSubview(label)

        label.topAnchor.constraint(equalTo: footerView.topAnchor, constant: 27).isActive = true
        label.leadingAnchor.constraint(equalTo: footerView.leadingAnchor, constant: 15).isActive = true
        label.trailingAnchor.constraint(equalTo: footerView.trailingAnchor, constant: -15).isActive = true
        label.bottomAnchor.constraint(equalTo: footerView.bottomAnchor).isActive = true
        
        return footerView
    }

    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 10
    }
}
