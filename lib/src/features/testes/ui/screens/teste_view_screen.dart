import 'package:alertshow/alertshow.dart';
import 'package:bform/bform.dart';
import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:go_router/go_router.dart';
import 'package:transcriptapp/src/utils/helpers.dart';

import '../../domain/models/teste_model.dart';
import '../widgets/icon_status_widget.dart';

class TesteDetailPage extends StatelessWidget {
  final TesteModel teste;

  const TesteDetailPage({super.key, required this.teste});

  @override
  Widget build(BuildContext context) {
    const space = 10.0;
    return Scaffold(
      appBar: AppBar(
        title: Text(tr('testeDetails.title')), // Use tr() for localization
        backgroundColor: Theme.of(context).colorScheme.primary,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Text(
                teste.exam.name,
                style: Theme.of(context).textTheme.titleMedium,
              ),
            ),
            const SizedBox(height: space),
            _buildInfoRow(
              tr('testeDetails.subject'),
              teste.exam.classe.summary,
            ),
            const SizedBox(height: space),
            Row(
              children: [
                Text(
                  tr('testeDetails.status'),
                  style: Theme.of(context).textTheme.labelLarge,
                ),
                const Spacer(),
                Column(
                  children: [
                    IconStatusWidget(status: teste.status),
                    Text(
                      tr('status.${teste.status}'),
                      style: const TextStyle(fontSize: 8),
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(height: space),
            if (teste.status != 'ongoing' && teste.status != 'pending')
              _buildInfoRow(
                tr('testeDetails.score'),
                teste.score.toStringAsFixed(1),
              ),
            const SizedBox(height: space),
            const BformDivider(),
            _buildInfoRow(tr('testeDetails.examDate'),
                dateHelper(date: teste.createdAt.toString())),
            const SizedBox(height: space),
            _buildInfoRow(tr('testeDetails.createDate'),
                dateHelper(date: teste.exam.createdAt.toString())),
            const BformDivider(),
            const SizedBox(height: 20),
            if (teste.status == 'ongoing' || teste.status == 'pending')
              Center(
                child: BformButton(
                  colors: const [
                    Colors.blueAccent,
                    Colors.lightBlueAccent,
                    Colors.lightBlue
                  ],
                  fontSize: 20,
                  style: BformButtonStyle.highlighted,
                  onPressed: () async {
                    final result = await alertshowDialog(
                      title: tr('testeDetails.startExam'),
                      content: Text(tr('testeDetails.warning')),
                      noButton: tr('testeDetails.no'),
                      yesButton: tr('testeDetails.yes'),
                      context: context,
                    );
                    if (context.mounted && result) {
                      context.pushNamed(
                        'testes-play',
                        extra: {'testeId': teste.id},
                      );
                    }
                  },
                  label: tr('testeDetails.start'),
                ),
              ),
          ],
        ),
      ),
    );
  }

  Widget _buildInfoRow(String label, String value) {
    return Row(
      children: [
        Text(
          label,
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        const Spacer(),
        Text(value, style: TextStyle(color: Colors.grey[700])),
      ],
    );
  }
}
