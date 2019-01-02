data {
  int<lower=0> n;
  int<lower=0> y[n];
  vector<lower=0, upper=1>[n] x;  // by defining x as a vector, we don't have to use for-loop when defining the model
}

parameters {
  real alpha;  // when defining parameters without giving them priors in the model
  real beta;   // Stan automatically selects the improper uniform prior for them
}

model {
  y ~ poisson(exp(alpha + beta * x));
}
