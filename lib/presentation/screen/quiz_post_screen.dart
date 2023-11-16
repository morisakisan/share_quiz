// Dart imports:

// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

// Project imports:
import 'package:share_quiz/domain/models/quiz_form/quiz_form.dart';
import 'package:share_quiz/domain/use_cases/quiz_post_use_case.dart';
import '../../domain/models/quiz_post/quiz_post_data.dart';
import '../../presentation/utility/error_handler.dart';
import '../../presentation/widget/form/choices_form_field.dart';
import '../../presentation/widget/form/image_form_field.dart';
import '../../provider/quiz_form_use_case_provider.dart';
import '../../provider/quiz_post_use_case_provider.dart';
import '../common/custom_alert_dialog.dart';
import '../common/loading_screen.dart';

class QuizPostScreen extends HookConsumerWidget {
  const QuizPostScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final formKey = GlobalKey<FormState>();
    final postState = ref.watch(quizPostUseCaseProvider);
    final appLocalizations = AppLocalizations.of(context)!;

    if (postState is AsyncError) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        ErrorHandler.showErrorDialog(
            context, postState.error, postState.stackTrace);
      });
    } else if (postState is AsyncData) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        Navigator.pop(context);
      });
    }

    return Stack(children: [
      Scaffold(
        appBar: AppBar(
          title: Text(appLocalizations.enterQuizPrompt),
        ),
        body: _QuizPostForm(formKey: formKey),
        floatingActionButton: FloatingActionButton.extended(
          onPressed: () {
            if (!formKey.currentState!.validate()) {
              return;
            }
            formKey.currentState!.save();
            var postUseCase = ref.read(quizPostUseCaseProvider.notifier);
            final quizForm = ref.read(quizFormUseCaseProvider);
            _showPostDialog(context, quizForm, postUseCase);
          },
          icon: const Icon(Icons.send),
          label: Text(appLocalizations.postQuiz),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      ),
      if (postState is AsyncLoading) const LoadingScreen()
    ]);
  }

  _showPostDialog(
      BuildContext context, QuizForm quizForm, QuizPostUseCase postUseCase) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext dialogContext) {
        return CustomAlertDialog(
          title: "投稿",
          message: "クイズを投稿します。よろしいですか？",
          onOkPressed: () {
            var post = QuizPostData(
              title: quizForm.title!,
              question: quizForm.question!,
              choices: quizForm.choices!,
              answer: quizForm.answer!,
              imageFile: quizForm.image,
            );
            postUseCase.post(post);
          },
        );
      },
    );
  }
}

class _QuizPostForm extends HookConsumerWidget {
  final GlobalKey<FormState> formKey;

  const _QuizPostForm({required this.formKey});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final quizFromUseCase = ref.watch(quizFormUseCaseProvider.notifier);
    final appLocalizations = AppLocalizations.of(context)!;
    return SingleChildScrollView(
      child: Container(
        margin: const EdgeInsets.all(16.0),
        child: Form(
          key: formKey,
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
              )
            ],
          ),
        ),
      ),
    );
  }
}
