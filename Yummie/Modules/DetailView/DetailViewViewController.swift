//
//  DetailView module - DetailViewViewController.swift
//  Yummie
//
//  Created by sakhnenkoff on 29/03/2022.
//  Copyright © 2022 matthews.co. All rights reserved.
//

import UIKit
import Nuke

class DetailViewViewController: UIViewController {

    public var viewModel: DetailViewViewModel!
    
    @IBOutlet
    weak var detailImageView: UIImageView!
    
    @IBOutlet
    weak var detailTitleLabel: UILabel!
    
    @IBOutlet
    weak var detailDescriptionLabel: UILabel!
    
    @IBOutlet
    weak var detailCaloriesLabel: UILabel!
    
    @IBOutlet
    weak var detailTextField: UITextField!
    
    //MARK: - LifeCycle
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        navigationController?.navigationBar.barStyle = .black
        navigationController?.navigationBar.tintColor = .white
        
        setupKeyboardHiding()
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        configure()
        setupBindings()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        navigationController?.navigationBar.barStyle = .default
        navigationController?.navigationBar.tintColor = nil
    }
    
    //MARK: - Configuration
    
    private func configure() {
        detailTitleLabel.text = viewModel.dish.name
        detailDescriptionLabel.text = viewModel.dish.description
        detailCaloriesLabel.text = viewModel.dish.formattedCalories
        
        if let imageString = viewModel.dish.imageString, let url = URL(string: imageString) {
            Nuke.loadImage(with: url, into: detailImageView)
        }
        
        detailImageView.addSubview(DarkOverlayView(frame: detailImageView.frame))
    }
    
    private func setupKeyboardHiding() {
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide), name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    @objc private func keyboardWillShow(sender: NSNotification) {
        guard let userInfo = sender.userInfo,
        let keyboardFrame = userInfo[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue,
        let currentTextField = UIResponder.currentFirst() as? UITextField
        else { return }
        
        // check if top of the keyboard is above the bottom of the currently focused textbox
        
        let keyboardTopY = keyboardFrame.cgRectValue.origin.y
        let convertedTextFieldFrame = view.convert(currentTextField.frame, from: currentTextField.superview)
        let textFieldBottomY = convertedTextFieldFrame.origin.y + convertedTextFieldFrame.size.height
        
        // if textField bottom is below keyboard bottom - bump the frame up
        if textFieldBottomY > keyboardTopY {
            let textBoxY = convertedTextFieldFrame.origin.y
            let newFrameY = (textBoxY - keyboardTopY / 1.5) * -1
            view.frame.origin.y = newFrameY
        }
    }
    
    @objc private func keyboardWillHide(sender: NSNotification) {
        view.frame.origin.y = 0
    }

    private func setupBindings() {
    }
    
    // MARK: Actions

    @IBAction func detailOrderButton(_ sender: UIButton) {
        print(#function)
    }
}
