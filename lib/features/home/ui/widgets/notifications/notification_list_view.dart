import 'package:ecommerce/features/home/ui/widgets/notifications/empty_notification_list.dart';
import 'package:flutter/material.dart';

import 'notification_card.dart';

class NotificationListView extends StatelessWidget {
  const NotificationListView({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: Visibility(
      visible: true,
      replacement: const EmptyNotificationList(),
      child: ListView.builder(
        itemCount: 4,
        itemBuilder: (context, index) => NotificationCard(
          isNotificationViewed: false,
          notificationText:
              'Love modern décor? Check out these top picks we think you\'ll adore',
          onDismissed: () {},
        ),
      ),
    ));
  }
}
