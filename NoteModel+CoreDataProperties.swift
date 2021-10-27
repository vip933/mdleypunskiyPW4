//
//  NoteModel+CoreDataProperties.swift
//  mdleypusnkiyPW4
//
//  Created by Maksim on 27.10.2021.
//
//

import Foundation
import CoreData


extension NoteModel {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<NoteModel> {
        return NSFetchRequest<NoteModel>(entityName: "NoteModel")
    }

    @NSManaged public var creationDate: Date
    @NSManaged public var descriptionText: String?
    @NSManaged public var title: String?

}

extension NoteModel : Identifiable {

}
