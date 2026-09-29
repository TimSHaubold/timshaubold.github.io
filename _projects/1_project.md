---
layout: page
title: High order finite element matrices
description: Building the local high order finite element matrices in optimal complexity for simplices
img: assets/img/projects/recursion_scheme.png
importance: 1
category: work
related_publications: true
---

This was the main project of my Phd thesis.
It is well known, that the choice of basis function determine the sparsity pattern and condition number in finite element matrices. One choice of finite element basis function are so-called modal basis function based on splitting in the dimensional part, i.e. Vertices, Edge, Faces and Interior function.
By choosing (integrated) Jacobi polynomials, we can get very sparse local finite element matrices with $$\mathcal{O}(p^2)$$ entries in 2D and $$\mathcal{O}(p^3)$$ entries in 3D.
For basis functions on a simplex, only a tensor-like structure can be choosen, resulting in a suboptimal complexity ($$\mathcal{O}(p^3)$$ or $$\mathcal{O}(p^4)$$) when constructing this matrices.

We found recursive relation using the symbolic software Guess from the [RISCErgoSum](https://www3.risc.jku.at/research/combinat/software/ergosum/) package, between the entries of the local matrix. Thus every entry can be determined in a fixed number of algorithmic operations.

<div style="max-width: 340px; margin: 0 auto;">
  {% include figure.liquid path="assets/img/projects/recursion_scheme.png" alt="Recursion scheme: three red entries (j-1,l-1), (j,l-1) and (j-1,l) with arrows pointing to the green entry (j,l)" caption="Recursion scheme for the stiffness matrix: the entry $(j,\ell)$ (green) is computed from the three entries $(j-1,\ell-1)$, $(j,\ell-1)$ and $(j-1,\ell)$ (red)." %}
</div>

The proof of this relations can be done symbolically but also by applying theory of special functions {% cite beuchler2024 %}.

A special application of this method was also used to calculate hanging nodes in optimal complexity {% cite beuchlerRecurrencesQuadrilateralHighorder2022 %}.

Joint work with

- **Sven Beuchler**, Institute of Applied Mathematics, Leibniz University Hannover
- **Veronika Pillwein**, Research Institute for Symbolic Computation (RISC), Johannes Kepler University Linz
