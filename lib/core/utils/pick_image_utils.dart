import 'package:flutter/cupertino.dart';

import 'package:image_picker/image_picker.dart';
import 'package:logger/logger.dart';
import 'package:permission_handler/permission_handler.dart';

class PickImageUtils {
  factory PickImageUtils() => instance;

  const PickImageUtils._();

  static const PickImageUtils instance = PickImageUtils._();

  Future<XFile?> pickImage(BuildContext context) async {
    try {
      final image = await ImagePicker().pickImage(source: ImageSource.gallery);

      if (image != null) {
        return XFile(image.path);
      }

      return null;
    } catch (e) {
      if (!context.mounted) return null;

      final permissionStatus = await Permission.photos.status;

      if (permissionStatus.isDenied) {
        if (context.mounted) {
          await _showAlertPermissionsDialog(context);
        }
      } else {
        Logger().e('Image Exception: $e');
      }
    }

    return null;
  }

  Future<void> _showAlertPermissionsDialog(BuildContext context) {
    return showCupertinoDialog(
      context: context,
      builder: (context) {
        return CupertinoAlertDialog(
          title: const Text('Permissions Denied'),
          content: const Text('Allow access to gallery and photos'),
          actions: <CupertinoDialogAction>[
            CupertinoDialogAction(
              onPressed: () => Navigator.of(context).pop(),
              child: const Text('Cancel'),
            ),
            const CupertinoDialogAction(
              isDefaultAction: true,
              onPressed: openAppSettings,
              child: Text('Settings'),
            ),
          ],
        );
      },
    );
  }
}
