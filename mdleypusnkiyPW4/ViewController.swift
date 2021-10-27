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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //notesCollectionView.register(NoteCell.self, forCellWithReuseIdentifier: "NoteCell")
        // Do any additional setup after loading the view.
    }
}

extension ViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "NoteCell", for: indexPath) as! NoteCell
        cell.titleLabel.text = "Yeah"
        cell.descriptionLabel.text = "That's great"
        
        return cell
    }
    
}

