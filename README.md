# Sucre pour les yeux

Ce document a pour but de recenser les thèmes/icones/polices/add-ons/etc. que j'ai installé afin d'avoir un environnement de travail ergonomique et plaisant à regarder.

Les ajouts seront regroupés par système de parent->add

## Gnome-shell

### Thèmes

Au choix :

* Arc
* Adapta (flat)

### Icones

* Arc
* Paper (à utiliser avec Adapta)

### Extensions

A aller ajouter sur Gnome Tweak Tool

* Alternate tab
* Hibernate status button
* Launch New Instance
* Media Player Indicator
* Multi Monitor add-on
* Topicons plus
* Users Themes
* Bing wallpaper changer
* Notification alert
* Wintile: windows 10 window tiling for gnome

Contextuel :

* pidgin im integration

## Shell

### ZSH

Installer oh-my-zsh !

* Aliases :
	* alias ll='ls -la --color=auto'
	* alias osef='sudo $(history | tail -n1 | cut -c 8-)'
		* permet de rajouter sudo devant en cas d'oubli
	* alias update='yaourt -Syu'

Thème : Powerlevel9k -
https://github.com/bhilburn/powerlevel9k

à mettre dans le .zshrc :

```bash
POWERLEVEL9K_MODE='awesome-patched'  
#POWERLEVEL9K_PROMPT_ON_NEWLINE=true  
POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(root_indicator dir)  
POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(vcs time status background_jobs)  
ZSH_THEME="powerlevel9k/powerlevel9k"  
```

Activer ILoveCandies !

Installer thefuck

### Gnome terminal

utiliser dconf-editor, aller à :

```bash
org/gnome/terminal/legacy/profiles:/id_profil/
```

Un certain nombre de paramètres sont alors à changer :

**background-color :**

```text
rgb(0,43,54)
```

**cursor-background-color :**

```text
rgb(239,41,41)
```

**Cursor-shape :**

```text
ibeam
```

**palette :**

```json
['rgb(46,52,54)', 'rgb(220,50,47)', 'rgb(186,209,27)', 'rgb(181,137,0)', 'rgb(65,189,242)', 'rgb(211,54,130)', 'rgb(42,161,152)', 'rgb(248,201,53)', 'rgb(65,189,242)', 'rgb(203,75,22)', 'rgb(88,110,117)', 'rgb(101,123,131)', 'rgb(131,148,150)', 'rgb(108,113,196)', 'rgb(147,161,161)', 'rgb(253,246,227)']
```

**Police :**

```text
Droid Sans Mono Awesome 12
```

## Git

### gitconfig

fichier `.gitconfig` dans le home dir.

```ini
[alias]
	pushdev = !git push --set-upstream origin "`git branch --no-color 2>/dev/null | grep '*' | sed -e 's/\\* //'`:dev/tcoussot/`git branch --no-color 2>/dev/null | grep '*' | sed -e 's/\\* //'`"
	shit = !git add . && git commit -m
```

## Atom

### Thèmes

* atom-material-ui
* atom-material-syntax

### Packages obligatoires

* platformio-ide-terminal
* bottom-dock
* todo-show
* highlight-selected
* minimap
* minimap-highlight-selected
* pretty-json
* split-diff

### Packages situationnels

Markdown :

* markdown-preview-plus
* language-markdown
* markdown-writer

Web :

* emmet
* autoclose-html
* atom-ternjs
* atom-typescript

## VS Code

### Thèmes

* choose one theme:
  * Sublim Material Theme
  * Atom One Dark Theme
* choose one icon theme:
  * Material Icon Theme
  * Simple icon theme

### Packages

* Comment V
* EditorConfig for VS Code
* ESLint
* Auto Import
* Auto Rename Tag
* Babel JavaScript
* Bash Beautify
* BashIDE
* Beautify css/sass/scss
* html tag wrapper
* html to JSX
* JavaScript (ES6) code snippets
* Bracket Pair Colorizer 2
* expand-region
* Git History
* Go
* IntelliJ IDEA Keybindings
* JS Refactor
* Partial Diff
* Puppet
* Python
* toggler
* vscode-database
* warpsript-language
* Ungit Tab
* GitLens -- Git supercharged
* Markdown All in One
* Markdown Preview Enhanced
* Markdownlint

### VSCode Conf

```json
{
    "workbench.colorTheme": "Atom One Dark",
    "workbench.iconTheme": "simple-icons",
    "files.autoSave": "onFocusChange",
    "editor.tabCompletion": "on",
    "window.menuBarVisibility": "toggle",
    "editor.wordWrap": "bounded",
    "editor.wordWrapColumn": 120,
    "emmet.includeLanguages": {
        "javascript": "javascriptreact"
    },
    "emmet.showExpandedAbbreviation": "always",
    "zenMode.hideTabs": false,
    "files.insertFinalNewline": true,
    "editor.fontSize": 13,
    "go.formatTool": "gofmt",
    "extensions.ignoreRecommendations": false,
    "window.zoomLevel": 0,
    "go.useCodeSnippetsOnFunctionSuggest": true,
    "go.useCodeSnippetsOnFunctionSuggestWithoutType": true,
    "zenMode.centerLayout": false,
    "javascript.updateImportsOnFileMove.enabled": "always",
    "go.autocompleteUnimportedPackages": true,
    "gitlens.views.repositories.files.layout": "tree",
    "beautify.tabSize": 2,
    "tslint.configFile": "tslint.json",
    "editor.matchBrackets": false,
    "bracket-pair-colorizer-2.highlightActiveScope": true,
    "bracket-pair-colorizer-2.colors": [
        "Gold",
        "Orchid",
        "LightSkyBlue",
        "Orange"
    ],
    "files.watcherExclude": {
        "**/dist/**": true
    },
    "markdownlint.config": {
        "MD007": {
            "indent": 1
        },
        "MD010": false,
        "MD012": false,
        "MD013": false,
        "MD024": false
    },
    "markdown.extension.preview.autoShowPreviewToSide": true,
    "markdown-preview-enhanced.mermaidTheme": "default",
    "gitlens.mode.active": "review",
    "terminal.integrated.fontFamily": "DroidSansMono Nerd Font, Book"
}
```
