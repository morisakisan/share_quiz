import 'package:flutter/material.dart';

class ChoicesFormField extends FormField<List<String>> {
  ChoicesFormField(BuildContext context,
      {FormFieldSetter<List<String>>? onSaved})
      : super(
          initialValue: [],
          onSaved: onSaved,
          builder: (FormFieldState<List<String>> state) {
            return Expanded(
              child: ReorderableListView(
                header: ElevatedButton.icon(
                  onPressed: () {
                    final list = state.value!;
                    if(list.length == 5) {
                      return;
                    }
                    list.add("");
                    state.didChange(list);
                  },
                  label: Text('選択肢を追加する'),
                  icon: Icon(Icons.add),
                ),
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
                    return Card(
                      elevation: 2.0,
                      key: Key(idx.toString()),
                      child: ListTile(
                        title: Text(val),
                      ),
                    );
                  },
                ).toList(),
              ),
            );
          },
        );
}
