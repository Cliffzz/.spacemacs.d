.emacs.d
========

[![CircleCI](https://circleci.com/gh/Cliffzz/.emacs.d.svg?style=shield)](https://circleci.com/gh/Cliffzz/.emacs.d) [![emacs-version](https://img.shields.io/badge/emacs-26.1-brightgreen.svg)](https://www.gnu.org/software/emacs/) [![node-version](https://img.shields.io/badge/node-10.7.0-brightgreen.svg)](https://github.com/nodejs/node) [![npm-version](https://img.shields.io/badge/npm-6.2.0-brightgreen.svg)](https://github.com/npm/npm) [![license](https://img.shields.io/badge/license-GPL%20v3-blue.svg)](https://github.com/Cliffzz/.emacs.d/blob/master/LICENSE)

Personal emacs configuration.

<img width="1680" src="https://user-images.githubusercontent.com/2283434/40851887-f1da2294-65c8-11e8-8595-a9fbe25f1f19.png">

<!-- markdown-toc start - Don't edit this section. Run M-x markdown-toc-refresh-toc -->
**Table of Contents**

- [.emacs.d](#emacsd)
    - [Installation](#installation)
        - [Prerequisites](#prerequisites)
        - [macOS](#macos)
        - [Windows](#windows)

<!-- markdown-toc end -->

## Installation
### Prerequisites
- [hunspell](https://github.com/hunspell)
- [dictionary](http://wordlist.aspell.net/dicts/)
- [ripgrep](https://github.com/BurntSushi/ripgrep)
- [node](https://github.com/nodejs/node)
- [npm](https://github.com/npm/npm)
- [omnisharp-roslyn](https://github.com/OmniSharp/omnisharp-roslyn)
- [Iosevka](https://github.com/be5invis/Iosevka)
- [luacheck](https://github.com/mpeterv/luacheck)

### macOS
- [emacs-plus](https://github.com/d12frosted/homebrew-emacs-plus)
```
brew install emacs-plus --devel --without-spacemacs-icon
npm install
```

### Windows
- [emacs](https://github.com/m-parashar/emax64)
```
npm install
```

### Byte compile
To improve performance run:
```
C-c c compile-files
```
