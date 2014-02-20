muggler
=======

Muggler is a git hook that calculate migration difference between git branches - for Rails applications - and 
automatically revert and apply the migrations in the proper order when you change between branches, pull or merge.

Installation
============

Using Homebrew
--------------

```
brew tap divoxx/brewery
brew install muggler
```

Then from within the repository you want to setup, run:

```
muggler install
```

Manually
--------

Just clone the repository and add the bin folder to your `$PATH`

Then from within the repository you want to setup, run:

```
muggler install
```

Usage
=====

Muggler will automatically run bundler and the migrations when necessary. It will only load the app environment to 
run migrations when there are database differences between the branches, **otherwise it will be as fast as normal 
branch switching**.

Somtimes, if you're going to be moving temporarily between branches and you wanna skip the auto running of migrations
you can use `muggler hold`. Once you're done, just run `muggler continue` and it will calculate the difference the 
between the current state and the state where `hold` was called and execute accordingly.

License
=======

Copyright (c) 2013, Rodrigo Kochenburger
All rights reserved.

Redistribution and use in source and binary forms, with or without modification,
are permitted provided that the following conditions are met:

  Redistributions of source code must retain the above copyright notice, this
  list of conditions and the following disclaimer.

  Redistributions in binary form must reproduce the above copyright notice, this
  list of conditions and the following disclaimer in the documentation and/or
  other materials provided with the distribution.

THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS" AND
ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED
WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE
DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT HOLDER OR CONTRIBUTORS BE LIABLE FOR
ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES
(INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES;
LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON
ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
(INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS
SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
