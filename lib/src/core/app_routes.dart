import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:transcriptapp/src/features/attendances/presenter/screens/attendances_list_screen.dart';
import 'package:transcriptapp/src/features/auth/presenter/screens/change_password_view.dart';
import 'package:transcriptapp/src/features/auth/presenter/screens/edit_profile_view.dart';
import 'package:transcriptapp/src/features/auth/presenter/screens/login_screen.dart';
import 'package:transcriptapp/src/features/auth/presenter/screens/profile_screen.dart';
import 'package:transcriptapp/src/features/auth/presenter/screens/signup_view.dart';
import 'package:transcriptapp/src/features/auth/presenter/viewmodels/student_view_model.dart';
import 'package:transcriptapp/src/features/dailypoints/presenter/screens/dailypoints_list_screen.dart';
import 'package:transcriptapp/src/features/exams/domain/models/teste_model.dart';
import 'package:transcriptapp/src/features/exams/presenter/screens/teste_play_screen.dart';
import 'package:transcriptapp/src/features/exams/presenter/screens/teste_view_screen.dart';
import 'package:transcriptapp/src/features/exams/presenter/screens/testes_screen.dart';
import 'package:transcriptapp/src/features/home/presenter/screens/home_init.dart';
import 'package:transcriptapp/src/features/home/presenter/screens/home_screen.dart';
import 'package:transcriptapp/src/features/notifications/presenter/views/notifications_view.dart';

final GoRouter appRoutes = GoRouter(
  // initialLocation go to testesplay
  initialLocation:'/init',
  routes: [
    GoRoute(
      path: '/init',
      name: 'init',
      builder: (context, state) => const HomeInit(),
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
          builder: (context, state) {
            final student = (state.extra as Map)['student'] as StudentViewModel;
            return ProfileView(student: student);
          },
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
