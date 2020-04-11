function isValidCardData(data) {
  if (!data.id) {
    return false;
  }
  if (!data.name) {
    return false;
  }
  return true;
}

export default isValidCardData;
