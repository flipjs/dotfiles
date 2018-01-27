#!/usr/bin/env node
var program = require('commander');
var cp = require('child_process');

var editor = process.env.EDITOR || 'vim';

program
  .version('1.0.0')
  .arguments('searchText')
  .option('-i, --ignore-case', 'ignore case-sensitive')
  .option('-e, --exclude <exclude>', 'glob exclude patterns, comma-delimited')
  .option('-t, --text-editor [editor]', 'terminal-based text editor to use', editor)
  .action(searchText => {
    if (!searchText) {
      console.log('No search text specified.');
      return;
    }

    var cmd = `rg ${searchText} -l${program.ignoreCase ? 'i' : ''}`;

    if (program.exclude) {
      program.exclude.split(',').forEach(item => {
        cmd += ` -g '!${item}'`;
      });
    }

    cp.exec(cmd, (err, stdout, stderr) => {
      if (!stdout) {
        console.log(`No results found for ${searchText}.`);
        return;
      }

      if (err) {
        console.log('Something went wrong...');
        console.log(stderr);
        console.error(err);
        return;
      }

      var results = stdout.split('\n').filter(x => x);

      var child = cp.spawn(program.textEditor, results, {
          stdio: 'inherit'
      });

      child.on('exit', () => {
          console.log("Finished.");
      });
    });
  })
  .parse(process.argv);
