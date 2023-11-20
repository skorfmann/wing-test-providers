# wing duplicated providers in test

works with one test, adding more tests will lead to duplicated providers.

```
wing --version
0.48.8
```

```
npm install
```

## main.w

```
wing test -t tf-aws main.w
```

result

```
│ Error: Duplicate provider configuration
│
│   on main.tf.json line 28, in provider:
│   28:     "docker": [
│
│ A default (non-aliased) provider configuration for "docker" was already
│ given at main.tf.json:28,15-16. If multiple configurations are required,
│ set the "alias" argument for alternative configurations.
╵
╷
│ Error: Duplicate provider configuration
│
│   on main.tf.json line 34, in provider:
│   34:     "null": [
│
│ A default (non-aliased) provider configuration for "null" was already given
│ at main.tf.json:34,13-14. If multiple configurations are required, set the
│ "alias" argument for alternative configurations.
╵
╷
│ Error: Duplicate provider configuration
│
│   on main.tf.json line 40, in provider:
│   40:     "random": [
│
│ A default (non-aliased) provider configuration for "random" was already
│ given at main.tf.json:40,15-16. If multiple configurations are required,
│ set the "alias" argument for alternative configurations.
╵
```

## once.main.w

```
wing test -t tf-aws once.main.w
```

```
╷
│ Error: Duplicate provider configuration
│
│   on main.tf.json line 28, in provider:
│   28:     "docker": [
│
│ A default (non-aliased) provider configuration for "docker" was already
│ given at main.tf.json:28,15-16. If multiple configurations are required,
│ set the "alias" argument for alternative configurations.
╵
╷
│ Error: Duplicate provider configuration
│
│   on main.tf.json line 34, in provider:
│   34:     "null": [
│
│ A default (non-aliased) provider configuration for "null" was already given
│ at main.tf.json:34,13-14. If multiple configurations are required, set the
│ "alias" argument for alternative configurations.
╵
╷
│ Error: Duplicate provider configuration
│
│   on main.tf.json line 40, in provider:
│   40:     "random": [
│
│ A default (non-aliased) provider configuration for "random" was already
│ given at main.tf.json:40,15-16. If multiple configurations are required,
│ set the "alias" argument for alternative configurations.
```

## singleton.main.w

```
wing test -t tf-aws singleton.main.w
```

```
⠋ Compiling singleton.main.w to tf-aws...
root <root>
exists undefined
rootAsResource <root>
root <root>
exists provider-instances
✖ Compiling singleton.main.w to tf-aws...

runtime error: Validation failed with the following errors:
  [root] Found resources without a matching provider construct. Please make sure to add provider constructs [e.g. new RandomProvider(...)] to your stack 'root' for the following providers: random, docker, null

```