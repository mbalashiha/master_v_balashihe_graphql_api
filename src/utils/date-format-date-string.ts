export default function formatDateString(date: Date | null): string {
  if (date) {
    return `${date.getDate().toString().padStart(2, "0")}.${(
      date.getMonth() + 1
    )
      .toString()
      .padStart(2, "0")}.${date.getFullYear().toString().padStart(4, "0")}`;
  } else {
    throw new Error("formatDateString: no date.");
  }
}
