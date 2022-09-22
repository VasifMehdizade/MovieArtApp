//
//  SignInController.swift
//  MovieArtApp
//
//  Created by Vasif Mehdizade on 13.09.22.
//

import UIKit

class SignInController: UIViewController {

    @IBOutlet private weak var emailTextField: UITextField!
    @IBOutlet private weak var passwordTextField: UITextField!
    @IBOutlet weak var notRegisteredButton: UIButton!
    
    var users = [Users]()
    
    let yourAttributes: [NSAttributedString.Key: Any] = [
        .underlineStyle: NSUnderlineStyle.single.rawValue]
    
    var jsonData = URL(string: "")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        notRegistered()
        jsonData = getDocumentDirectoryUrl().appendingPathComponent("Users.json")
    }
    
    override func viewWillAppear(_ animated: Bool) {
        jsonSetup()
    }
    
    func notRegistered() {
        let attributeString = NSMutableAttributedString(string: "Not Registered?", attributes: yourAttributes)
        notRegisteredButton.setAttributedTitle(attributeString, for: .normal)
    }
    
    func getDocumentDirectoryUrl() -> URL {
        let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        let documentDirectory = paths[0]
        return documentDirectory
    }
    
    func jsonSetup() {
        if let file = jsonData, let data = try? Data(contentsOf: file) {
            do {
                users = try JSONDecoder().decode([Users].self, from: data)
            }
            
            catch {
                print(error)
            }
        }
    }
    
    func check() -> Bool {
        for user in users{
            if emailTextField.text == user.email && passwordTextField.text == user.password {
                return true
            }
        }
        return false
    }
    
    func navigateToHomePage () {
        if check() {
            let controller = storyboard?.instantiateViewController(withIdentifier: "UITabBarController")
            show(controller!, sender: nil)
        }
        else {
            print("error")
        }
    }
    
    @IBAction func signInAction(_ sender: Any) {
        UserDefaults.standard.set(true, forKey: "isLoggedAgain")
        navigateToHomePage()
    }
    
    @IBAction func notRegisteredAction(_ sender: Any) {
        let controller = storyboard?.instantiateViewController(withIdentifier: "RegisterController") as! RegisterController
        show(controller, sender: nil)
    }
}
