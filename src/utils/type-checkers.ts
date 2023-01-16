export const isPositiveInteger = function isPositiveInteger(value: number | string) {
  if (Number.isInteger(value) && value > 0) {
    return true;
  }
  return false;
};
