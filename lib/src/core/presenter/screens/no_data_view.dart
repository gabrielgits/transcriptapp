import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class NoDataView extends StatelessWidget {
  final String title;
  const NoDataView({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Center(
              child: Icon(
                Icons.local_mall_outlined,
                size: MediaQuery.of(context).size.height * 0.22,
              ),
            ),
            SizedBox(height: MediaQuery.of(context).size.height * 0.03),
            Text(
              title,
              style: TextStyle(
                  fontSize: MediaQuery.of(context).size.height * 0.0175,
                  color: Theme.of(context).disabledColor),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: MediaQuery.of(context).size.height * 0.03),
            Text(
              tr("noDataScreen.search"),
              style: TextStyle(
                  fontSize: MediaQuery.of(context).size.height * 0.0175,
                  color: Theme.of(context).disabledColor),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: MediaQuery.of(context).size.height * 0.05),
            ElevatedButton(
              onPressed: () => context.go('/home'),
              child: Text(tr("noDataScreen.goHome")),
            )
          ]),
    );
  }
}
