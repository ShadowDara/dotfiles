#!/usr/bin/env bun

type Birthday = {
  name: string;
  date: string; // YYYY-MM-DD
};

// 👉 stabiler Speicherort (immer relativ zur CLI-Datei)
const FILE_PATH = new URL("./../Secret2/birthdays.json", import.meta.url);

// ---------- Utils ----------

async function loadBirthdays(): Promise<Birthday[]> {
  try {
    return await Bun.file(FILE_PATH).json();
  } catch {
    return [];
  }
}

async function saveBirthdays(data: Birthday[]) {
  await Bun.write(FILE_PATH, JSON.stringify(data, null, 2));
}

function getNextOccurrence(dateStr: string): Date {
  const today = new Date();
  const original = new Date(dateStr);

  const next = new Date(original);
  next.setFullYear(today.getFullYear());

  if (next < today) {
    next.setFullYear(today.getFullYear() + 1);
  }

  return next;
}

function isSameDay(a: Date, b: Date) {
  return (
    a.getDate() === b.getDate() &&
    a.getMonth() === b.getMonth()
  );
}

// ---------- Commands ----------

async function add(name: string, date: string) {
  const data = await loadBirthdays();

  if (!/^\d{4}-\d{2}-\d{2}$/.test(date)) {
    console.log("❌ Format: YYYY-MM-DD");
    return;
  }

  data.push({ name, date });
  await saveBirthdays(data);

  console.log(`✅ ${name} gespeichert`);
}

async function list() {
  const data = await loadBirthdays();

  if (!data.length) {
    console.log("📭 Leer");
    return;
  }

  data.forEach((b, i) => {
    console.log(`${i + 1}. ${b.name} - ${b.date}`);
  });
}

async function todayCmd() {
  const data = await loadBirthdays();
  const today = new Date();

  const result = data.filter(b =>
    isSameDay(new Date(b.date), today)
  );

  console.log("🎉 Heute:");
  result.length
    ? result.forEach(b => console.log(b.name))
    : console.log("Niemand 😢");
}

async function week() {
  const data = await loadBirthdays();
  const today = new Date();

  const in7Days = new Date();
  in7Days.setDate(today.getDate() + 7);

  const result = data
    .map(b => ({
      ...b,
      next: getNextOccurrence(b.date),
    }))
    .filter(b => b.next >= today && b.next <= in7Days)
    .sort((a, b) => a.next.getTime() - b.next.getTime());

  console.log("📅 Nächste 7 Tage:");
  result.length
    ? result.forEach(b =>
        console.log(`${b.name} - ${b.next.toISOString().split("T")[0]}`)
      )
    : console.log("Niemand 😢");
}

async function month() {
  const data = await loadBirthdays();
  const month = new Date().getMonth();

  const result = data.filter(
    b => new Date(b.date).getMonth() === month
  );

  console.log("🗓️ Dieser Monat:");
  result.length
    ? result.forEach(b =>
        console.log(`${b.name} - ${b.date}`)
      )
    : console.log("Niemand 😢");
}

async function upcoming() {
  const data = await loadBirthdays();

  const sorted = data
    .map(b => ({
      ...b,
      next: getNextOccurrence(b.date),
    }))
    .sort((a, b) => a.next.getTime() - b.next.getTime());

  console.log("⏳ Kommend:");
  sorted.forEach(b =>
    console.log(`${b.name} - ${b.next.toISOString().split("T")[0]}`)
  );
}

// ---------- CLI ----------

const [, , cmd, ...args] = process.argv;

switch (cmd) {
  case "add":
    await add(args[0], args[1]);
    break;

  case "list":
    await list();
    break;

  case "today":
    await todayCmd();
    break;

  case "week":
    await week();
    break;

  case "month":
    await month();
    break;

  case "upcoming":
    await upcoming();
    break;

  default:
    console.log(`
🎂 Birthday CLI

Commands:
  add <name> <YYYY-MM-DD>
  list
  today
  week
  month
  upcoming

Example:
  bun run app.ts add Max 1990-05-20
`);
}
