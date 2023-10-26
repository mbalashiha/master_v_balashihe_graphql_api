export default function dateToISO(date: Date): string {
  return date.toISOString().replace(".000", "");
}
