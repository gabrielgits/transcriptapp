import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:transcriptapp/src/core/helpers/date_helper.dart';
import 'package:transcriptapp/src/core/presenter/screens/no_data_view.dart';
import 'package:transcriptapp/src/core/presenter/screens/show_error_view.dart';
import 'package:transcriptapp/src/features/exams/domain/models/teste_model.dart';

import '../controllers/testes_controller.dart';
import 'icon_status_widget.dart';

class LastTestesWidget extends ConsumerWidget {
  const LastTestesWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    const space = 10.0;

    final controller = ref.watch(getReportTestesProvider);

    return controller.when(
      loading: () => const Center(child: CircularProgressIndicator()),
      error: (error, _) => ShowErrorView(
        title: 'Error on get testes',
        detail: error.toString(),
        onPressed: () => {},
      ),
      data: (testeReport) {
        if (testeReport['testes'].isEmpty) {
          return NoDataView(title: tr('testes.title'));
        }
        return InkWell(
          onTap: () => context.pushNamed('testes'),
          child: Column(
            children: [
              Text(tr('home.examsPoints'),
                  style: Theme.of(context).textTheme.titleSmall),
              const SizedBox(height: space / 2),
              for (TesteModel teste in testeReport['testes'])
                ListTile(
                  leading: const CircleAvatar(
                    backgroundImage:
                        AssetImage('assets/images/icons/app_icon.png'),
                  ),
                  title: Text(teste.exam.name),
                  subtitle: Text(
                      '${tr('testes.date')}: ${dateHelper(date: teste.createdAt.toString())} - ${tr('testes.score')}: ${teste.score}',
                      style: Theme.of(context).textTheme.bodySmall),
                  trailing: Column(
                    children: [
                      IconStatusWidget(status: teste.status),
                      Text(
                        tr('status.${teste.status}'),
                        style: const TextStyle(fontSize: 8),
                      ),
                    ],
                  ),
                ),
              const SizedBox(height: space / 2),
              Text(
                "${tr('testes.average')} : ${testeReport['average'].toStringAsFixed(1)} ${tr('testes.score')}",
                style: Theme.of(context).textTheme.titleSmall,
              ),
              const Spacer(),
              Text(
                tr('home.touch'),
                style: Theme.of(context).textTheme.bodySmall,
              ),
            ],
          ),
        );
      },
    );
  }
}
