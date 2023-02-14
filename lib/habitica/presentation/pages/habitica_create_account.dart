import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class HabiticaCreateAccount extends StatelessWidget {
  const HabiticaCreateAccount({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    final textTheme = theme.textTheme;
    final appBarBackgroundColor = theme.scaffoldBackgroundColor;

    return Scaffold(
      appBar: AppBar(elevation: 0, backgroundColor: appBarBackgroundColor),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            children: [
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Spacer(),
                    Column(
                      children: [
                        Text('Create account', style: textTheme.titleLarge),
                        const SizedBox(height: 8),
                        Text(
                          'Join with us to plan your task',
                          style: textTheme.titleSmall,
                        ),
                      ],
                    ),
                    const Spacer(),
                    Column(
                      children: [
                        SizedBox(
                          width: double.infinity,
                          child: OutlinedButton.icon(
                            icon: const FaIcon(FontAwesomeIcons.google),
                            onPressed: () {},
                            label: Text(
                              'Continue with Google',
                              style: textTheme.titleLarge,
                            ),
                          ),
                        ),
                        const SizedBox(height: 24),
                        SizedBox(
                          width: double.infinity,
                          child: OutlinedButton.icon(
                            icon: const FaIcon(FontAwesomeIcons.apple),
                            onPressed: () {},
                            label: Text(
                              'Continue with Apple',
                              style: textTheme.titleLarge,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 8),
              Row(
                children: [
                  const Expanded(
                    child: Divider(
                      indent: 40,
                      height: 2,
                      color: Colors.red,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8),
                    child: Text(
                      'Or continue with',
                      style: textTheme.labelMedium,
                    ),
                  ),
                  const Expanded(
                    child: Divider(
                      endIndent: 40,
                      height: 2,
                      color: Colors.red,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 8),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Email', style: textTheme.titleSmall),
                  const SizedBox(height: 8),
                  const TextField(
                    decoration: InputDecoration(
                      hintText: 'Enter your email address',
                    ),
                  ),
                ],
              ),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Column(
                      children: [
                        SizedBox(
                          width: double.infinity,
                          child: ElevatedButton(
                            onPressed: () {},
                            child: Text(
                              'Continue with email',
                              style: textTheme.titleLarge
                                  ?.copyWith(color: Colors.white),
                            ),
                          ),
                        ),
                        const SizedBox(height: 16),
                        const Text('Already have an account? Login'),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 32),
                      child: Text(
                        '''By signing up vou agree to our Terms and Conditions of Use''',
                        textAlign: TextAlign.center,
                        style: textTheme.bodyLarge,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
