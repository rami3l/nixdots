# nixdots

## Quick Start

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

## Enable GPU Acceleration

With `targets.genericLinux.enable = true`, [there should be a warning][warning]
when doing the `switch` if the graphics libraries are not configured correctly.
To fix this, simply run the suggested command.

[warning]: https://home-manager.dev/manual/unstable/usage/gpu-non-nixos.html#when-sudo-is-available-fixing-the-host-os
