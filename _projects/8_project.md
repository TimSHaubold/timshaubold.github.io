---
layout: page
title: Unfitted Finite Elements for time-harmonic Maxwell
description: In this project we considered the low-frequency Curl-Curl problem with an unfitted finite element discretization
img: assets/img/projects/cutfem_nonmatching.png
importance: 2
category: work
giscus_comments: true
---

For problems with a complicated or time-dependent domain, meshing can become one of the bottleneck. An alternative to this problem is the application of CutFem methods.
Instead of fitting the mesh to the geometry, the interface is allowed to cut through the mesh cells. In such a case small cut cells can become a problem and different stabilization routines can be applied.

<div style="max-width: 520px; margin: 0 auto;">
  {% include figure.liquid path="assets/img/projects/cutfem_nonmatching.png" alt="Curved geometry drawn over a fixed triangular background mesh; the elements inside or cut by the boundary are highlighted" zoomable=true caption="Non-matching mesh: the geometry cuts through the elements of a fixed background mesh." %}
</div>

In this projection we considered, the low-frequency time-harmonic Maxwells equations. Our goal was not only to stabilize with respect to the small cut cells, but also to arbitrary high jumps, in the material parameter. Moreover, by choosing a mixed system, we could also stabilize with respect to the so-called Eddy-Current case, where the mass part of the equations goes to zero.

A second part of the project was about the effective preconditioning of this saddle-point system in presence of the ghost-penalty.

(Preprint soon)

Joint work with

- **Christoph Lehrenfeld**, Institute for Numerical and Applied Mathematics, University of Göttingen
