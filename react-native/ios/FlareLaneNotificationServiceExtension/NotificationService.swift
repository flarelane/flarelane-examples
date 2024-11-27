//
//  NotificationService.swift
//  FlareLaneNotificationServiceExtension
//
//  Created by MinHyeok Kim on 11/27/24.
//

import FlareLane

class NotificationService: UNNotificationServiceExtension {
  override func didReceive(_ request: UNNotificationRequest, withContentHandler contentHandler: @escaping (UNNotificationContent) -> Void) {
    if FlareLaneNotificationServiceExtensionHelper.shared.isFlareLaneNotification(request) {
      FlareLaneNotificationServiceExtensionHelper.shared.didReceive(request, withContentHandler: contentHandler)
    } else {
      // ...
    }
  }
  
  override func serviceExtensionTimeWillExpire() {
    FlareLaneNotificationServiceExtensionHelper.shared.serviceExtensionTimeWillExpire()
  }
}
