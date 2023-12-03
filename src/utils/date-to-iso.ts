export default function dateToISO(date: Date | null): string {
  if (typeof date?.toISOString === "function") {
    return date ? date.toISOString().replace(".000", "") : "";
  } else {
    return "";
    //throw new Error("dateToISO: date is undefined. Aborting.");
  }
}
