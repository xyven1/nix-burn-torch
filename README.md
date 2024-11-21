# Burn with Torch Backend using Nix
This repo contains a minimal setup needed to develop GPU accelerated code using the burn framework leveraging the Torch backend. To build and run the code simply do the following:

```sh
nix develop # or use direnv, etc.
cargo build # using `cargo run` directly can cause issues.
./target/debug/nix-burn-torch # note: by default cuda device 0 is used
```

It is important to note that the binary will only work if the devshell is loaded, as that provides the needed runtime dependencies for the `tch` backend provided by burn.
