# Xumer0n

- https://xumer0n.netlify.app/#/

This game is called `Numer0n` in my country, Japan.
In contrast, `MOO`, `Hit & Blow`, `Cow & Bull` might be much more common name in all over the world.

![a](./assets/a.png)
![b](./assets/b.png)
![c](./assets/c.png)


# Rule

Goal is to predict 3 numbers that CPU selected.

`BITE` means that only number itself is correct.
`EAT` means that the number and the position is correct.

Here are some examples.

    CPU has 063

- Call 123, this has `1Eat0Bite`
- Call 498, this has `0Eat0Bite`
- Call 610, this has `0Eat2Bite`
- Call 367, this has `1Eat1Bite`
- Call 063, this has `3Eat0Bite`  -> Win


I created best strategy for CPU. Could you beat it?


### Algorithm

- [An optimal MOO strategy -- Tetsuro Tanaka, Faculty of Engineering, University of Tokyo](https://www.tanaka.ecc.u-tokyo.ac.jp/ktanaka/papers/gpw96.pdf)