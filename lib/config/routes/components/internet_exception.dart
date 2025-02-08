// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class InternetException extends StatelessWidget {
  final VoidCallback onPress;

  const InternetException({
    super.key,
    required this.onPress,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: MediaQuery.sizeOf(context).height * .15,
        ),
        const Icon(
          Icons.cloud_off,
          color: Colors.red,
        ),
        Padding(
          padding: const EdgeInsets.only(top: 30),
          child: Center(
            child: Text(
              "We're not unable to show results.\n Please check your data\nconnection",
              textAlign: TextAlign.center,
              style: Theme.of(context)
                  .textTheme
                  .displayMedium!
                  .copyWith(fontSize: 20),
            ),
          ),
        ),
        ElevatedButton(
            onPressed: onPress,
            child: Center(
              child: Text(
                'RETRY',
                style: Theme.of(context).textTheme.bodySmall,
              ),
            ))
      ],
    );
  }
}
