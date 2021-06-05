function [z] = fitness33y3(x)
%UNTITLED3 Fitness para encontrar el único cuadrado mágico de 3x3
% utilizando 6 números al cuadrado
a=x(1); b=x(2); c=x(3);
if a>(b+c)
    amb_sqrt = sqrt(a-b);
    amb_sqrt_int = round(amb_sqrt);
    apc_sqrt = sqrt(a+c);
    apc_sqrt_int = round(apc_sqrt);
    apbpc_sqrt = sqrt(a+b+c);
    apbpc_sqrt_int = round(apbpc_sqrt);
    ambmc_sqrt = sqrt(a-b-c);
    ambmc_sqrt_int = round(ambmc_sqrt);
    amc_sqrt = sqrt(a-c);
    amc_sqrt_int = round(amc_sqrt);
    ambpc_sqrt = sqrt(a-b+c);
    ambpc_sqrt_int = round(ambpc_sqrt);

    z1 = abs(amb_sqrt_int-amb_sqrt);
    z2 = abs(apc_sqrt_int-apc_sqrt);
    z3 = abs(apbpc_sqrt_int-apbpc_sqrt);
    z4 = abs(ambmc_sqrt_int-ambmc_sqrt);
    z5 = abs(amc_sqrt_int-amc_sqrt);
    z6 = abs(ambpc_sqrt_int-ambpc_sqrt);

    % con esto se asegura que no haya valores iguales
    z_equal = numel(unique([a-b,a+b-c,a+c,a+b+c,a,a-b-c,a-c,a-b+c,a+b]));

    z = z1 + z2 + z3 + z4 + z5 + z6 + exp(10*(9-z_equal));
else
    z = 100000;    
end