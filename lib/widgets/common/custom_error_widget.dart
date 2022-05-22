import 'package:flutter/material.dart';

class CustomError extends StatelessWidget {
  final FlutterErrorDetails errorDetails;

  const CustomError({
    Key? key,
    required this.errorDetails,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Future.delayed(const Duration(seconds: 3), () {
    //   Get.dialog(
    //     AlertDialog(
    //       title: const Text('Error'),
    //       content: Text(errorDetails.exception.toString()),
    //       actions: [
    //         ElevatedButton(
    //           child: const Text('OK'),
    //           onPressed: () {
    //             Get.back();
    //             Phoenix.rebirth(context);
    //           },
    //         ),
    //       ],
    //     ),
    //   );
    // });
    return Card(
      elevation: 2,
      clipBehavior: Clip.antiAlias,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      color: Colors.redAccent,
      margin: const EdgeInsets.all(8.0),
      child: const Padding(
        padding: EdgeInsets.all(5.0),
        child: ListTile(
          title: Center(
            child: Text(
              "😕 Something is not right here 🙏",
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 15,
              ),
            ),
          ),
          subtitle: Text(
            '''If you were setting the time, please don't slide it till the end.
Please reset the corresponing time and try again.
Or restart PomoFlev and try again.''',
            style: TextStyle(
              color: Colors.white,
              fontSize: 13,
            ),
          ),
        ),
      ),
    );
  }
}
