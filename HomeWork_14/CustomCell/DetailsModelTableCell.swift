
import Foundation
import UIKit

class DetailsModelTableCell: UITableViewCell {
    
    private var contact: UserInfo?
    
    private let userStack = UIStackView()
    private let userPhoto = UIImageView()
    private let userName = UILabel()
    private let userSurName = UILabel()
    
    private let userDetailsStack = UIStackView()
    private let iconPhone = UIImageView()
    private let iconEmail = UIImageView()
    private let iconBirthDay = UIImageView()
    private let iconCountry = UIImageView()
    
    private let userPhone = UILabel()
    private let userEmail = UILabel()
    private let userBirthDay = UILabel()
    private let userCountry = UILabel()
    
    private let userCreateStack = UIStackView()
    private let userID = UILabel()
    private let userCrateDate = UILabel()
        
    override var reuseIdentifier: String? {
        return "DetailsModelTableCell"
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupUserViews()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    // MARK: - Setup Methods
    private func setupUserViews() {
        contentView.addSubview(userStack)

        iconPhone.image = UIImage(systemName: "phone.circle.fill")
        iconEmail.image = UIImage(systemName: "envelope.circle.fill")
        iconBirthDay.image = UIImage(systemName: "gift.circle.fill")
        iconCountry.image = UIImage(systemName: "building.2.crop.circle.fill")
        
        // Тут  модель размера иконок
        [iconPhone, iconEmail, iconBirthDay, iconCountry].forEach { icon in
            icon.translatesAutoresizingMaskIntoConstraints = false
            icon.widthAnchor.constraint(equalToConstant: 20).isActive = true
            icon.heightAnchor.constraint(equalToConstant: 20).isActive = true
        }
        
        // Иконка и ФИО
        let centeredStack = UIStackView(arrangedSubviews: [userPhoto, userName, userSurName])
        centeredStack.setCustomSpacing(14, after: userPhoto)
        centeredStack.axis = .vertical
        centeredStack.alignment = .center
        centeredStack.spacing = 11
        
        // Детальная информация контакта
        userDetailsStack.axis = .vertical
        userDetailsStack.alignment = .leading
        userDetailsStack.spacing = 16
        
        // вызывает стек деталки
        userDetailsStack.addArrangedSubview(createDetailRow(icon: iconPhone, label: userPhone))
        if (contact?.email) != nil {
            userDetailsStack.addArrangedSubview(createDetailRow(icon: iconEmail, label: userEmail))
        }
        
        if (contact?.birthDateString) != nil {
            userDetailsStack.addArrangedSubview(createDetailRow(icon: iconBirthDay, label: userBirthDay))
        }
        
        if (contact?.city) != nil {
            userDetailsStack.addArrangedSubview(createDetailRow(icon: iconCountry, label: userCountry))
        }
        
        userCreateStack.axis = .vertical
        userCreateStack.alignment = .leading
        userCreateStack.spacing = 3
        userCrateDate.text = "ID пользователя"
        userCreateStack.addArrangedSubview(userCrateDate)
        userCreateStack.addArrangedSubview(userID)
//        userCreateStack.addArrangedSubview(userCrateDate)
        
        userStack.axis = .vertical
        userStack.spacing = 26
        userStack.addArrangedSubview(centeredStack)
        userStack.addArrangedSubview(userDetailsStack)
        userStack.addArrangedSubview(userCreateStack)
    }
    
    private func setupConstraints() {
        userStack.translatesAutoresizingMaskIntoConstraints = false
        
        // Констрейнты для userStack относительно contentView
        userStack.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 17).isActive = true
        userStack.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 0).isActive = true
        userStack.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: 0).isActive = true
        userStack.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -17).isActive = true
        
        userDetailsStack.leadingAnchor.constraint(equalTo: userStack.leadingAnchor, constant: 22).isActive = true
    }
    
    // метод для создания стека деталки
    private func createDetailRow(icon: UIImageView, label: UILabel) -> UIStackView {
        let rowStack = UIStackView(arrangedSubviews: [icon, label])
        rowStack.axis = .horizontal
        rowStack.spacing = 8
        return rowStack
    }
    
    func configures(contact: UserInfo) {
        self.contact = contact
        
        userName.text = contact.name
        userSurName.text = contact.surname
        userPhone.text = contact.phone
        userEmail.text = contact.email
        userBirthDay.text = contact.birthDateString
        userCountry.text = contact.city
        userID.text = contact.id
        userPhoto.image = UIImage(named: contact.imageName)

        // Скрываем строки, если данные отсутствуют
        iconPhone.isHidden = contact.phone?.isEmpty ?? true
        userPhone.isHidden = contact.phone?.isEmpty ?? true
        iconEmail.isHidden = contact.email?.isEmpty ?? true
        userEmail.isHidden = contact.email?.isEmpty ?? true
        iconBirthDay.isHidden = contact.birthDateString.isEmpty
        userBirthDay.isHidden = contact.birthDateString.isEmpty
        iconCountry.isHidden = contact.city?.isEmpty ?? true
        userCountry.isHidden = contact.city?.isEmpty ?? true
        userID.isHidden = contact.id.isEmpty
        userPhoto.isHidden = (contact.imageName).isEmpty
    }
}
