//
//  NotificationService.swift
//  FlareLaneNotificationServiceExtension
//
//  Created by MinHyeok Kim on 5/12/25.
//


import UserNotifications
import FlareLane

class NotificationService: UNNotificationServiceExtension {
  override func didReceive(_ request: UNNotificationRequest, withContentHandler contentHandler: @escaping (UNNotificationContent) -> Void) {
    // 1
    // 플레어레인에서 발송한 푸시는 플레어레인의 메소드만 동작하도록 분기 처리합니다.
    if FlareLaneNotificationServiceExtensionHelper.shared.isFlareLaneNotification(request) {
      FlareLaneNotificationServiceExtensionHelper.shared.didReceive(request, withContentHandler: contentHandler)
    } else {
      // ...
    }
  }
  
  override func serviceExtensionTimeWillExpire() {
    // 2
    FlareLaneNotificationServiceExtensionHelper.shared.serviceExtensionTimeWillExpire()
  }
}
