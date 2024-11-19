# Burn with Torch Backend using Nix
This repo contains a minimal setup needed to develop GPU accelerated code using the burn framework leveraging the Torch backend. To build and run the code simply do the following:

```sh
nix develop # or use direnv, etc.
cargo run # or build the app, and run the executable, etc.
```

It is important to note that the binary will only work if the devshell is loaded, as that provides the needed runtime dependencies for the `tch` backend provided by burn.
