# Simulation for PD-Driver with OPA192

## 0. Prepare

* Ngspice
  * ArchLinux:
  `sudo pacman -S ngspice`
  * MacOS:
 `brew install ngspice`
* Set/Check env.
`set ngbehavior=ps > ~/.spiceinit`
This is necessary,
because TI's spice component is based on PSpice,
instead of ngspice.
If you have not set it,
then magic error message will show up when you compilation.
* python3 with:
  * matplotlib
  * panda

## 1. Run

* Run simulation and plot

```bash
$make
```

* Run simulation only

```bash
$make sim
```

* Plot only

```bash
$make plot
```

* clean simulation generated *.ssv file

```bash
$make clean
```


## 2. Resource

1. Good example for invoke OPA in the ngspice
   * [pdf](https://tinyurl.com/bdze7f8h)
   * [video](https://youtu.be/ni-LKxu6lK8)
2. [Ngspice official manual](https://tinyurl.com/2v2yz7sj)
3. [OPA192 Datasheet](https://www.ti.com/lit/gpn/opa192)
4. [Example design for PD Driver(TI)](https://www.ti.com/lit/pdf/tidu535)
5. Basical concept about photodiode
   * [The Physical Operation of Light-Sensitive pn Junctions](https://tinyurl.com/2h2ft8kc)
   * [Understanding Photovoltaic and Photoconductive Modes of Photodiode Operation](https://tinyurl.com/mr3n822d)
   * [Si photodiodes Handbook](https://tinyurl.com/ywbc2dx5)
