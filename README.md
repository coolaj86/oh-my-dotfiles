Oh-my-dotfiles
=======

Store all of your dotfiles in a git repo without making the `git status`
result of uninitialized directories look crazy.

```bash
rsync -av dummy/ my-user-name/

bash install.bash my-user-name
```

Any of the managed files that existed in `~/`
will be backed up in `./my-user-name` before being replaced with symlinks.

What's included?
=========

```
.
├── .gemrc
├── .gitconfig
├── .gitignore
├── .gitignore_global
├── .jshintrc
├── .vimrc
└── shell-mixins
    ├── all
    │   ├── aliases.partial
    │   └── whois.partial
    ├── bash
    │   └── rvm.partial
    └── fish
        └── rvm.partial
```

Mixins are added to `.bashrc_omd` and then sourced in the default `~/.bashrc` (which we don't touch).

Who's to blame?
=====

This was 110% AJ's idea and 110% his work with absolutley no help from Ryan Burnette, [not even a single commit](https://github.com/coolaj86/oh-my-dotfiles/commits?author=ryanburnette)... and certainly not 36 commits... nope
