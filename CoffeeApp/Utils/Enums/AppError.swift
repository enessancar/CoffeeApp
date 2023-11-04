//
//  AppError.swift
//  CoffeeApp
//
//  Created by Enes Sancar on 31.10.2023.
//

import Foundation

enum AppError: Error {
    case unknown
    case authenticationFailed
    case profileImageUploadFailed
    case profileImageURLNotFound
    case userDocumentNotFound
    case dataEncodingFailed
    case dataDecodingFailed
    case custom(String)
    case dataFetchingFailed
    
    var localizedDescription: String {
        switch self {
        case .unknown:
            return Errors.unknown
        case .authenticationFailed:
            return Errors.authenticationFailed
        case .profileImageUploadFailed:
            return Errors.imageUploadFailed
        case .profileImageURLNotFound:
            return Errors.imageURLNotFound
        case .userDocumentNotFound:
            return Errors.userDocumentNotFound
        case .dataEncodingFailed:
            return Errors.dataEncodingFailed
        case .dataDecodingFailed:
            return Errors.dataDecodingFailed
        case .custom(let message):
            return message
        case .dataFetchingFailed:
            return Errors.dataFetchingFailed
        }
    }
}

enum Errors {
    static let unknown = NSLocalizedString("An unknown error occurred.", comment: "")
    static let authenticationFailed = NSLocalizedString("Authentication failed.", comment: "")
    static let imageUploadFailed = NSLocalizedString("An error occurred while uploading the profile image.", comment: "")
    static let imageURLNotFound = NSLocalizedString("Profile image URL not found.", comment: "")
    static let userDocumentNotFound = NSLocalizedString("User document not found.", comment: "")
    static let dataEncodingFailed = NSLocalizedString("Data encoding failed.", comment: "")
    static let dataDecodingFailed = NSLocalizedString("Data decoding failed.", comment: "")
    static let dataFetchingFailed = NSLocalizedString("Data Fetching Failed", comment: "")
    static let imageOrDescMissing = NSLocalizedString("Image or description is missing!", comment: "")
    static let postSharingFailed = NSLocalizedString("Failed to share the post!", comment: "")
}
