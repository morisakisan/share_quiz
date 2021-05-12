import 'package:flutter/material.dart';
import 'package:tuple/tuple.dart';

class ChoicesFormField extends FormField<Tuple2<List<String>, int>> {

  ChoicesFormField(BuildContext context,
      {FormFieldSetter<Tuple2<List<String>, int>>? onSaved})
      : super(
          initialValue: Tuple2([], 0),
          onSaved: onSaved,
          builder: (FormFieldState<Tuple2<List<String>, int>> state) {
            final selectedRadioTile = state.value!.item2;
            Widget? header;
            if (state.value!.item1.length < 5) {
              header = ElevatedButton.icon(
                  label: Text('選択肢を追加する'),
                  icon: Icon(Icons.add),
                  onPressed: () => _showInputTextDialog(context, state));
            }
            return Expanded(
              child: ReorderableListView(
                header: header,
                onReorder: (oldIndex, newIndex) {
                  if (oldIndex < newIndex) {
                    // removing the item at oldIndex will shorten the list by 1.
                    newIndex -= 1;
                  }
                  final list = state.value!.item1;
                  final choice = list.removeAt(oldIndex);
                  list.insert(newIndex, choice);
                  state.didChange(state.value!.withItem1(list).withItem2(newIndex));
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
                        state.didChange(state.value!.withItem2(v as int));
                      },
                      secondary: IconButton(
                        icon: Icon(
                          Icons.delete,
                        ),
                        onPressed: () {
                          final list = state.value!.item1;
                          list.removeAt(idx);
                          state.didChange(state.value!.withItem1(list).withItem2(0));
                        },
                      ),

                    );
                  },
                ).toList(),
              ),
            );
          },
        );

  static _showInputTextDialog(
      BuildContext context, FormFieldState<Tuple2<List<String>, int>> state) {
    showDialog(
      context: context,
      builder: (context) {
        var choice = "";
        return AlertDialog(
          title: Text("選択肢を入力してね！"),
          content: TextField(onChanged: (s) {
            choice = s;
          }),
          actions: <Widget>[
            TextButton(
              child: Text("Cancel"),
              onPressed: () => Navigator.pop(context),
            ),
            TextButton(
              child: Text("OK"),
              onPressed: () {
                final list = state.value!.item1;
                list.add(choice);
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
