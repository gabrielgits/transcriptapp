import 'package:expt/expt.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:transcriptapp/src/features/notifications/domain/models/notification_model.dart';
import 'package:transcriptapp/src/features/notifications/domain/repositories/repository_local_notifications.dart';
import 'package:transcriptapp/src/features/notifications/domain/repositories/repository_remote_notifications.dart';
import 'package:transcriptapp/src/features/notifications/domain/useases/usecase_notifications.dart';

import 'usecase_notifications_test.mocks.dart';

// Generate mocks using build_runner
@GenerateMocks([RepositoryRemoteNotifications, RepositoryLocalNotifications])
void main() {
  late MockRepositoryRemoteNotifications mockRepositoryRemote;
  late MockRepositoryLocalNotifications mockRepositoryLocal;
  late UsecaseNotifications usecaseNotifications;

  setUp(() {
    mockRepositoryRemote = MockRepositoryRemoteNotifications();
    mockRepositoryLocal = MockRepositoryLocalNotifications();
    usecaseNotifications = UsecaseNotifications(
      repositoryRemote: mockRepositoryRemote,
      repositoryLocal: mockRepositoryLocal,
    );
  });

  test(
      'fetchNotifications should return ExptDataNoExpt and ExptWebNoExpt on success',
      () async {
    final notifications = [
      NotificationModel(
        id: 1,
        title: 'Test Notification',
        date: DateTime.now(),
        type: 'reminder',
        state: 'read',
        text: 'Test Notification',
      ),
    ];
    when(mockRepositoryRemote.getList()).thenAnswer((_) async => notifications);
    when(mockRepositoryLocal.saveList(notifications))
        .thenAnswer((_) async => 1);

    final result = await usecaseNotifications.fetchNotifications();

    expect(result.exptData, isA<ExptDataNoExpt>());
    expect(result.exptWeb, isA<ExptWebNoExpt>());
  });

  test('fetchNotifications should return ExptWebGet if getList fails', () async {
     when(mockRepositoryRemote.getList()).thenAnswer((_) async => []);

    final result = await usecaseNotifications.fetchNotifications();

    expect(result.exptData, isA<ExptDataNoExpt>());
    expect(result.exptWeb, isA<ExptWebGet>());
  });

  test('fetchNotifications should return ExptDataLoad if saveList fails', () async {
    final notifications = [
      NotificationModel(
        id: 1,
        title: 'Test Notification',
        date: DateTime.now(),
        type: 'reminder',
        state: 'read',
        text: 'Test Notification',
      ),
    ];
    when(mockRepositoryRemote.getList()).thenAnswer((_) async => notifications);
    when(mockRepositoryLocal.saveList(notifications))
        .thenAnswer((_) async => 0);

    final result = await usecaseNotifications.fetchNotifications();

    expect(result.exptData, isA<ExptDataLoad>());
    expect(result.exptWeb, isA<ExptWebNoExpt>()); 
  });


  test(
      'loadNotifications should return a list of notifications and ExptDataNoExpt on success',
      () async {
    final notifications = [
      NotificationModel(
        id: 1,
        title: 'Test Notification',
        date: DateTime.now(),
        type: 'reminder',
        state: 'read',
        text: 'Test Notification',
      ),
    ];
    when(mockRepositoryLocal.getList()).thenAnswer((_) async => notifications);

    final result = await usecaseNotifications.loadNotifications();

    expect(result.list, notifications);
    expect(result.exception, isA<ExptDataNoExpt>());
  });

  test('loadNotifications should return exception on unsuccessful load', () async {
    when(mockRepositoryLocal.getList()).thenAnswer((_) async => []);

    final result = await usecaseNotifications.loadNotifications();

    expect(result.exception, isA<ExptDataLoad>());
  });

  test('loadNotifications should return exception if getList throws exception', () async {
    when(mockRepositoryLocal.getList()).thenThrow((_) async => throwsException);

    final result = await usecaseNotifications.loadNotifications();

    expect(result.exception, isA<ExptDataUnknown>());
  });

  test(
      'updateNotification should return updated notification and ExptDataNoExpt on success',
      () async {
    final notification =
        NotificationModel(
        id: 1,
        title: 'Test Notification',
        date: DateTime.now(),
        type: 'reminder',
        state: 'read',
        text: 'Test Notification',
      );
    when(mockRepositoryLocal.updateItem(notification))
        .thenAnswer((_) async => 1);

    final result = await usecaseNotifications.updateNotification(notification);

    expect(result.item, notification);
    expect(result.exception, isA<ExptDataNoExpt>());
  });

  test('updateNotification should return exception on unsuccessful update', () async {
    final notification =
        NotificationModel(
        id: 1,
        title: 'Test Notification',
        date: DateTime.now(),
        type: 'reminder',
        state: 'read',
        text: 'Test Notification',
      );
    when(mockRepositoryLocal.updateItem(notification))
        .thenAnswer((_) async => 0);

    final result = await usecaseNotifications.updateNotification(notification);

    expect(result.exception, isA<ExptDataSave>());
  });

  test('updateNotification should return exception if updateItem throws exception', () async {
    final notification =
        NotificationModel(
        id: 1,
        title: 'Test Notification',
        date: DateTime.now(),
        type: 'reminder',
        state: 'read',
        text: 'Test Notification',
      );
    when(mockRepositoryLocal.updateItem(notification))
        .thenThrow((_) async => throwsException);

    final result = await usecaseNotifications.updateNotification(notification);

    expect(result.exception, isA<ExptDataUnknown>());
  });

  test(
      'loadNotification should return notification and ExptDataNoExpt on success',
      () async {
    final notification = NotificationModel(
        id: 1,
        title: 'Test Notification',
        date: DateTime.now(),
        type: 'reminder',
        state: 'read',
        text: 'Test Notification',
      );
    when(mockRepositoryLocal.getItem(1)).thenAnswer((_) async => notification);

    final result = await usecaseNotifications.loadNotification(1);

    expect(result.item, notification);
    expect(result.exception, isA<ExptDataNoExpt>());
  });

  test('loadNotification should return exception on unsuccessful load', () async {
    when(mockRepositoryLocal.getItem(1)).thenAnswer((_) async => NotificationModel.init());

    final result = await usecaseNotifications.loadNotification(1);

    expect(result.exception, isA<ExptDataLoad>());
  });

  test('loadNotification should return exception if getItem throws exception', () async {
    when(mockRepositoryLocal.getItem(1)).thenThrow((_) async => throwsException);

    final result = await usecaseNotifications.loadNotification(1);

    expect(result.exception, isA<ExptDataUnknown>());
  });

  test('createNotification should return id and ExptDataNoExpt on success',
      () async {
    final notification = NotificationModel(
        id: 1,
        title: 'Test Notification',
        date: DateTime.now(),
        type: 'reminder',
        state: 'read',
        text: 'Test Notification',
      );
    when(mockRepositoryLocal.saveItem(notification)).thenAnswer((_) async => 1);

    final result = await usecaseNotifications.createNotification(notification);

    expect(result.id, 1);
    expect(result.exception, isA<ExptDataNoExpt>());
  });

    test('createNotification should return exception if saveItem fail', () async {
    final notification = NotificationModel(
        id: 1,
        title: 'Test Notification',
        date: DateTime.now(),
        type: 'reminder',
        state: 'read',
        text: 'Test Notification',
      );
    when(mockRepositoryLocal.saveItem(notification)).thenAnswer((_) async => 0);

    final result = await usecaseNotifications.createNotification(notification);

    expect(result.exception, isA<ExptDataSave>());
  });

  test('createNotification should return exception if saveItem throws exception', () async {
    final notification = NotificationModel(
        id: 1,
        title: 'Test Notification',
        date: DateTime.now(),
        type: 'reminder',
        state: 'read',
        text: 'Test Notification',
      );
    when(mockRepositoryLocal.saveItem(notification)).thenThrow((_) async => throwsException);

    final result = await usecaseNotifications.createNotification(notification);

    expect(result.exception, isA<ExptDataUnknown>());
  });

  test('removeNotification should return id and ExptDataNoExpt on success',
      () async {
    when(mockRepositoryLocal.deleteItem(1)).thenAnswer((_) async => 1);

    final result = await usecaseNotifications.removeNotification(1);

    expect(result.id, 1);
    expect(result.exception, isA<ExptDataNoExpt>());
  });

    test('removeNotification should execption if deleteItem fails',
      () async {
    when(mockRepositoryLocal.deleteItem(1)).thenAnswer((_) async => 0);

    final result = await usecaseNotifications.removeNotification(1);

    expect(result.id, 0);
    expect(result.exception, isA<ExptDataDelete>());
  });

      test('removeNotification should execption if deleteItem throwsException',
      () async {
    when(mockRepositoryLocal.deleteItem(1)).thenThrow((_) async => throwsException);

    final result = await usecaseNotifications.removeNotification(1);


    expect(result.exception, isA<ExptDataUnknown>());
  });



  test(
      'removeAllNotifications should return count and ExptDataNoExpt on success',
      () async {
    when(mockRepositoryLocal.deleteAll()).thenAnswer((_) async => 1);

    final result = await usecaseNotifications.removeAllNotifications();

    expect(result.count, 1);
    expect(result.exception, isA<ExptDataNoExpt>());
  });

    test(
      'removeAllNotifications should return exception if deleteAll throwsException',
      () async {
    when(mockRepositoryLocal.deleteAll()).thenThrow((_) async => throwsException);

    final result = await usecaseNotifications.removeAllNotifications();

    expect(result.exception, isA<ExptDataUnknown>());
  });

  test(
      'fetchNotification should return ExptDataNoExpt and ExptWebNoExpt on success',
      () async {
    final notification =NotificationModel(
        id: 1,
        title: 'Test Notification',
        date: DateTime.now(),
        type: 'reminder',
        state: 'read',
        text: 'Test Notification',
      );
    when(mockRepositoryRemote.getItem(1)).thenAnswer((_) async => notification);
    when(mockRepositoryLocal.saveItem(notification)).thenAnswer((_) async => 1);

    final result = await usecaseNotifications.fetchNotification(1);

    expect(result.exptData, isA<ExptDataNoExpt>());
    expect(result.exptWeb, isA<ExptWebNoExpt>());
  });

    test(
      'fetchNotification should return exception if saveItem fails',
      () async {
            final notification =NotificationModel(
        id: 1,
        title: 'Test Notification',
        date: DateTime.now(),
        type: 'reminder',
        state: 'read',
        text: 'Test Notification',
      );
    when(mockRepositoryRemote.getItem(1)).thenAnswer((_) async => notification);
    when(mockRepositoryLocal.saveItem(notification)).thenAnswer((_) async => 0);

    final result = await usecaseNotifications.fetchNotification(1);

    expect(result.exptWeb, isA<ExptWebNoExpt>());
    expect(result.exptData, isA<ExptDataSave>());

  });

  test(
      'fetchNotification should return exception if saveItem throws exception',
      () async {
            final notification =NotificationModel(
        id: 1,
        title: 'Test Notification',
        date: DateTime.now(),
        type: 'reminder',
        state: 'read',
        text: 'Test Notification',
      );
    when(mockRepositoryRemote.getItem(1)).thenAnswer((_) async => notification);
    when(mockRepositoryLocal.saveItem(notification)).thenThrow((_) async => throwsException);

    final result = await usecaseNotifications.fetchNotification(1);

    expect(result.exptWeb, isA<ExptWebUnknown>());
    expect(result.exptData, isA<ExptDataUnknown>());
  });

  test(
      'sendNotification should return updated notification and ExptWebNoExpt on success',
      () async {
    final notification =
        NotificationModel(
        id: 1,
        title: 'Test Notification',
        date: DateTime.now(),
        type: 'reminder',
        state: 'read',
        text: 'Test Notification',
      );
    when(mockRepositoryRemote.putItem(id: 1, jsonData: notification.toJson()))
        .thenAnswer((_) async => notification);

    final result = await usecaseNotifications.sendNotification(notification);

    expect(result.item, notification);
    expect(result.exception, isA<ExptWebNoExpt>());
  });

    test(
      'sendNotification should return exception if putItem throws exception',
      () async {
    final notification =
        NotificationModel(
        id: 1,
        title: 'Test Notification',
        date: DateTime.now(),
        type: 'reminder',
        state: 'read',
        text: 'Test Notification',
      );
    when(mockRepositoryRemote.putItem(id: 1, jsonData: notification.toJson()))
        .thenThrow((_) async => throwsException);

    final result = await usecaseNotifications.sendNotification(notification);

    expect(result.exception, isA<ExptWebUnknown>());
  });

  test(
      'receiveAllNotifications should return list of notifications and ExptWebNoExpt on success',
      () async {
    final notifications = [
      NotificationModel(
        id: 1,
        title: 'Test Notification',
        date: DateTime.now(),
        type: 'reminder',
        state: 'read',
        text: 'Test Notification',
      ),
    ];
    when(mockRepositoryRemote.getList()).thenAnswer((_) async => notifications);

    final result = await usecaseNotifications.receiveAllNotifications();

    expect(result.list, notifications);
    expect(result.exception, isA<ExptWebNoExpt>());
  });

test(
      'receiveAllNotifications should return exception if getList fails',
      () async {
        when(mockRepositoryRemote.getList()).thenAnswer((_) async => []);

        final result = await usecaseNotifications.receiveAllNotifications();

        expect(result.exception, isA<ExptWebGet>());
  });


    test(
      'receiveAllNotifications should return exception if getList throws exception',
      () async {
    when(mockRepositoryRemote.getList()).thenThrow((_) async => throwsException);

    final result = await usecaseNotifications.receiveAllNotifications();

    expect(result.exception, isA<ExptWebUnknown>());
  });

  test(
      'receiveNotification should return notification and ExptWebNoExpt on success',
      () async {
    final notification = NotificationModel(
        id: 1,
        title: 'Test Notification',
        date: DateTime.now(),
        type: 'reminder',
        state: 'read',
        text: 'Test Notification',
      );
    when(mockRepositoryRemote.getItem(1)).thenAnswer((_) async => notification);

    final result = await usecaseNotifications.receiveNotification(1);

    expect(result.item, notification);
    expect(result.exception, isA<ExptWebNoExpt>());
  });

  test(
      'receiveNotification should return exception if getItem throws exception',
      () async {
    when(mockRepositoryRemote.getItem(1)).thenThrow((_) async => throwsException);

    final result = await usecaseNotifications.receiveNotification(1);

    expect(result.exception, isA<ExptWebUnknown>());
  });
}
