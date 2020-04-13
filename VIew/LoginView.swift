import UIKit

final class LoginView: UIView {
    let titleLabel = UILabel()
    let imageButton = UIButton()
    var nameTextField = LoginTextField()
    var dateTextField = LoginTextField()
    let sexLabel = UILabel()
    let womanButton = UIButton()
    let manButton = UIButton()
    let saveButton = UIButton()
    let stackView = UIStackView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
    }
}

private extension LoginView {
    func commonInit() {
        titleLabel.textColor = .black
        titleLabel.font = UIFont(name: "Thonburi-Bold", size: 30)
        titleLabel.text = "Новый ребенок"
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        addSubview(titleLabel)
        
        imageButton.backgroundColor = .blue
        imageButton.translatesAutoresizingMaskIntoConstraints = false
        imageButton.setTitle("Фото", for: .normal)
        imageButton.clipsToBounds = true
        imageButton.layer.cornerRadius = 65
        addSubview(imageButton)
        
        nameTextField.translatesAutoresizingMaskIntoConstraints = false
        nameTextField.backgroundColor =  #colorLiteral(red: 0.8909720778, green: 0.9101542234, blue: 0.9358072281, alpha: 1)
        nameTextField.layer.cornerRadius = 10
        nameTextField.setLeftView(text: "Имя")
        nameTextField.textAlignment = .right
        nameTextField.placeholder = "Сильвия"
        addSubview(nameTextField)
        
        dateTextField.translatesAutoresizingMaskIntoConstraints = false
        dateTextField.backgroundColor =  #colorLiteral(red: 0.8909720778, green: 0.9101542234, blue: 0.9358072281, alpha: 1)
        dateTextField.layer.cornerRadius = 10
        dateTextField.setLeftView(text: "Дата")
        dateTextField.textAlignment = .right
        dateTextField.placeholder = "Выбрать"
        addSubview(dateTextField)
        
        sexLabel.text = "Пол"
        sexLabel.translatesAutoresizingMaskIntoConstraints = false
        
        womanButton.translatesAutoresizingMaskIntoConstraints = false
        womanButton.setTitle("Девочка", for: .normal)
        womanButton.tintColor = .black
        womanButton.setTitleColor(.black, for: .normal)
        womanButton.tag = 1
        
        manButton.translatesAutoresizingMaskIntoConstraints = false
        manButton.setTitle("Мальчик", for: .normal)
        manButton.setTitleColor(.red, for: .normal)
        manButton.layer.borderWidth = 1
        manButton.layer.cornerRadius = 10
        manButton.layer.borderColor = UIColor.red.cgColor
        manButton.tag = 2
        
        stackView.addArrangedSubview(sexLabel)
        stackView.addArrangedSubview(womanButton)
        stackView.addArrangedSubview(manButton)
        stackView.axis = .horizontal
        stackView.spacing = 8
        stackView.distribution = .fillEqually
        stackView.translatesAutoresizingMaskIntoConstraints = false
        addSubview(stackView)
        
        saveButton.translatesAutoresizingMaskIntoConstraints = false
        saveButton.setTitle("СОХРАНИТЬ", for: .normal)
        saveButton.setTitleColor(.black, for: .normal)
        saveButton.backgroundColor =  #colorLiteral(red: 0.8909720778, green: 0.9101542234, blue: 0.9358072281, alpha: 1)
        saveButton.layer.cornerRadius = 10
        addSubview(saveButton)
        
        setupLayout()
    }
    
    func setupLayout() {
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: topAnchor, constant: 50),
            titleLabel.leftAnchor.constraint(equalTo: leftAnchor, constant: 10),
            rightAnchor.constraint(equalTo: titleLabel.rightAnchor, constant: 10),
            titleLabel.heightAnchor.constraint(equalToConstant: 50),
            
            imageButton.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 40),
            imageButton.centerXAnchor.constraint(equalTo: centerXAnchor, constant: 0),
            imageButton.heightAnchor.constraint(equalToConstant: 130),
            imageButton.widthAnchor.constraint(equalToConstant: 130),
            
            nameTextField.topAnchor.constraint(equalTo: imageButton.bottomAnchor, constant: 60),
            nameTextField.leftAnchor.constraint(equalTo: leftAnchor, constant: 20),
            rightAnchor.constraint(equalTo: nameTextField.rightAnchor, constant: 20),
            nameTextField.heightAnchor.constraint(equalToConstant: 50),
            
            dateTextField.topAnchor.constraint(equalTo: nameTextField.bottomAnchor, constant: 30),
            dateTextField.leftAnchor.constraint(equalTo: leftAnchor, constant: 20),
            rightAnchor.constraint(equalTo: dateTextField.rightAnchor, constant: 20),
            dateTextField.heightAnchor.constraint(equalToConstant: 50), 
            
            stackView.topAnchor.constraint(equalTo: dateTextField.bottomAnchor, constant: 50),
            stackView.leftAnchor.constraint(equalTo: leftAnchor, constant: 20),
            rightAnchor.constraint(equalTo: stackView.rightAnchor, constant: 20),
            
            saveButton.leftAnchor.constraint(equalTo: leftAnchor, constant: 20),
            rightAnchor.constraint(equalTo: saveButton.rightAnchor, constant: 20),
            bottomAnchor.constraint(equalTo: saveButton.bottomAnchor, constant: 50),
            saveButton.heightAnchor.constraint(equalToConstant: 50),
        ])
    }
}
