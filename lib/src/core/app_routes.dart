import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:transcriptapp/src/features/attendances/ui/screens/attendances_list_screen.dart';
import 'package:transcriptapp/src/features/auth/ui/screens/change_password_view.dart';
import 'package:transcriptapp/src/features/auth/ui/screens/edit_profile_view.dart';
import 'package:transcriptapp/src/features/auth/ui/screens/login_screen.dart';
import 'package:transcriptapp/src/features/auth/ui/screens/profile_screen.dart';
import 'package:transcriptapp/src/features/auth/ui/screens/signup_view.dart';
import 'package:transcriptapp/src/features/dailypoints/ui/screens/dailypoints_list_screen.dart';
import 'package:transcriptapp/src/features/testes/domain/models/teste_model.dart';
import 'package:transcriptapp/src/features/testes/ui/screens/teste_play_screen.dart';
import 'package:transcriptapp/src/features/testes/ui/screens/teste_view_screen.dart';
import 'package:transcriptapp/src/features/testes/ui/screens/testes_screen.dart';
import 'package:transcriptapp/src/features/home/ui/screens/app_init.dart';
import 'package:transcriptapp/src/features/home/ui/screens/home_screen.dart';
import 'package:transcriptapp/src/features/notifications/ui/views/notifications_view.dart';

final GoRouter appRoutes = GoRouter(
  // initialLocation go to testesplay
  initialLocation:'/init',
  routes: [
    GoRoute(
      path: '/init',
      name: 'init',
      builder: (context, state) => const AppInit(),
    ),
    GoRoute(
      path: '/home',
      name: 'home',
      builder: (context, state) => const HomeScreen(),
    ),
    GoRoute(
      path: '/login',
      name: 'login',
      builder: (context, state) => const LoginScreen(),
      routes: [
        GoRoute(
          path: 'signup',
          name: 'signup',
          builder: (context, state) => const SignupView(),
        ),
        GoRoute(
          path: 'changepassword',
          name: 'changepassword',
          builder: (context, state) => const ChangePasswordView(),
        ),
        GoRoute(
          path: 'profile',
          name: 'profile',
          builder: (context, state) => const ProfileView(),
          routes: [
            GoRoute(
              path: 'edit',
              builder: (context, state) => const EditProfileView(),
            ),
          ],
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
    ),
    GoRoute(
      path: '/attendances',
      name: 'attendances',
      builder: (context, state) => const AttendancesListScreen(),
    ),
    GoRoute(
      path: '/dailypoints',
      name: 'dailypoints',
      builder: (context, state) => const DailypointsListScreen(),
    ),
    GoRoute(
        path: '/testes',
        name: 'testes',
        builder: (context, state) => const TestesListScreen(),
        routes: [
          GoRoute(
            path: 'testesdetail',
            name: 'testes-detail',
            builder: (context, state) {
              final teste = (state.extra as Map)['teste'] as TesteModel;
              return TesteDetailPage(teste: teste);
            },
          ),
          GoRoute(
            path: 'testesplay',
            name: 'testes-play',
            builder: (context, state) {
              final testeId = (state.extra as Map)['testeId'] as int;
              return TestePlayScreen(testeId: testeId);
            },
          ),
        ]),
  ],
);
