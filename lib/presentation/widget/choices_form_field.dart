// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:tuple/tuple.dart';

class ChoicesFormField extends FormField<Tuple2<List<String>, int>> {
  ChoicesFormField(BuildContext context,
      {FormFieldSetter<Tuple2<List<String>, int>>? onSaved})
      : super(
          initialValue: Tuple2([], 0),
          onSaved: onSaved,
          validator: (value) {
            final list = value!.item1;
            if (list.length < 2) {
              return "選択肢は二つ以上いれてね";
            }
            final a = list.toSet().toList();
            var isDistinct = list.length != a.length;
            if (isDistinct) {
              return "重複する選択肢があるよ";
            }

            return null;
          },
          builder: (FormFieldState<Tuple2<List<String>, int>> state) {
            final selectedRadioTile = state.value!.item2;
            final headerChildren = <Widget>[];
            headerChildren.add(
              const Text(
                "選択肢",
              ),
            );
            if (state.value!.item1.length < 5) {
              headerChildren.add(
                SizedBox(
                  height: 16,
                ),
              );
              headerChildren.add(
                ElevatedButton.icon(
                  label: const Text('選択肢を追加する'),
                  icon: Icon(Icons.add),
                  onPressed: () => _showInputTextDialog(context, state),
                ),
              );
            }
            if (state.value!.item1.isNotEmpty) {
              headerChildren.add(
                SizedBox(
                  height: 16,
                ),
              );
              headerChildren.add(
                const Text(
                  "正解の選択肢にチェックを入れてください",
                ),
              );
            }

            if (state.hasError) {
              headerChildren.add(
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
                margin: EdgeInsets.only(),
                alignment: Alignment.topLeft,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  // mainAxisSize: MainAxisSize.min,
                  children: headerChildren,
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
                      icon: Icon(
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
    showDialog(
      context: context,
      builder: (context) {
        String? choice;
        final _formKey = GlobalKey<FormState>();
        return AlertDialog(
          title: const Text("選択肢を入力してね"),
          content: Form(
            key: _formKey,
            child: TextFormField(
              keyboardType: TextInputType.multiline,
              maxLines: null,
              maxLength: 30,
              decoration: const InputDecoration(
                labelText: "選択肢",
                hintText: '選択肢を入力してね',
              ),
              validator: (value) {
                if (value?.isEmpty ?? true) {
                  return '選択肢がはいってないよ';
                }
                return null;
              },
              onSaved: (value) {
                choice = value;
              },
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: const Text("Cancel"),
              onPressed: () => Navigator.pop(context),
            ),
            TextButton(
              child: const Text("OK"),
              onPressed: () {
                if (!_formKey.currentState!.validate()) return;
                // 入力データが正常な場合の処理
                _formKey.currentState!.save();

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
