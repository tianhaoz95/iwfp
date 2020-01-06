import 'package:flutter/material.dart';

enum DataStoreMode {
  ONLINE,
  OFFLINE,
  IN_MEMORY,
}

class DataStoreModeSelection extends StatefulWidget {
  @override
  _DataStoreModeSelection createState() {
    return _DataStoreModeSelection();
  }
}

class _DataStoreModeSelection extends State<DataStoreModeSelection> {
  String label = 'Online Mode';
  String getDataStoreModelSelectionText(DataStoreMode mode) {
    switch (mode) {
      case DataStoreMode.ONLINE:
        label = 'Online Mode';
        break;
      case DataStoreMode.OFFLINE:
        label = 'Offline Mode';
        break;
      case DataStoreMode.IN_MEMORY:
        label = 'In Memory';
        break;
      default:
        label = 'Unknown Mode';
    }
    return label;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(5.0, 0.0, 5.0, 0.0),
      child: Row(
        children: <Widget>[
          Text(label),
          PopupMenuButton<DataStoreMode>(
            icon: Icon(
              Icons.arrow_drop_down_circle,
            ),
            initialValue: DataStoreMode.ONLINE,
            onSelected: (DataStoreMode nextMode) {
              setState(() {
                label = getDataStoreModelSelectionText(nextMode);
              });
            },
            itemBuilder: (BuildContext context) =>
                <PopupMenuEntry<DataStoreMode>>[
              const PopupMenuItem<DataStoreMode>(
                value: DataStoreMode.ONLINE,
                child: Text('Online Mode'),
              ),
              const PopupMenuItem<DataStoreMode>(
                value: DataStoreMode.OFFLINE,
                child: Text('Offline Mode'),
              ),
              const PopupMenuItem<DataStoreMode>(
                value: DataStoreMode.IN_MEMORY,
                child: Text('In-memory Mode'),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
