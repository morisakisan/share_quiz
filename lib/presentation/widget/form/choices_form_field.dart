// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:tuple/tuple.dart';

class ChoicesFormField extends FormField<Tuple2<List<String>, int>> {
  ChoicesFormField(BuildContext context,
      {super.key, super.onSaved})
      : super(
          initialValue: const Tuple2([], 0),
          validator: (value) {
            final appLocalizations = AppLocalizations.of(context)!;
            final list = value!.item1;
            if (list.length < 2) {
              return appLocalizations.minimumChoicePrompt;
            }
            final a = list.toSet().toList();
            var isDistinct = list.length != a.length;
            if (isDistinct) {
              return appLocalizations.duplicateChoiceWarning;
            }

            return null;
          },
          builder: (FormFieldState<Tuple2<List<String>, int>> state) {
            final selectedRadioTile = state.value!.item2;
            final footerChildren = <Widget>[];
            final appLocalizations = AppLocalizations.of(context)!;

            if (state.value!.item1.length > 1) {
              footerChildren.add(
                const SizedBox(
                  height: 8,
                ),
              );
              footerChildren.add(
                Text(
                  appLocalizations.markCorrectChoice,
                ),
              );
            }

            if (state.value!.item1.length < 5) {
              footerChildren.add(
                const SizedBox(
                  height: 8,
                ),
              );
              footerChildren.add(
                TextButton.icon(
                  label: Text(appLocalizations.addChoicePrompt),
                  icon: const Icon(Icons.add),
                  onPressed: () => _showInputTextDialog(context, state),
                ),
              );
            }

            if (state.hasError) {
              footerChildren.add(
                const SizedBox(
                  height: 8,
                ),
              );
              footerChildren.add(
                Text(
                  state.errorText!,
                  style: TextStyle(
                    fontSize: 12,
                    color: Colors.red[400],
                  ),
                ),
              );
            }

            return ReorderableListView(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              header: Container(
                alignment: Alignment.topLeft,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  // mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      appLocalizations.choiceLabel,
                    )
                  ],
                ),
              ),
              footer: Container(
                alignment: Alignment.topLeft,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  // mainAxisSize: MainAxisSize.min,
                  children: footerChildren,
                ),
              ),
              onReorder: (oldIndex, newIndex) {
                if (oldIndex < newIndex) {
                  // removing the item at oldIndex will shorten the list by 1.
                  newIndex -= 1;
                }
                final list = state.value!.item1;
                final choice = list.removeAt(oldIndex);
                list.insert(newIndex, choice);
                state.didChange(
                  state.value!.withItem1(list).withItem2(newIndex),
                );
              },
              children: state.value!.item1.asMap().entries.map(
                (entry) {
                  final idx = entry.key;
                  final val = entry.value;
                  return RadioListTile(
                    key: Key(idx.toString()),
                    value: idx,
                    groupValue: selectedRadioTile,
                    title: Text(val),
                    onChanged: (v) {
                      state.didChange(
                        state.value!.withItem2(v as int),
                      );
                    },
                    secondary: IconButton(
                      icon: const Icon(
                        Icons.delete,
                      ),
                      onPressed: () {
                        final list = state.value!.item1;
                        list.removeAt(idx);
                        state.didChange(
                          state.value!.withItem1(list).withItem2(0),
                        );
                      },
                    ),
                  );
                },
              ).toList(),
            );
          },
        );

  static _showInputTextDialog(
      BuildContext context, FormFieldState<Tuple2<List<String>, int>> state) {
    final appLocalizations = AppLocalizations.of(context)!;
    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (context) {
        String? choice;
        final formKey = GlobalKey<FormState>();
        return AlertDialog(
          title: Text(appLocalizations.enterChoicePrompt),
          content: Form(
            key: formKey,
            child: TextFormField(
              keyboardType: TextInputType.multiline,
              maxLines: null,
              maxLength: 30,
              decoration: InputDecoration(
                labelText: appLocalizations.choiceLabel,
                hintText: appLocalizations.enterChoicePrompt,
              ),
              validator: (value) {
                if (value?.isEmpty ?? true) {
                  return appLocalizations.choiceMissing;
                }
                return null;
              },
              onSaved: (value) {
                choice = value;
              },
            ),
          ),
          actions: [
            TextButton(
              child: Text(appLocalizations.cancel),
              onPressed: () => Navigator.pop(context),
            ),
            TextButton(
              child: Text(appLocalizations.ok),
              onPressed: () {
                if (!formKey.currentState!.validate()) return;
                // 入力データが正常な場合の処理
                formKey.currentState!.save();

                final list = state.value!.item1;
                list.add(choice!);
                state.didChange(state.value!.withItem1(list));
                Navigator.pop(context);
              },
            ),
          ],
        );
      },
    );
  }
}
