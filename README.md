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
* Dash to dock
* Hibernate status button
* Launch New Instance
* Media Player Indicator
* Multi Monitor add-on
* Topicons plus
* Users Themes

## Shell

### ZSH

Installer oh-my-zsh !

- Aliases :
	- alias ll='ls -la --color=auto'
	- alias osef='sudo $(history | tail -n1 | cut -c 8-)'
		- permet de rajouter sudo devant en cas d'oubli
	- alias update='yaourt -Syu'

Thème : Powerlevel9k -
https://github.com/bhilburn/powerlevel9k

à mettre dans le .zshrc :
"  
POWERLEVEL9K_MODE='awesome-patched'  
#POWERLEVEL9K_PROMPT_ON_NEWLINE=true  
POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(root_indicator dir)  
POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(vcs time status background_jobs)  
ZSH_THEME="powerlevel9k/powerlevel9k"  
"

Activer ILoveCandies !

Installer thefuck

### Gnome terminal

utiliser dconf-editor, aller à :
```
org/gnome/terminal/legacy/profiles:/id_profil/
```

Un certain nombre de paramètres sont alors à changer :

**background-color :**
```
rgb(0,43,54)
```

**cursor-background-color :**
```
rgb(239,41,41)
```

**Cursor-shape :**
```
ibeam
```

**palette :**
```
['rgb(46,52,54)', 'rgb(220,50,47)', 'rgb(186,209,27)', 'rgb(181,137,0)', 'rgb(65,189,242)', 'rgb(211,54,130)', 'rgb(42,161,152)', 'rgb(248,201,53)', 'rgb(65,189,242)', 'rgb(203,75,22)', 'rgb(88,110,117)', 'rgb(101,123,131)', 'rgb(131,148,150)', 'rgb(108,113,196)', 'rgb(147,161,161)', 'rgb(253,246,227)']
```

**Police :**
```
Droid Sans Mono Awesome 12
```

## Git

### gitconfig

fichier `.gitconfig` dans le home dir.

```
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

* Sublim Material Theme
* Material Icon Theme

### Packages

* expand-region
* IntelliJ IDEA Keybindings
* Python

### Conf

```
{
    "workbench.colorTheme": "Sublime Material Theme - Dark",
    "workbench.iconTheme": "material-icon-theme",
    "files.autoSave": "onFocusChange",
    "editor.tabCompletion": true,
    "window.menuBarVisibility": "toggle",
    "terminal.enableAppInsights": false,
    "editor.wordWrap": "bounded",
    "editor.wordWrapColumn": 100
}
```