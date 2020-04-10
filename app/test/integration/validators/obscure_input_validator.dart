import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';

RenderEditable findRenderEditable(WidgetTester tester, Key key) {
  final RenderObject root = tester.renderObject(find.byKey(key));
  expect(root, isNotNull);

  RenderEditable renderEditable;
  void recursiveFinder(RenderObject child) {
    if (child is RenderEditable) {
      renderEditable = child;
      return;
    }
    child.visitChildren(recursiveFinder);
  }

  root.visitChildren(recursiveFinder);
  expect(renderEditable, isNotNull);
  return renderEditable;
}

Future<void> textInputIsObscure(WidgetTester tester, Key key) async {
  await tester.showKeyboard(find.byKey(key));
  const String testValue = 'ABC';
  tester.testTextInput.updateEditingValue(const TextEditingValue(
    text: testValue,
    selection: TextSelection.collapsed(offset: testValue.length),
  ));
  await tester.pump();

  // Enter a character into the obscured field and verify that the character
  // is temporarily shown to the user and then changed to a bullet.
  const String newChar = 'X';
  tester.testTextInput.updateEditingValue(const TextEditingValue(
    text: testValue + newChar,
    selection: TextSelection.collapsed(offset: testValue.length + 1),
  ));

  await tester.pump();

  String editText = findRenderEditable(tester, key).text.text;
  expect(editText.substring(editText.length - 1), newChar);

  await tester.pump(const Duration(seconds: 2));

  editText = findRenderEditable(tester, key).text.text;
  expect(editText.substring(editText.length - 1), '\u2022');
}
