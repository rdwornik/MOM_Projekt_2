set T;
set W;
set K1;
set K2;
set E1;
set E2;
set W1_in;
set W2_in;
set W1_out;
set W2_out;
set K;
set E;

param d{i in T};
param p{i in T};

var X{i in W, j in T}, >= 0, integer;

minimize fun:sum{i in W}(
sum{j in K1}(i*X[i,j]*16*533)+
sum{j in K2}(i*X[i,j]*16*537)+
sum{j in K}(i*X[i,j]*151)+
sum{j in K}(X[i,j]*5498)+
sum{j in T}(X[i,j]*d[j]*0.15)
);
subject to
one:
	sum{i in W}(sum{j in K1}(i*X[i,j]*16)) <= 19789;
two:
	sum{i in W}(sum{j in K2}(i*X[i,j]*16)) <= 18895;
three:
	sum{i in W}(sum{j in E1}(i*X[i,j]*16)) >= 14949;
four:
	sum{i in W}(sum{j in E2}(i*X[i,j]*16)) >= 15674;
five{j in T}:
	sum{i in W}(X[i,j]) <= p[j];
six:
	sum{i in W}(sum{j in W1_in}(X[i,j])) <= 38;
seven:
	sum{i in W}(sum{j in W2_in}(X[i,j])) <= 47;
eight{i in W}:
	sum{j in W1_in}(i*X[i,j]) = sum{j in W1_out}(i*X[i,j]);
nine{i in W}:
	sum{j in W2_in}(i*X[i,j]) = sum{j in W2_out}(i*X[i,j]);