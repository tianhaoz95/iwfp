function isValidCardData(data) {
  if (!data.id) {
    return false;
  }
  if (!data.name) {
    return false;
  }
}

export default isValidCardData;