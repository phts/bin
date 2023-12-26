#!/usr/bin/env node

function book(pageNumber) {
  const face = [];
  const back = [];
  const pages = Array.from({ length: pageNumber }, (_, i) => i + 1);
  while (pages.length % 4 !== 0) {
    pages.splice(pages.length < 4 ? pages.length : pages.length - 1, 0, '<empty>');
  }

  for (let cursor = 0; cursor < pages.length; cursor = cursor + 2) {
    const a = pages.length - 1 - cursor;
    const b = cursor;
    if (a < b) {
      break;
    }
    face.push(pages[a]);
    face.push(pages[b]);
  }

  for (let cursor = 1; cursor < pages.length; cursor = cursor + 2) {
    const a = cursor;
    const b = pages.length - 1 - cursor;
    if (a > b) {
      break;
    }
    back.push(pages[a]);
    back.push(pages[b]);
  }

  return { face, back };
}

const PAGES = process.argv[2];
if (!PAGES) {
  console.error('print-book <number of pages>');
  process.exit(1);
}

const res = book(PAGES);
console.info(`Face: ${res.face.join(', ')}`);
console.info(`Back: ${res.back.join(', ')}`);
