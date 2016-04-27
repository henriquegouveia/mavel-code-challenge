//
//  CustomConvertible.swift
//  MavelApp
//
//  Created by Henrique Cesar Gouveia on 4/26/16.
//  Copyright © 2016 Henrique Gouveia. All rights reserved.
//

import Foundation

let UserLocalizedErrorDescriptionKey = "UserLocalizedErrorDescriptionKey"
let UserLocalizedErrorTitleKey = "UserLocalizedErrorTitleKey"

/**
 *  Handy protocol to deal with errors
 */
protocol CustomErrorConvertible: ErrorType, CustomStringConvertible {
    
    // [Required]
    
    /// The error's domain.
    var domain: String { get }
    
    /// The error's code.
    var code: Int { get }
    
    /// [Optional]
    
    /// A localized and friendly title of this error. You can show this title to the user.
    var userLocalizedTitle: String? { get }
    
    /// A localized and friendly message of this error. You can show this message to the user.
    var userLocalizedMessage: String? { get }
    
    /// The failure reason of this error
    var localizedFailureReason: String? { get }
    
    /// The error's userInfo.
    var userInfo: [NSObject : AnyObject] { get }
    
    /// An NSError equivalent.
    var error: NSError { get }
    
    /// The child of this error, if any. If you are implementing this protocol in a enum and you have
    /// an associated error, return the associated error, otherwise, return nil.
    var childError: CustomErrorConvertible? { get }
}

extension CustomErrorConvertible {
    var userLocalizedTitle: String? {
        return nil
    }
    
    var userLocalizedMessage: String? {
        return nil
    }
    
    var localizedFailureReason: String? {
        return nil
    }
    
    var userInfo: [NSObject : AnyObject] {
        var buildInfo = [NSObject : String]()
        
        if let userLocalizedTitle = userLocalizedTitle {
            buildInfo[UserLocalizedErrorTitleKey] = userLocalizedTitle
        }
        
        if let userLocalizedMessage = userLocalizedMessage {
            buildInfo[UserLocalizedErrorDescriptionKey] = userLocalizedMessage
        }
        
        if let localizedFailureReason = localizedFailureReason {
            buildInfo[NSLocalizedFailureReasonErrorKey] = localizedFailureReason
        }
        
        return buildInfo
    }
    
    var error: NSError {
        return NSError(domain: domain, code: code, userInfo: userInfo)
    }
    
    var childError: CustomErrorConvertible? {
        return nil
    }
    
    var description: String {
        return "\(domain), code: \(code), userInfo: \(userInfo)"
    }
}

extension CustomErrorConvertible {
    func rootError() -> CustomErrorConvertible {
        return childError?.rootError() ?? self
    }
    
    func userLocalizedTitleUnwrapped() -> String {
        return userLocalizedTitle ?? "GenericErrorTitle"
    }
    
    func userLocalizedMessageUnwrapped() -> String {
        return userLocalizedMessage ?? "GenericErrorMessage"
    }
}

extension NSError: CustomErrorConvertible {
    
    var error: NSError {
        return self
    }
}
