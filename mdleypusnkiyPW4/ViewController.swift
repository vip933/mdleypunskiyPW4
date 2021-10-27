//
//  ViewController.swift
//  mdleypusnkiyPW4
//
//  Created by Maksim on 27.10.2021.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var notesCollectionView: UICollectionView!
    @IBOutlet weak var emptyCollectionLabel: UILabel!
    
    var notes: [NoteModel] = [] {
        didSet {
            emptyCollectionLabel.isHidden = notes.count != 0
            notesCollectionView.reloadData()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupAddButton()
    }
    
    private func setupAddButton() {
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add,
                                                            target: self,
                                                            action: #selector(createNote(sender:)))
    }
    
    @objc
    private func createNote(sender: UIBarButtonItem) {
        guard let vc = storyboard?.instantiateViewController(withIdentifier: "NoteViewController")
        as? NoteViewController else {
            return
        }
        vc.outputVC = self
        navigationController?.pushViewController(vc, animated: true)
    }
}

extension ViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return notes.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "NoteCell", for: indexPath) as! NoteCell
        let note = notes[indexPath.row]
        cell.titleLabel.text = note.titles
        cell.descriptionLabel.text = note.description
        
        return cell
    }
    
}

