**Tallgeese** is an `OCaml/C/Objective-C` based GUI for ssh. It is just
 for `OS X`

Working version that actually connects and works:

![img](./etc/gui.gif)

# Why?

I usually dislike GUI tools but they really shine for that kind of
implicit memorization that is needed for command line tools,
especially for those that we configure basically once. 
So I made this because:

1.  I wanted a more enjoyable experience `sshing` into machines,
    hopefully multiple machines soon.
2.  I want to drag and drop files to remote machines.
3.  I want a record and more meta information about the machines I
    connect to, will be provided by [bindings](https://github.com/fxfactorial/ocaml-maxminddb) to [libmaxminddb](https://github.com/maxmind/libmaxminddb).
4.  I like Objective-C and I wanted to code in it.
5.  This is driving development on my [bindings](https://github.com/fxfactorial/ocaml-libssh) to [libssh](https://www.libssh.org).
6.  Its OCaml + C + Objective-C, and it works, how cool is that!

# Issues (There are many)

1.  Everything is sync, async will come later
2.  Only authenticating if you already have ssh keys known for a
    particular host
3.  I'm doing this completely without XCode, InterfaceBuilder so some
    things are somewhat harder to do or take me longer to figure
    out; `Cocoa` does a lot of magic.

Question: Where did the name come from?
Answer:
![img](./etc/tallgeese.jpg)
