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
              text: isLogin ? 'Don’t have an account?' : 'Have an account?',
              style: Theme.of(context).textTheme.bodySmall!.copyWith(
                color: Theme.of(context).primaryColor,
              ),
            ),
            WidgetSpan(
              child: TextButton(
                onPressed: () {
                  isLogin ? Navigator.pop(context) : navigateTo(RegisterView());
                },
                child: Text(
                  isLogin ? 'Login' : 'Register',
                  style: Theme.of(context).textTheme.bodySmall!.copyWith(
                    color: Theme.of(context).colorScheme.secondary,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
