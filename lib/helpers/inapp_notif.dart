import 'package:flutter/material.dart';
import 'package:overlay_support/overlay_support.dart';

pushInAppNotification({
  required String title,
  required String body,
}) {
  return showOverlayNotification(
    (context) {
      return Padding(
        padding: const EdgeInsets.only(
          top: 12.0,
          right: 100,
          left: 100,
        ),
        child: Card(
          elevation: 4,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          margin: const EdgeInsets.symmetric(horizontal: 4),
          child: ListTile(
            leading: SizedBox.fromSize(
              size: const Size(25, 25),
              child: const ClipOval(
                child: Icon(
                  Icons.notifications_active,
                  color: Colors.black,
                ),
              ),
            ),
            title: Text(title),
            subtitle: Text(body),
            trailing: IconButton(
              icon: const Icon(Icons.close),
              onPressed: () {
                OverlaySupportEntry.of(context)?.dismiss();
              },
            ),
          ),
        ),
      );
    },
    duration: const Duration(seconds: 7),
  );
}
