# HaskellSkeleton

## Usage

Run the program without compiling.

```sh
./bin/hs
```


## Development

Install dependencies.

```sh
cabal install --only-dependencies --enable-tests
```

Compile program.

```sh
./build.sh
```

Delete compiled data in the `dist` directory.

```sh
./clean.sh
```

Run tests.

```sh
./test.sh
```
