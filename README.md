# nixdots

## Quick start

Clone this repo (note that the target directory is hardcoded and is not subject
to change):

```console
> git clone https://github.com/rami3l/nixdots ~/.config/nixdots
```

After that, run the following command to bootstrap the build (replace
`<profile>` with the actual profile name such as `macos` or `linux`):

```console
> nix run home-manager -- switch --flake .#<profile>
```

Once bootstrapped, the `home-manager` command can then be run directly like so:

```console
> home-manager switch --flake .#<profile>
```
