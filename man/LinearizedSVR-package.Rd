\docType{package}
\name{LinearizedSVR-package}
\alias{LinearizedSVR-package}
\title{Linearized Support Vector Regression}
\description{
Train and predict using prototype-based Linearized
Support-Vector Regression methods.
}
\details{
Linearized Support Vector Regression is a kernel regression
method where the basis is chosen a priori (instead of by
the training algorithm as is done by the traditional
support vector regression method). This allows the training
method to take advantage of fast linear methods like
(LiblineaR, lm) etc.

The choice of the basis involves picking the prototypes,
which can be done randomly or by k-means, and the kernel.
The complexity of the learned model can be controlled by
the number of prototypes and the choice of the kernel. See
[1] for some theoretical justification for the approach.

In order to take advantage of LiblineaR, a fast linear
classifier whose training scales linearly with the number
of examples, we reduce regression to classification using
the insight proposed in [2]. Given a training dataset
\eqn{\{x_i, y_i\}_{i=1:N}} where we need to build a
regression model to predict \eqn{y} from \eqn{x} we
construct a \eqn{\{0,1\}} classification problem with data
\eqn{\{(x_i, y_i+\epsilon), 1\}_{i=1:N} \cup \{(x_i,
y_i-\epsilon), 0\}_{i=1:N}}. That is, we move the data "up"
and "down" by epsilon and then attempt to find the boundary
between the two sets. The classification boundary then
determines the regression surface. At predict time, in
order to obtain the regression value for a test \eqn{x} we
find the \eqn{y} that would lie on the boundary.

After transforming the data into the chosen basis, it is
trivial to use any other linear methods (e.g., quantreg,
rlm, expect.reg) to obtain the corresponding non-linear
version. We provide expectile regression as an example.

Choice of prototypes: We provide two ways to pick the
prototypes: random and Kmeans.  When clusterY is TRUE, the
Kmeans method also uses the target variable (Y). This
presumably provides better prototype selection for
regression. The parameter nump specifies the number of
prototypes to be used.

The kernel and kpar parameters can be any from the kernlab
package. The epsilon.up and epsilon.down parameters allows
the epsilon insensitivity band for the regression to be
asymmetric.
}
\references{
[1] Balcan, Maria-Florina; Blum, Avrim; and Vempala,
Santosh, "Kernels as Features: On Kernels, Margins, and
Low-dimensional Mappings" (2006). Computer Science
Department. Paper 153.
\url{http://repository.cmu.edu/compsci/153}

[2] "A Geometric Approach to Support Vector Regression",
Jinbo Bi and Kristin P. Bennett, Neurocomputing, 55, 2003,
pp. 79-108
}
\seealso{
LinearizedSVRTrain
}

