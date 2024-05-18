//
//  NotificationService.swift
//  NotificationServiceExtension
//
//  Created by MinHyeok Kim on 5/19/24.
//

import UserNotifications
import FirebaseMessaging
import FlareLane

class NotificationService: UNNotificationServiceExtension {

  var contentHandler: ((UNNotificationContent) -> Void)?
  var bestAttemptContent: UNMutableNotificationContent?

  override func didReceive(_ request: UNNotificationRequest, withContentHandler contentHandler: @escaping (UNNotificationContent) -> Void) {
    if FlareLaneNotificationServiceExtensionHelper.shared.isFlareLaneNotification(request) {
      FlareLaneNotificationServiceExtensionHelper.shared.didReceive(request, withContentHandler: contentHandler)
    } else {
      self.contentHandler = contentHandler
      bestAttemptContent = (request.content.mutableCopy() as? UNMutableNotificationContent)
      
      if let bestAttemptContent = bestAttemptContent {
          FIRMessagingExtensionHelper().populateNotificationContent(bestAttemptContent, withContentHandler: contentHandler)
      }
    }
  }
  
  override func serviceExtensionTimeWillExpire() {
    if let contentHandler = contentHandler, let bestAttemptContent =  bestAttemptContent {
      FlareLaneNotificationServiceExtensionHelper.shared.serviceExtensionTimeWillExpire()
      contentHandler(bestAttemptContent)
    }
  }

}
