import 'package:flutter/material.dart';

class ChoicesFormField extends FormField<List<String>> {
  ChoicesFormField(BuildContext context,
      {FormFieldSetter<List<String>>? onSaved})
      : super(
          initialValue: [],
          onSaved: onSaved,
          builder: (FormFieldState<List<String>> state) {
            Widget? header;
            if (state.value!.length < 5) {
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
                  final list = state.value!;
                  final choice = list.removeAt(oldIndex);
                  list.insert(newIndex, choice);
                  state.didChange(list);
                },
                children: state.value!.asMap().entries.map(
                  (entry) {
                    final idx = entry.key;
                    final val = entry.value;
                    return ListTile(
                      key: Key(idx.toString()),
                      trailing: IconButton(
                        icon: Icon(
                          Icons.delete,
                        ),
                        onPressed: () {
                          final list = state.value!;
                          list.removeAt(idx);
                          state.didChange(list);
                        },
                      ),
                      title: Text(val),
                    );
                  },
                ).toList(),
              ),
            );
          },
        );

  static _showInputTextDialog(
      BuildContext context, FormFieldState<List<String>> state) {
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
                final list = state.value!;
                list.add(choice);
                state.didChange(list);
                Navigator.pop(context);
              },
            ),
          ],
        );
      },
    );
  }
}
