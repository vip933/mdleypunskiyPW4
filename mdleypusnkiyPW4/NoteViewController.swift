//
//  NoteViewController.swift
//  mdleypusnkiyPW4
//
//  Created by Maksim on 27.10.2021.
//

import UIKit

class NoteViewController: UIViewController {
    @IBOutlet weak var titleTextField: UITextField!
    @IBOutlet weak var textView: UITextView!
    
    var outputVC: ViewController!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupDoneButton()
    }
    
    private func setupDoneButton() {
        navigationItem.rightBarButtonItem =
        UIBarButtonItem(barButtonSystemItem: .done,
                        target: self,
                        action: #selector(didTapSaveNote(button:)))
    }
    
    @objc func didTapSaveNote(button: UIBarButtonItem) {
        let title = titleTextField.text ?? ""
        let descriptionText = textView.text ?? ""
        if !title.isEmpty {
            let newNote = NoteModel(context: outputVC.context)
            newNote.title = title
            newNote.descriptionText = descriptionText
            newNote.creationDate = Date()
            newNote.relationship = outputVC.prevNote
            outputVC.prevNote = newNote
        }
        outputVC.saveChanges()
        self.navigationController?.popViewController(animated: true)
    }
}
