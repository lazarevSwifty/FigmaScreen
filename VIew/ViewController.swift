import UIKit

class ViewController: UIViewController, ViewSpecificController, UIImagePickerControllerDelegate, UINavigationControllerDelegate, UITextFieldDelegate  {
    typealias RootView = LoginView
    
    let imagePicker = UIImagePickerController()
    
    var currentSex = 2
    
    override func loadView() {
        view = LoginView()
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        imagePicker.delegate = self
        view().nameTextField.delegate = self
        
        view().dateTextField.setInputViewDatePicker(target: self, selector: #selector(tapDone))
        
        NotificationCenter.default.addObserver(forName: UIResponder.keyboardWillChangeFrameNotification, object: nil, queue: nil) { (nc) in
            self.view().frame.origin.y = -100
          }
        
        NotificationCenter.default.addObserver(forName: UIResponder.keyboardWillHideNotification, object: nil, queue: nil) { (nc) in
            self.view().frame.origin.y = 0
        }
        view().imageButton.addTarget(self, action: #selector(imageButtonTapped(sender:)), for: .touchUpInside)
        view().womanButton.addTarget(self, action: #selector(selectWomanType(sender:)), for: .touchUpInside)
        view().manButton.addTarget(self, action: #selector(selectManType(sender:)), for: .touchUpInside)
        setupUI()
    }
    
    @objc func imageButtonTapped(sender: UIButton) {
        imagePicker.allowsEditing = false
        imagePicker.sourceType = .photoLibrary
        
        present(imagePicker, animated: true, completion: nil)
    }
    
    @objc func selectWomanType(sender: UIButton) {
        if currentSex == 2 {
            currentSex = 1
            changeButton(button: sender)
            view().manButton.layer.borderWidth = 0
            view().manButton.setTitleColor(.black, for: .normal)
        }
    }

        
    @objc func selectManType(sender: UIButton) {
        if currentSex == 1 {
            currentSex = 2
            changeButton(button: sender)
            view().womanButton.layer.borderWidth = 0
            view().womanButton.setTitleColor(.black, for: .normal)
        }
    }
    
    @objc func tapDone() {
        if let datePicker = view().dateTextField.inputView as? UIDatePicker {
            let dateFormatter = DateFormatter()
            dateFormatter.dateStyle = .medium
            view().dateTextField.text = dateFormatter.string(from: datePicker.date)
        }
        view().dateTextField.resignFirstResponder()
    }
    
    
    func changeButton(button: UIButton) {
        button.layer.borderWidth = 1
        button.layer.cornerRadius = 10
        let color = UIColor.red
        button.setTitleColor(.red, for: .normal)
        button.layer.borderColor = color.cgColor
    }
    
    func setupUI() {
        view.backgroundColor = .white
        NSLayoutConstraint.activate([
            view.topAnchor.constraint(equalTo: self.view.topAnchor),
            view.leftAnchor.constraint(equalTo: self.view.leftAnchor),
            view.rightAnchor.constraint(equalTo: self.view.rightAnchor),
            view.bottomAnchor.constraint(equalTo: self.view.bottomAnchor),
        ])
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
}

    // MARK: - UIImagePickerControllerDelegate Methods
extension ViewController {
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let pickedImage = info[UIImagePickerController.InfoKey.originalImage] as? UIImage {
            view().imageButton.setBackgroundImage(pickedImage, for: .normal)
        }
        dismiss(animated: true, completion: nil)
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        dismiss(animated: true, completion: nil)
    }
}

// MARK: - UITextFieldDelegate Methods
extension ViewController {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
        return true
    }
    
}
