function [z] = fitness_multi_55(x)
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here
a=x(1); b=x(2); c=x(3); d=x(4); e=x(5); f=x(6); g=x(7); h=x(8); i1=x(9); 
j=x(10); k=x(11); l=x(12); m=x(13); n=x(14); o=x(15);

% Las 25 celdas del cuadrado de 5x5, el primer número representa
% la fila y el segundo la columna
c11=a*b*c*d; c21=e*f*g*h; c31=i1*j*k*o; c41=l*m; c51=n*o;
c12=e*i1*l*n*o; c22=j*m*o; c32=a*f; c42=b*c*g; c52=d*h*k;
c13=g*o; c23=b*k*n; c33=e*h*l; c43=d*i1*j; c53=a*c*f*m*o;
c14=h; c24=a*d*i1*o; c34=c*g*m; c44=f*k*n*o; c54=b*e*j*l;
c15=f*j*k*m; c25=c*l; c35=b*d*n*o; c45=a*e*h*o; c55=g*i1;

% Sumas horizontales, verticales y diagonales
h1 = c11 + c12 + c13 + c14 + c15;
h2 = c21 + c22 + c23 + c24 + c25;
h3 = c31 + c32 + c33 + c34 + c35;
h4 = c41 + c42 + c43 + c44 + c45;
h5 = c51 + c52 + c53 + c54 + c55;

v1 = c11 + c21 + c31 + c41 + c51;
v2 = c12 + c22 + c32 + c42 + c52;
v3 = c13 + c23 + c33 + c43 + c53;
v4 = c14 + c24 + c34 + c44 + c54;
v5 = c15 + c25 + c35 + c45 + c55;

d1 = c11 + c22 + c33 + c44 + c55;
d2 = c15 + c24 + c33 + c42 + c51;

% Diferencias de las sumas de horizontales, verticales y diagonales
dif=(abs(h1-h2) + abs(h1-h3) + abs(h1-h4) + abs(h1-h5) + ...
    abs(h1-v1) + abs(h1-v2) + abs(h1-v3) + abs(h1-v4) + abs(h1-v5) + ...
    abs(h1-d1) + abs(h1-d2))./sum(x.^2);
 
% con esto se asegura que no haya valores iguales
z_equal = numel(unique([c11,c12,c13,c14,c15,c21,c22,c23,c24,c25,...
    c31,c32,c33,c34,c35,c41,c42,c43,c44,c45,c51,c52,c53,c54,c55]));

z = dif + exp(10*(25-z_equal));

end

