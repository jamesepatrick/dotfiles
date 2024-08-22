Hi. This is James Patrick's current collection of dotfiles. If you found this
feel free to steal what ever you want, if you have any questions feel free to
contact me.

# Tenants

1. The time invested in configuring tools will probably never recouped by
   increased productivity. This isn't a reason not to spend the time to do this.
2. Don't write what already exist.
3. Configuration should be easy to setup and tear down, without destroying anything of value.
4. Try to stay lean. More tooling begets more maintenance.
   1. The best code is no code.
   2. It's better to have an imperfect tool than to have targets diverge
   3. Write tooling to allow for variation between targets.
5. Any rule can ignored if it has a non-stupid reason.
6. Take lots of screenshots.
7. Don't be an idiot and store large files.
8. Git-crypt is used to store some semi-sentive data. All encrypted data should assumed to be able to be brute for in the future for pocket change. Do not store important data this way.

# Quick start

```sh
git clone https://git.jpatrick.io/james/dotfiles.git ~/.dotfiles
make -C ~/.dotfiles install
```
