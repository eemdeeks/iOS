//
//  Logger.swift
//  WorkoutProject
//
//  Created by 박승찬 on 10/31/23.
//

import Foundation
import os

extension Logger {
    private static var subsystem = Bundle.main.bundleIdentifier!
    #if os(watchOS)
    static let shared = Logger(subsystem: subsystem, category: "MirroringWorkoutsSampleForWatch")
    #else
    static let shared = Logger(subsystem: subsystem, category: "MirroringWorkoutsSample")
    #endif
}
