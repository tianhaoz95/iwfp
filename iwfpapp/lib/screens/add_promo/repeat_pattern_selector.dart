import 'package:flutter/material.dart';
import 'package:iwfpapp/services/config/consts/repeat_pattern_list.dart';
import 'package:iwfpapp/services/config/consts/repeat_pattern_lookup.dart';
import 'package:iwfpapp/services/config/typedefs/repeat_pattern.dart';

typedef void RepeatPatternChangeHandler(CashbackPromoRepeatPattern type);

class RepeatPatternSelector extends StatefulWidget {
  final RepeatPatternChangeHandler onRepeatPatternChange;
  const RepeatPatternSelector(this.onRepeatPatternChange);
  @override
  _RepeatPatternSelector createState() {
    return _RepeatPatternSelector();
  }
}

class _RepeatPatternSelector extends State<RepeatPatternSelector> {
  CashbackPromoRepeatPattern selected;

  @override
  void initState() {
    super.initState();
    selected = CashbackPromoRepeatPattern.CONST;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: ShapeDecoration(
        shape: RoundedRectangleBorder(
          side: BorderSide(
              width: 1.0, style: BorderStyle.solid, color: Colors.grey),
          borderRadius: BorderRadius.all(Radius.circular(5.0)),
        ),
      ),
      child: Container(
        padding: EdgeInsets.fromLTRB(15.0, 5.0, 15.0, 5.0),
          child: DropdownButton<CashbackPromoRepeatPattern>(
        hint: Text('Select the type of the promotion'),
        underline: Container(),
        icon: Icon(Icons.arrow_downward),
        value: this.selected,
        onChanged: (CashbackPromoRepeatPattern val) {
          setState(() {
            selected = val;
          });
        },
        items: repeatPatternList.map<DropdownMenuItem<CashbackPromoRepeatPattern>>(
            (CashbackPromoRepeatPattern repeatPattern) {
          return DropdownMenuItem<CashbackPromoRepeatPattern>(
            value: repeatPattern,
            child: Text(repeatPatternNameLookup[repeatPattern]),
          );
        }).toList(),
      )),
    );
  }
}
