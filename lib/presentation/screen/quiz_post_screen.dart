// Dart imports:

// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

// Project imports:
import '../../presentation/utility/error_handler.dart';
import '../../presentation/utility/widget_utils.dart';
import '../../presentation/widget/form/choices_form_field.dart';
import '../../presentation/widget/form/image_form_field.dart';
import '../../domain/models/quiz_post/quiz_post_data.dart';
import '../../provider/quiz_form_use_case_provider.dart';
import '../../provider/quiz_post_use_case_provider.dart';

class QuizPostScreen extends HookConsumerWidget {
  final _formKey = GlobalKey<FormState>();

  QuizPostScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final postState = ref.watch(quizPostUseCaseProvider);
    final List<Widget> children = [];

    final appLocalizations = AppLocalizations.of(context)!;
    children.add(Scaffold(
      appBar: AppBar(
        title: Text(appLocalizations.enterQuizPrompt),
      ),
      body: SingleChildScrollView(
        child: _form(context, ref),
      ),
    ));

    if (postState is AsyncLoading) {
      children.add(WidgetUtils.loadingScreen(context));
    } else if (postState is AsyncError) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        ErrorHandler.showErrorDialog(
            context, postState.error, postState.stackTrace);
      });
    } else if (postState is AsyncData) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        Navigator.pop(context);
      });
    }

    return Stack(children: children);
  }

  Widget _form(BuildContext context, WidgetRef ref) {
    final quizFromUseCase = ref.watch(quizFormUseCaseProvider.notifier);
    final appLocalizations = AppLocalizations.of(context)!;
    return Container(
      margin: const EdgeInsets.all(16.0),
      child: Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            TextFormField(
              keyboardType: TextInputType.multiline,
              maxLines: null,
              maxLength: 20,
              decoration: InputDecoration(
                labelText: appLocalizations.title,
                hintText: appLocalizations.enterTitlePrompt,
              ),
              validator: (value) {
                if (value?.isEmpty ?? true) {
                  return appLocalizations.titleMissing;
                }
                return null;
              },
              onSaved: (value) {
                quizFromUseCase.addTitle(value);
              },
            ),
            const SizedBox(height: 16),
            TextFormField(
              keyboardType: TextInputType.multiline,
              maxLines: null,
              maxLength: 100,
              decoration: InputDecoration(
                labelText: appLocalizations.questionPrompt,
                hintText: appLocalizations.enterQuestionPrompt,
              ),
              validator: (value) {
                if (value?.isEmpty ?? true) {
                  return appLocalizations.questionTextMissing;
                }
                return null;
              },
              onSaved: (value) {
                quizFromUseCase.addQuestion(value);
              },
            ),
            const SizedBox(height: 16),
            ImageFormField(
              onSaved: (value) {
                quizFromUseCase.addImage(value);
              },
            ),
            const SizedBox(height: 16),
            ChoicesFormField(
              context,
              onSaved: (value) {
                quizFromUseCase.addChoices(value!.item1);
                quizFromUseCase.addAnswer(value.item2);
              },
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                if (!_formKey.currentState!.validate()) {
                  return;
                }
                // 入力データが正常な場合の処理
                _formKey.currentState!.save();
                var postUseCase = ref.read(quizPostUseCaseProvider.notifier);
                final quizFrom = ref.read(quizFormUseCaseProvider);
                var post = QuizPostData(
                  title: quizFrom.title!,
                  question: quizFrom.question!,
                  choices: quizFrom.choices!,
                  answer: quizFrom.answer!,
                  imageFile: quizFrom.image,
                );
                postUseCase.post(post);
              },
              child: Text(appLocalizations.postQuiz),
            ),
          ],
        ),
      ),
    );
  }
}
