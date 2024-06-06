
import UIKit

class ViewController: UIViewController {
    
    let tableView = UITableView()
    let contactsService = ContactsService()
    
    let mainTitle = Header().madeTitle(
        labelText: "Контакты",
        textColor: Constants.Color.blueColor ?? UIColor.blue,
        textFont: Constants.Fonts.systemBoldFontForTitle ?? UIFont.boldSystemFont(ofSize: 24))
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = Constants.Color.grayColor
        view.addSubview(tableView)
        view.addSubview(mainTitle)
        tableView.register(ContactTableViewCell.self, forCellReuseIdentifier: "ContactTableViewCell")
        tableView.dataSource = self
        tableView.delegate = self
        setuptableView()
        setupTitleView()
        
    }

    func setuptableView() {
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.backgroundColor = Constants.Color.grayColor
        
        tableView.topAnchor.constraint(equalTo: mainTitle.topAnchor, constant: 36).isActive = true
        tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 17).isActive = true
        tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -17).isActive = true
    }
    
    func setupTitleView() {
        mainTitle.translatesAutoresizingMaskIntoConstraints = false
        
        mainTitle.topAnchor.constraint(equalTo: view.topAnchor, constant: 70).isActive = true
        mainTitle.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
    }
    
}

extension ViewController: UITableViewDataSource, UITableViewDelegate {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        let keys = contactsService.getKeys()
        return keys.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let key = contactsService.getKeys()[section]
        let contacts = contactsService.getContacts(by: key)
        return contacts.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let nativeCell = tableView.dequeueReusableCell(withIdentifier: "ContactTableViewCell", for: indexPath) as! ContactTableViewCell
        
        let key = contactsService.getKeys()[indexPath.section]
        let contact = contactsService.getContacts(by: key)[indexPath.row]
        
        nativeCell.configure(contact: contact)
        
        return nativeCell
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        let key = contactsService.getKeys()[section]
        
        return key
    }
    
    func tableView(_ tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int) {
        if let header = view as? UITableViewHeaderFooterView {
            header.contentView.backgroundColor = Constants.Color.grayColor
        }
    }
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        
        let cornerRadius: CGFloat = 10.0
        let backgroundView = UIView()
        backgroundView.backgroundColor = .white
        cell.backgroundView = backgroundView

        let maskLayer = CAShapeLayer()
        let bounds = cell.bounds.insetBy(dx: 0, dy: 0)
        var bezierPath: UIBezierPath
        
        if indexPath.row == 0 && indexPath.row == tableView.numberOfRows(inSection: indexPath.section) - 1 {
            // Единственная ячейка в секции
            bezierPath = UIBezierPath(roundedRect: bounds, byRoundingCorners: [.allCorners], cornerRadii: CGSize(width: cornerRadius, height: cornerRadius))
        } else if indexPath.row == 0 {
            // Первая ячейка в секции
            bezierPath = UIBezierPath(roundedRect: bounds, byRoundingCorners: [.topLeft, .topRight], cornerRadii: CGSize(width: cornerRadius, height: cornerRadius))
        } else if indexPath.row == tableView.numberOfRows(inSection: indexPath.section) - 1 {
            // Последняя ячейка в секции
            bezierPath = UIBezierPath(roundedRect: bounds, byRoundingCorners: [.bottomLeft, .bottomRight], cornerRadii: CGSize(width: cornerRadius, height: cornerRadius))
        } else {
            // Ячейка в середине секции
            bezierPath = UIBezierPath(rect: bounds)
        }
        
        maskLayer.path = bezierPath.cgPath
        cell.layer.mask = maskLayer
        cell.layer.masksToBounds = true
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let detailsVC = DetailsModalViewController()
        
        let key = contactsService.getKeys()[indexPath.section]
        let contact = contactsService.getContacts(by: key)[indexPath.row]

        detailsVC.selectedContact = contact
        detailsVC.similarContacts = contactsService.getContacts(by: key)
        detailsVC.selectedContactCreationDate = contact.infoCreationDate
        show(detailsVC, sender: self)
    }

}
