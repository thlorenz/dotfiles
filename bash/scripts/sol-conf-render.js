#!/usr/bin/env node

// ANSI colors
const colors = {
  reset: "\x1b[0m",
  bold: "\x1b[1m",
  green: "\x1b[32m",
  cyan: "\x1b[36m",
  yellow: "\x1b[33m",
  blue: "\x1b[34m",
  magenta: "\x1b[35m",
};

// Colorize function
function colorize(line) {
  // General rule: make any "Label:" bold
  line = line.replace(
    /^(\s*[A-Z][A-Za-z0-9 \-]*:)/,
    `${colors.bold}$1${colors.reset}`,
  );

  // Special headings
  line = line.replace(
    /^RPC URL:/,
    `${colors.bold}${colors.green}RPC URL:${colors.reset}`,
  );
  line = line.replace(
    /^Default Signer Path:/,
    `${colors.bold}${colors.cyan}Default Signer Path:${colors.reset}`,
  );
  line = line.replace(
    /^Commitment:/,
    `${colors.bold}${colors.yellow}Commitment:${colors.reset}`,
  );
  line = line.replace(
    /^Transaction executed in slot ([0-9]+):/,
    `${colors.bold}${colors.blue}Transaction executed in slot $1:${colors.reset}`,
  );

  // Blockhashes, signatures, addresses → green
  line = line.replace(
    /\b[1-9A-HJ-NP-Za-km-z]{32,}\b/g,
    (match) => `${colors.green}${match}${colors.reset}`,
  );

  // Accounts
  line = line.replace(/(Account [0-9]+:)/, `${colors.cyan}$1${colors.reset}`);

  // Account balances
  line = line.replace(
    /(Account [0-9]+ balance:)/,
    `${colors.cyan}$1${colors.reset}`,
  );
  line = line.replace(
    /balance: (◎?[0-9.]+)/,
    `balance: ${colors.green}$1${colors.reset}`,
  );

  // Instruction lines
  line = line.replace(
    /^  Instruction [0-9]+/,
    `${colors.yellow}$&${colors.reset}`,
  );
  line = line.replace(
    /Program:/,
    `${colors.bold}${colors.cyan}Program:${colors.reset}`,
  );
  line = line.replace(/Data:/, `${colors.magenta}Data:${colors.reset}`);

  // Program logs
  if (line.includes("Program log:")) {
    line = `${colors.green}${line}${colors.reset}`;
  }
  if (
    line.includes("invoke") ||
    line.includes("success") ||
    line.includes("consumed")
  ) {
    line = `${colors.cyan}${line}${colors.reset}`;
  }

  // Arrays like [1, 2, 3]
  line = line.replace(
    /\[[0-9, ]+\]/g,
    (match) => `${colors.magenta}${match}${colors.reset}`,
  );

  // Finalized
  if (/^Finalized/.test(line)) {
    line = `${colors.bold}${colors.green}${line}${colors.reset}`;
  }

  return line;
}

// Read stdin and apply coloring
let input = "";
process.stdin.setEncoding("utf8");
process.stdin.on("data", (chunk) => (input += chunk));
process.stdin.on("end", () => {
  input.split("\n").forEach((line) => {
    console.log(colorize(line));
  });
});
