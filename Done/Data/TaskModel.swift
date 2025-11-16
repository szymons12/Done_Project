//
//  TaskModel.swift
//  Done
//
//  Created by Szymon on 09/11/2025.
//

import Foundation
import SwiftData

@Model
class Task{
    var id: UUID = UUID()
    var content: String
    var tasknum: TaskCategory
    
    init(content: String, tasknum: TaskCategory) {
        self.content = content
        self.tasknum = tasknum
    }
}


    enum TaskCategory: Int, Codable{
        case task1 = 1
        case task2 = 2
        case task3 = 3
        
    }
    
