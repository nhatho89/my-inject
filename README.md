# MyInject
Monkey Patched the Array class and re-wrote the inject enumerables method using:
+ Iterators (my_inject)
+ Recursion (recursive_inject)

## Objectives
Get a better understanding of the inner workings of Ruby methods and using recursion.

### How to run it
```sh
git clone git@github.com:yoshdog/my-inject.git
cd my-inject
irb
require './lib/my_inject.rb'
[1,2,3].my_inject(5,&:+)
[1,2,3].recursive_inject(5,&:+)
```

### How to test it
```sh
cd my-inject
rspec
```