import os from "os";

export default async function executeTasksConcurrently(
  list: Array<() => Promise<any>>,
  concurrencyLimit?: number | undefined
): Promise<void> {
  if (!concurrencyLimit) {
    concurrencyLimit = Math.floor(os.cpus().length / 1.5);
    if (concurrencyLimit < 2) {
      concurrencyLimit = 2;
    }
  }
  //   console.l//og("concurrencyLimit:", concurrencyLimit);
  //   d//ebugger;
  let activeTasks: Array<Promise<any>> = [];

  for (const item of list) {
    if (activeTasks.length >= concurrencyLimit) {
      await Promise.race(activeTasks);
    }
    console.log(`Start task: ${item}`);
    const activeTask = item()
      .then(() => {
        activeTasks.splice(activeTasks.indexOf(activeTask), 1);
        console.log(`End task: ${item}`);
      })
      .catch(() => {
        activeTasks.splice(activeTasks.indexOf(activeTask), 1);
        console.log(`End task: ${item}`);
      });
    activeTasks.push(activeTask);
  }
}
