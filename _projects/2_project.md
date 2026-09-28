---
layout: page
title: Fast L²-Projection using biorthogonal functions
description: We apply biorthogonal function in closed form to compute a fast L²-projection
img: assets/img/projects/biorth_hcurl.png
importance: 2
category: work
giscus_comments: true
related_publications: true
---

For high order basis function in finite element methods, we choose so-called modal basis functions based on orthogonal polynomials. 
E.g. in time-dependent problems a projection of right-hand-sides onto the finite element space one needs to solve the following interpolation problem:
Find $$u_{hp} \in \mathbb{V}_{hp}$$ such that

$$
\begin{aligned}
u_{hp}(\lambda) &= u(\lambda) && \forall \text{ vertices } \lambda,\\
\int_E u_{hp}\, v &= \int_E u\, v && \forall v \in \mathcal{P}^{p-2} \text{ or } \mathcal{Q}^{p-2} \quad \forall \text{ edges } E,\\
\int_{Q/T} u_{hp}\, v &= \int_{Q/T} u\, v && \forall v \in \mathcal{P}^{p-3} \text{ or } \mathcal{Q}^{p-3} \quad \forall \text{ triangles/quadrilaterals } T.
\end{aligned}
$$

In this project, we considered the choice of test function. We searched for polynomials in closed form, which would reduce the interior block to a diagonal or even the identity. 

For the $$H^1$$ problem, one just need to rewrite the integrated Jacobi-Polynomial as a weighted Jacobi polynomial. In this case, one can directly test with the right Jacobi polynomial. 

For the cases of vectorial basis function for $$H(\operatorname{curl})$$ {% cite doi:10.1137/23M1606794 %} and $$H(\operatorname{div})$$ {% cite haubold2026highorderbiorthogonalfunctions %}, we needed to find not only the polynomial orthogonality, but also the vectorial orthogonality. 

<div style="display: flex; flex-wrap: wrap; justify-content: center; gap: 1.5rem;">
  <div style="flex: 1 1 240px; max-width: 360px;">
    {% include figure.liquid path="assets/img/projects/biorth_auxiliary.png" alt="Sparsity pattern of a 64 by 64 matrix with non-zero entries only on the diagonal" zoomable=true caption="(a) $L^2$-scalar product of $B_{kl}, C_{kl}$ and the auxiliary functions." %}
  </div>
  <div style="flex: 1 1 240px; max-width: 360px;">
    {% include figure.liquid path="assets/img/projects/biorth_hcurl.png" alt="Sparsity pattern of a 64 by 64 matrix with the main diagonal and two off-diagonal bands" zoomable=true caption="(b) $L^2$-scalar product of $B_{kl}, C_{kl}$ and the $H(\operatorname{curl})$ basis functions." %}
  </div>
</div>
<div class="caption">Biorthogonal sparsity pattern for $p=6$.</div>

Joint work with

- **Sven Beuchler**, Institute of Applied Mathematics, Leibniz University Hannover
- **Joachim Schöberl**, Institute of Analysis and Scientific Computing, TU Wien
