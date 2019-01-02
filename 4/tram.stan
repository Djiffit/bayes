data {
  
int<lower=0> n;

real<lower=0> y[n];

}



parameters {
  
real<lower=max(y)> theta;

}



model {
  
theta ~ pareto(1, 1);
  
y ~ uniform(0, theta);

}


