# nixdots

## Quick start

Put this under `~/.config/nixdots`, and run the following command to bootstrap
the build (replace `<profile>` with the actual profile name such as `macos` or
`linux`):

```console
> nix run home-manager -- switch --flake .#<profile>
```

Once bootstrapped, the `home-manager` command can then be run directly like so:

```console
> home-manager switch --flake .#<profile>
```
