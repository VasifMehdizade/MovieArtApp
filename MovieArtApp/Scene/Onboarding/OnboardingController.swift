//
//  OnboardingController.swift
//  MovieArtApp
//
//  Created by Vasif Mehdizade on 13.09.22.
//

import UIKit

class OnboardingController: UIViewController {

    @IBOutlet weak var screenLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        labelEditing()
        let delay : Double = 1.0
        DispatchQueue.main.asyncAfter(deadline: .now() + delay) {
            self.fireTimer()
        }
    }
    func labelEditing() {
        screenLabel.text = "Movie Art"
        view.backgroundColor = .black
    }
    @objc func fireTimer() {
        let controller = storyboard?.instantiateViewController(withIdentifier: "SignInController") as! SignInController
        show(controller, sender: nil)
    }
}
