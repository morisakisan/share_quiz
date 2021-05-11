import 'package:flutter/material.dart';

class ChoicesFormField extends FormField<List<String>> {
  ChoicesFormField({FormFieldSetter<List<String>>? onSaved})
      : super(
          initialValue: ["a", "i", "u"],
          onSaved: onSaved,
          builder: (FormFieldState<List<String>> state) {
            return Expanded(
              child: ReorderableListView(
                onReorder: (oldIndex, newIndex) {
                  if (oldIndex < newIndex) {
                    // removing the item at oldIndex will shorten the list by 1.
                    newIndex -= 1;
                  }
                  final list = state.value;
                  if (list == null) {
                    return;
                  }

                  final choice = list.removeAt(oldIndex);
                  list.insert(newIndex, choice);
                  state.didChange(list);
                },
                children: state.value!.map(
                  (String model) {
                    return Card(
                      elevation: 2.0,
                      key: Key(model),
                      child: ListTile(
                        title: Text(model),
                      ),
                    );
                  },
                ).toList(),
              ),
            );
          },
        );
}
