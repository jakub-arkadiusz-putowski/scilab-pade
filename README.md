# Pade Approximation Toolbox for Scilab

This toolbox provides a native Scilab implementation of the Padé approximation for continuous-time delays.

Currently, Scilab's core only provides `expm` for matrix exponentials. This toolbox bridges the gap by allowing users to approximate the time delay operator

$$\[
e^{-Ls}
\]$$

directly into a linear system representation (`syslin` transfer function).

---

## Features

- Computes *n*-th order Padé approximation.
- Returns a standard Scilab `syslin` continuous-time state-space or transfer function.
- Compatible with the Scilab control library (can be used with `bode`, `rlocus`, `csim`, etc.).

---

## Installation

### 1. Download

Clone this repository to your local machine:

```bash
git clone https://github.com/jakub-arkadiusz-putowski/scilab-pade.git
```

### 2. Build the Toolbox

Open Scilab, navigate to the `scilab-pade` folder, and run the builder script:

```scilab
cd "path/to/scilab-pade/"
exec builder.sce
```

> Note: You only need to run the builder once.

### 3. Load the Toolbox

To use the `pade` function in your current session, run:

```scilab
exec loader.sce
```

---

## Usage

The function signature is:

```scilab
G = pade(delay, order)
```

### Parameters

- `delay` – A non-negative real scalar representing the time delay $\( L \)$.
- `order` – A non-negative integer representing the approximation order $\( n \)$.

### Example

```scilab
// 2nd order Padé approximation of a 1 second delay
G = pade(1, 2);

// Display the result
disp(G);

// Use it in a control system
s = poly(0, 's');
Plant = 1 / (s + 1);
FullSystem = Plant * G;

evans(FullSystem);
```

---

## Mathematical Background

The toolbox uses the standard Padé table formula:

$$\[
R_{n,n}(x) =
\frac{
\sum_{k=0}^{n}
\frac{(2n-k)! \, n!}{(2n)! \, k! \, (n-k)!} (-x)^k
}{
\sum_{k=0}^{n}
\frac{(2n-k)! \, n!}{(2n)! \, k! \, (n-k)!} x^k
}
\]$$

where

$$\[
x = s \cdot \text{delay}
\]$$

---

## License

This project is released under the 3-clause BSD license.

---

## Author

**Jakub Arkadiusz Putowski**
```
