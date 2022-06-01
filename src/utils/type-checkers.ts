export const isPositiveInteger = function isPositiveInteger(value) {
  if (Number.isInteger(value) && value > 0) {
    return true;
  }
  return false;
};
