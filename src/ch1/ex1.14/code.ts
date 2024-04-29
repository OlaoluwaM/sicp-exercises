// https://replit.com/@OlaoluwaM/CountingChangeTS#index.ts
// Port over the first-denomination function from the scheme version too

const denominations = [50, 25, 10, 5, 1];

type Denominations = typeof denominations;
type K = Denominations["length"];

function countingChange(amount: number, k: K = 5): number {
  if (amount === 0) return 1;
  if (k === 0 || amount < 0) return 0;
  const firstDenomination = denominations[k - 1];
  return (
    countingChange(amount, k - 1) +
    countingChange(amount - firstDenomination, k)
  );
}

function countingChangeTwo(amount: number, k: K = 5) {
  const store = new Map();

  const innerFn = () => {
    if (amount === 0) return 1;
    if (k === 0 || amount < 0) return 0;
    const firstDenomination = denominations[k - 1];

    const key = [amount, k].toString();
    const count =
      store.get(key) ??
      countingChange(amount, k - 1) +
        countingChange(amount - firstDenomination, k);

    store.set(key, count);
    return count;
  };

  return innerFn();
}

console.time("Original CC Function");
console.log(countingChange(500));
console.timeEnd("Original CC Function");

console.time("Modified CC Function");
console.log(countingChangeTwo(500));
console.timeEnd("Modified CC Function");
