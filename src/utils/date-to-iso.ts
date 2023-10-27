export default function dateToISO(date: Date | null): string {
  return date ? date.toISOString().replace(".000", "") : "";
}
