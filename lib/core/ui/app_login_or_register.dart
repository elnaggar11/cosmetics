import 'package:cosmetics/core/logic/helper_methods.dart';
import 'package:cosmetics/views/auth/register_view.dart';
import 'package:flutter/material.dart';

class AppLoginOrRegister extends StatelessWidget {
  const AppLoginOrRegister({super.key, this.isLogin = true});
  final bool isLogin;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: MediaQuery.of(context).padding.bottom),
      child: Text.rich(
        TextSpan(
          children: [
            TextSpan(
              text: isLogin ? 'Have an account?' : 'Don’t have an account?',
              style: Theme.of(context).textTheme.bodySmall!.copyWith(
                color: Theme.of(context).primaryColor,
              ),
            ),
            WidgetSpan(
              alignment: PlaceholderAlignment.middle,
              child: TextButton(
                onPressed: () {
                  if (isLogin) {
                    navigateTo(RegisterView());
                  } else {
                    Navigator.pop(context);
                  }
                },
                child: Text(
                  isLogin ? 'Register' : 'Login',
                  style: Theme.of(context).textTheme.bodySmall!.copyWith(
                    color: Theme.of(context).colorScheme.secondary,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
          ],
        ),
        textAlign: TextAlign.center,
      ),
    );
  }
}
