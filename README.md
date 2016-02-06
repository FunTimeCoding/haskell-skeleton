# HaskellSkeleton

## Usage

This section explains how to use this project.

Run the main entry point program.

```sh
bin/hs
```


## Development

This section explains how to use scripts that are intended to ease the development of this project.

Install dependencies and development tools.

```sh
cabal install --only-dependencies --enable-tests
```

Run style check and tests.

```sh
./run-style-check.sh
./run-tests.sh
```

Build the project like Jenkins.

```sh
./build.sh
```

Delete compiled data in the `dist` directory.

```sh
./clean.sh
```
