enum HomeTabId {
  SHOPPING,
  CARD_MANAGEMENT,
  USER_SETTINGS,
  CONTRIB,
}

HomeTabId homeTabIndex2Id(int index) {
  HomeTabId id = HomeTabId.SHOPPING;
  switch (index) {
    case 0:
      id = HomeTabId.SHOPPING;
      break;
    case 1:
      id = HomeTabId.CARD_MANAGEMENT;
      break;
    case 2:
      id = HomeTabId.USER_SETTINGS;
      break;
    case 3:
      id = HomeTabId.CONTRIB;
      break;
    default:
      id = HomeTabId.SHOPPING;
  }
  return id;
}

int homeTabId2Index(HomeTabId id) {
  int index = 0;
  switch (id) {
    case HomeTabId.SHOPPING:
      index = 0;
      break;
    case HomeTabId.CARD_MANAGEMENT:
      index = 1;
      break;
    case HomeTabId.USER_SETTINGS:
      index = 2;
      break;
    case HomeTabId.CONTRIB:
      index = 3;
      break;
    default:
      index = 0;
  }
  return index;
}
