# `loveletters` demo

This is a demo project for the [`loveletters`]("https://github.com/90degs2infty/loveletters") static site generator.
Find the compiled content at [https://90degs2infty.github.io/loveletters-demo](https://90degs2infty.github.io/loveletters-demo).

To compile this demo locally, make sure you have `Rust` available on your machine.
Then to compile the demo:

```console
> git clone https://github.com/90degs2infty/loveletters
> git clone https://github.com/90degs2infty/loveletters-demo
> cd loveletters
> cargo run -- ../loveletters-demo ../loveletters-demo/public_local
```

Afterwards use e.g. [Static Web Server](https://static-web-server.net/) to deploy the output bundle locally:

```console
> static-web-server -p 8080 -d ../loveletters-demo/public_local
```

Now direct your browser to `localhost:8080`.

## A note on the `@loveletters/loveletters` package

Because of how `loveletters` currently locates `typst` packages from the `loveletters` namespace (namely, it does not provide `@loveletters/loveletters` automatically), this project includes a verbatim copy of the package's sources under `packages/loveletters/0.1.0/`.
Note that the package lookup is intended to be changed in future versions of `loveletters`, so that this copy-pasting becomes obsolete.

## A note on `public`

For convenience, this repository includes the output bundle (i.e. the rendered content as bundled by `loveletters`) under `public`.
In a proper project you will likely want to e.g. compile the output and deploy the bundle as part of a GitHub Actions workflow instead. [^1]

[^1]: Yes, given that `loveletters` does not provide any pre-built releases yet, this means you also have to build `loveletters` itself.
      Sorry for the inconvenience...

## License

This repository is licensed under MIT OR Apache License 2.0.
See [`LICENSE-MIT`](./LICENSE-MIT) or [`LICENSE-APACHE`](./LICENSE-APACHE) for details.
