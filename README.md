
<h1 align="center">dotfiles ♥ ~/</h1>

![preview](https://user-images.githubusercontent.com/27065646/71407887-9cdf6200-263c-11ea-967d-7e36a0c8254b.png)

---

## Have any questions?
Dont hesitate to ask a a question. Like they say, there is no stupid question, only a stupid answer 😊

Just create an issue or email me → siddharth.dushantha[at]gmail[dot]com

## How to install the dotfiles?
I use ```stow``` to manage my dotfiles.
To install all of them, just run:
```bash
[~/dotfiles]$ # First delete the READEME.md because you dont want that :P
[~/dotfiles]$ rm README.md
[~/dotfiles]$ stow *
```

If you want the config of just one program (e.g ```mpv```), just run:
```bash
[~/dotfiles]$ stow mpv
```
**Note:** Some of the keybindings in the i3 config needs some scripts. You can find them in [this repo](https://github.com/sdushantha/bin).
