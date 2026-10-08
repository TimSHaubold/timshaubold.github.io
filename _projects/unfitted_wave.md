---
layout: page
title: Unfitted discontinuous finite elements for the acoustic wave equation
description: Explicit time stepping for the acoustic wave equation on unfitted meshes with a material interface
img: assets/img/projects/cutfem_interface.png
importance: 3
category: work
---

We consider the acoustic wave equation in its first-order formulation for the pressure $$p$$ and the velocity $$u$$,

$$
\begin{cases}
\partial_t (\rho u) + \nabla p = 0,\\
\partial_t (\kappa p) + \nabla \cdot u = f,
\end{cases}
\quad \text{in } J \times (\Omega_1 \cup \Omega_2),
$$

where the two subdomains $$\Omega_1$$ and $$\Omega_2$$ are separated by a material interface $$\Gamma$$.
As in the Maxwell project, the mesh is not fitted to the interface: $$\Gamma$$ cuts through the elements of a fixed background mesh.

<div style="max-width: 400px; margin: 0 auto;">
  {% include figure.liquid path="assets/img/projects/cutfem_interface.png" alt="Triangular background mesh with a curved interface Gamma separating the subdomains Omega 1 and Omega 2 and cutting through the elements" zoomable=true caption="The interface $\Gamma$ between $\Omega_1$ and $\Omega_2$ cuts through the elements of the background mesh." %}
</div>

In space, we discretize with discontinuous finite elements on the cut mesh. Small cut cells are handled by a ghost penalty based on polynomial extension: every ill-cut cell is paired with a well-cut or uncut neighbouring cell, from which the polynomial is extended.
In time, we use explicit Runge–Kutta schemes and analyse their $$L^2$$-stability in presence of the ghost penalty.

As a test case, we consider a Cassini oval cut out of an unstructured background mesh, with reflecting walls and a Gaussian pressure pulse as initial data.

{% include figure.liquid path="assets/img/projects/cassini_cut_mesh.png" alt="Cassini oval on a triangular background mesh: active uncut elements in blue, cut elements in orange, inactive elements in grey, with a zoom on the narrow neck" zoomable=true caption="Cut mesh of the Cassini oval test case on $[-2,1] \times [-0.6,0.6]$ with $h = 0.02$." %}

<div style="max-width: 720px; margin: 0 auto;">
  {% include figure.liquid path="assets/video/unfitted_wave_simulation.gif" avoid_scaling=true alt="Animation of a pressure pulse spreading as waves across the domain" caption="The Cassini oval test case computed with our unfitted discontinuous Galerkin code." %}
</div>

(Preprint soon)

Joint work with

- **Alexandre Ern**, CERMICS, ENPC, Institut Polytechnique de Paris, and Inria Paris
