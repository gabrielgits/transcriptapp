import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:transcriptapp/src/utils/date_helper.dart';
import 'package:transcriptapp/src/shared/ui/screens/no_data_view.dart';
import 'package:transcriptapp/src/shared/ui/screens/show_error_view.dart';
import 'package:transcriptapp/src/shared/ui/widgets/custom_appbar_widget.dart';
import 'package:transcriptapp/src/shared/ui/widgets/loading_widget.dart';

import '../../domain/models/teste_model.dart';
import '../controllers/testes_controller.dart';
import '../widgets/icon_status_widget.dart';

class TestesListScreen extends ConsumerWidget {
  const TestesListScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final controller = ref.watch(getAllTestesProvider);

    return Scaffold(
      appBar: CustomAppbarWidget(
        title: tr('testes.title'),
      ),
      body: controller.when(
        loading: () => const Center(child: LoadingWidget()),
        error: (error, _) => ShowErrorView(
          title: 'Error on get testes',
          detail: error.toString(),
          onPressed: () => {},
        ),
        data: (testes) {
          if (testes.isEmpty) {
            return NoDataView(title: tr('testes.title'));
          }
          return ListView.builder(
            itemCount: testes.length,
            itemBuilder: (context, index) {
              final teste = testes[index];

              return Container(
                margin: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.primaryContainer,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: ListTile(
                  leading: const CircleAvatar(
                    backgroundImage:
                        AssetImage('assets/images/icons/app_icon.png'),
                  ),
                  title: Text(teste.exam.name),
                  subtitle: Text(
                      '${tr('testes.date')}: ${dateHelper(date: teste.createdAt.toString())} - ${tr('testes.score')}: ${teste.score}',
                      style: Theme.of(context).textTheme.labelSmall),
                  trailing: Column(
                    children: [
                      IconStatusWidget(status: teste.status),
                      Text(
                        tr('status.${teste.status}'),
                        style: const TextStyle(fontSize: 8),
                      ),
                    ],
                  ),
                  onTap: () {
                    context.pushNamed(
                      'testes-detail',
                      extra: {'teste': teste},
                    );
                  },
                ),
              );
            },
          );
        },
      ),
      bottomNavigationBar: Container(
        height: 30,
        color: Theme.of(context).colorScheme.primaryContainer,
        child: Center(
          child: Builder(
            builder: (context) {
              final testes = ref.watch(getAllTestesProvider).value;
              return Text(
                "${tr('testes.average')} : ${_averageScore(testes).toStringAsFixed(1)} ${tr('testes.score')}",
                style: Theme.of(context).textTheme.titleSmall,
              );
            }
          ),
        ),
      ),
    );
  }
}

double _averageScore(List<TesteModel>? testes) {
  if (testes == null || testes.isEmpty) {
    return 0;
  }
  double sum = 0;
  for (TesteModel teste in testes) {
    sum += teste.score;
  }
  return sum / testes.length;
}
