import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class NoLoginScreen extends StatelessWidget {
  const NoLoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Column(
          mainAxisAlignment:
              MainAxisAlignment.start, // : MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 100),
            Center(
              child: Icon(
                Icons.lock,
                //width: MediaQuery.of(context).size.height * 0.22,
                size: MediaQuery.of(context).size.height * 0.22,
              ),
            ),
            SizedBox(height: MediaQuery.of(context).size.height * 0.03),
            Text(
              tr('login.noLogin'),
              style: TextStyle(
                fontSize: MediaQuery.of(context).size.height * 0.0175,
                color: Theme.of(context).textTheme.bodyMedium!.color,
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: MediaQuery.of(context).size.height * 0.03),
            Text(
              tr("login.noLoginDetails"),
              style: TextStyle(
                  fontSize: MediaQuery.of(context).size.height * 0.0175,
                  color: Theme.of(context).disabledColor),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: MediaQuery.of(context).size.height * 0.05),
            InkWell(
              onTap: () => context.goNamed('login'),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0),
                  color: Theme.of(context).primaryColor,
                ),
                padding:
                    const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(Icons.login,
                        size: 18.0, color: Theme.of(context).cardColor),
                    Text(tr("login.btnLogin"),
                        style: TextStyle(color: Theme.of(context).cardColor)),
                  ],
                ),
              ),
            ),
          ]),
    );
  }
}
