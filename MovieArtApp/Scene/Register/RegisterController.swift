//
//  RegisterController.swift
//  MovieArtApp
//
//  Created by Vasif Mehdizade on 14.09.22.
//

import UIKit

class RegisterController: UIViewController {
    @IBOutlet private weak var nameTextFieldRegister: UITextField!
    @IBOutlet private weak var emailTextFieldRegister: UITextField!
    @IBOutlet private weak var passwordTextFieldRegister: UITextField!
    
    var users =  [Users]()
    
    var jsonFile = URL(string: "")
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    func getDocumentDirectoryUrl() -> URL {
        let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        let documentDirectory = paths[0]
        return documentDirectory
    }
    
    func jsonSetup () {
        if let file = jsonFile, let data = try? Data(contentsOf: file) {
            do {
                users = try JSONDecoder().decode([Users].self, from: data)
            }
            catch {
                print(error.localizedDescription)
            }
        }else{
                print("error")
            }
        }
    
    func writeToFile() {
        let user = Users(name: nameTextFieldRegister.text ?? "", email: emailTextFieldRegister.text ?? "", password: passwordTextFieldRegister.text ?? "")
        users.append(user)
        do {
            let data = try JSONEncoder().encode(users)
            try data.write(to: jsonFile!)
            navigationController?.popViewController(animated: true)
        }
        catch{
            print("error")
        }
    }
    
    
    @IBAction func registerAction(_ sender: Any) {
        if nameTextFieldRegister.text?.isEmpty == false && emailTextFieldRegister.text?.isEmpty == false && passwordTextFieldRegister.text?.isEmpty == false {
            writeToFile()
        }else {
            print("Not working")
        }
    }
    
    @IBAction func alreadyAccountAction(_ sender: Any) {
        let controller = storyboard?.instantiateViewController(withIdentifier: "SignInController") as! SignInController
        show(controller, sender: nil)
    }
    }

