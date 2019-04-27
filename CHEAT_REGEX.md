# Regex Cheatsheet

### Regex

| PCRE     | Name                | What it does                                                                         |
|----------|---------------------|--------------------------------------------------------------------------------------|
| (?=foo)  | Lookahead           | Asserts that what immediately follows the current position in the string is foo      |
| (?<=foo) | Lookbehind          | Asserts that what immediately precedes the current position in the string is foo     |
| (?!foo)  | Negative Lookahead  | Asserts that what immediately follows the current position in the string is not foo  |
| (?<!foo) | Negative Lookbehind | Asserts that what immediately precedes the current position in the string is not foo |
| \bfoo\b  | Word Boundaries     | Add `\b` before and/or after the pattern                                             |

### Regex (Vim)

| Vim      | Alt.   | Name                |
|----------|--------|---------------------|
| (foo)@=  | \zefoo | Lookahead           |
| (foo)@<= | foo\zs | Lookbehind          |
| (foo)@!  |        | Negative Lookahead  |
| (foo)@<! |        | Negative Lookbehind |
| <>       |        | Word Boundaries     |

### Tests for Lookaround and word boundaries

quick

thequickbrown

TheQuickBrown

thequickblack

aquickblack

quickquick

Quick

black

the quick brown fox
