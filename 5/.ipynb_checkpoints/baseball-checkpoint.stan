data {
  int n_experiments;
  int<lower=0> N[n_experiments];
  int<lower=0> y[n_experiments];
}parameters {
  real<lower=0, upper=1> theta[n_experiments];
  real<lower=0, upper=1> phi;
  real<lower=0.1> lambda;
}

transformed parameters {
  real<lower=0> alpha = lambda * phi;
  real<lower=0> beta = lambda * (1 - phi);
}model {
  lambda ~ pareto(0.1, 1.5);
  theta ~ beta(alpha, beta);
  y ~ binomial(N, theta);
}
