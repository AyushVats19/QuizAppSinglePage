//
//  QA+CoreDataProperties.swift
//  QuizAppSinglePageVersion
//
//  Created by Ayush Sharma on 02/07/19.
//  Copyright © 2019 Apple Inc. All rights reserved.
//
//

import Foundation
import CoreData


extension QA {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<QA> {
        return NSFetchRequest<QA>(entityName: "QA")
    }

    @NSManaged public var question: String?
    @NSManaged public var option1: String?
    @NSManaged public var option2: String?
    @NSManaged public var option3: String?
    @NSManaged public var option4: String?
    @NSManaged public var answer: Int16

}
