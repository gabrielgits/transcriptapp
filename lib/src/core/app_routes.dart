import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:transcriptapp/src/features/auth/presenter/screens/about_view.dart';
import 'package:transcriptapp/src/features/auth/presenter/screens/change_password_view.dart';
import 'package:transcriptapp/src/features/auth/presenter/screens/edit_profile_view.dart';
import 'package:transcriptapp/src/features/auth/presenter/screens/login_view.dart';
import 'package:transcriptapp/src/features/auth/presenter/screens/profile_view.dart';
import 'package:transcriptapp/src/features/auth/presenter/screens/signup_view.dart';
import 'package:transcriptapp/src/features/home/presenter/screens/home_init.dart';
import 'package:transcriptapp/src/features/notifications/presenter/views/notifications_view.dart';

final GoRouter appRoutes = GoRouter(
  initialLocation: '/home',
  routes: [
    GoRoute(
      path: '/home',
      name: 'home',
      builder: (context, state) => const HomeInit(),
    ),
    GoRoute(
      path: '/signin',
      name: 'signin',
      builder: (context, state) => const LoginScreen(),
    ),
    GoRoute(
      path: '/signup',
      name: 'signup',
      builder: (context, state) => const SignupView(),
    ),
    GoRoute(
      path: '/change_password',
      builder: (context, state) => const ChangePasswordView(),
    ),
    GoRoute(
      path: '/about',
      builder: (context, state) => const AboutView(),
    ),
    GoRoute(
      path: '/profile',
      builder: (context, state) => const ProfileView(),
      routes: [
        GoRoute(
          path: 'edit',
          builder: (context, state) => const EditProfileView(),
        ),
      ],
    ),
    GoRoute(
      path: '/notifications',
      builder: (context, state) => const NotificationsView(),
    ),
    GoRoute(
      path: '/exam',
      name: 'exam',
      builder: (context, state) => const Placeholder(),
      routes: [
        GoRoute(
          path: 'examview',
          name: 'exam-view',
          builder: (context, state) {
            final item = (state.extra as Map)['exam'] as double;
            return Placeholder(strokeWidth: item);
          },
        ),
          GoRoute(
          path: 'examplay',
          name: 'exam-play',
          builder: (context, state) {
            final item = (state.extra as Map)['game'] as double;
           return Placeholder(strokeWidth: item);
          },
        ),
      ],
    ),
   
  ],
);
