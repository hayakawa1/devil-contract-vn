#!/usr/bin/env node

const fs = require('fs');
const path = require('path');

const projectRoot = path.resolve(__dirname, '..');

const usage = `Usage:
  node tools/merge_scenario.js [source] [target] [cutLine] [--dry-run]

Defaults:
  source  route_furyo.ks
  target  game/public/scenarios/route_furyo.ks
  cutLine 501

The first cutLine lines are copied from source. Remaining lines are kept from target.`;

function parseArgs(argv) {
  const dryRun = argv.includes('--dry-run');
  const positional = argv.filter((arg) => arg !== '--dry-run');

  if (positional.includes('-h') || positional.includes('--help')) {
    console.log(usage);
    process.exit(0);
  }

  return {
    source: positional[0] || 'route_furyo.ks',
    target: positional[1] || 'game/public/scenarios/route_furyo.ks',
    cutLine: Number.parseInt(positional[2] || '501', 10),
    dryRun
  };
}

function resolveFromRoot(filePath) {
  return path.isAbsolute(filePath) ? filePath : path.resolve(projectRoot, filePath);
}

function readScenario(filePath) {
  const content = fs.readFileSync(filePath, 'utf8').replace(/\r\n/g, '\n');
  const hasFinalNewline = content.endsWith('\n');
  const text = hasFinalNewline ? content.slice(0, -1) : content;

  return {
    lines: text ? text.split('\n') : [],
    hasFinalNewline
  };
}

function fail(message) {
  console.error(`Error: ${message}`);
  process.exitCode = 1;
}

function main() {
  const { source, target, cutLine, dryRun } = parseArgs(process.argv.slice(2));
  const sourcePath = resolveFromRoot(source);
  const targetPath = resolveFromRoot(target);

  if (!Number.isInteger(cutLine) || cutLine < 1) {
    fail('cutLine must be a positive integer.');
    return;
  }

  if (!fs.existsSync(sourcePath)) {
    fail(`source file does not exist: ${sourcePath}`);
    return;
  }

  if (!fs.existsSync(targetPath)) {
    fail(`target file does not exist: ${targetPath}`);
    return;
  }

  const sourceScenario = readScenario(sourcePath);
  const targetScenario = readScenario(targetPath);
  const sourceLines = sourceScenario.lines;
  const targetLines = targetScenario.lines;

  if (sourceLines.length < cutLine) {
    fail(`source has ${sourceLines.length} lines, but cutLine is ${cutLine}.`);
    return;
  }

  if (targetLines.length < cutLine) {
    fail(`target has ${targetLines.length} lines, but cutLine is ${cutLine}.`);
    return;
  }

  const mergedLines = sourceLines.slice(0, cutLine).concat(targetLines.slice(cutLine));
  const mergedContent = mergedLines.join('\n') + (targetScenario.hasFinalNewline ? '\n' : '');

  console.log(`Source: ${path.relative(projectRoot, sourcePath)} (${sourceLines.length} lines)`);
  console.log(`Target: ${path.relative(projectRoot, targetPath)} (${targetLines.length} lines)`);
  console.log(`Copying source lines 1-${cutLine}; keeping target lines ${cutLine + 1}-${targetLines.length}.`);
  console.log(`Merged result: ${mergedLines.length} lines`);

  if (dryRun) {
    console.log('Dry run only. No files were changed.');
    return;
  }

  const tempPath = `${targetPath}.tmp-${process.pid}`;
  fs.writeFileSync(tempPath, mergedContent, 'utf8');
  fs.renameSync(tempPath, targetPath);
  console.log(`Wrote ${path.relative(projectRoot, targetPath)}`);
}

main();
