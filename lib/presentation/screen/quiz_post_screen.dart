// Dart imports:

// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

// Project imports:
import 'package:share_quiz/data/repository_impl/quiz_post_repository_impl.dart';
import 'package:share_quiz/domain/models/quiz_form/quiz_form.dart';
import 'package:share_quiz/domain/repository/quiz_post_repository.dart';
import 'package:share_quiz/domain/use_cases/quiz_form_use_case.dart';
import 'package:share_quiz/domain/use_cases/quiz_post_use_case.dart';
import 'package:share_quiz/presentation/utility/firebase_error_handler.dart';
import 'package:share_quiz/presentation/utility/widget_utils.dart';
import 'package:share_quiz/presentation/widget/form/choices_form_field.dart';
import 'package:share_quiz/presentation/widget/form/image_form_field.dart';
import '../../domain/models/quiz_post/quiz_post_data.dart';

final _quizPostRepositoryProvider =
    Provider.autoDispose<QuizPostRepository>((ref) {
  return QuizPostRepositoryImpl();
});

final _postNotifierProvider =
    StateNotifierProvider.autoDispose<QuizPostUseCase, AsyncValue<Object?>?>(
        (ref) {
  return QuizPostUseCase(ref.read(_quizPostRepositoryProvider));
});

final _formNotifierProvider =
    StateNotifierProvider.autoDispose<QuizFromUseCase, QuizForm>((ref) {
  return QuizFromUseCase();
});

class QuizPostScreen extends HookConsumerWidget {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final postState = ref.watch(_postNotifierProvider);
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
        FirebaseErrorHandler.showErrorDialog(
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
    final quizFromUseCase = ref.watch(_formNotifierProvider.notifier);
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
                var postUseCase = ref.read(_postNotifierProvider.notifier);
                final quizFrom = ref.read(_formNotifierProvider);
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
