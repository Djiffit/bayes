data {
    int<lower=0> N;
    int<lower=0> AB[N];
    int<lower=0> hits[N];
}

parameters {
    real<lower=0, upper=1> phi;
    real<lower=0.1> lambda;
    real<lower=0, upper=1> theta[N];
}

transformed parameters {
    real<lower=0> a = lambda * phi;
    real<lower=0> b = lambda * ( 1 - phi ); 
}

model {
    hits ~ binomial(AB, theta);
    lambda ~ pareto(0.1, 1.5);
    theta ~ beta(a, b);
}