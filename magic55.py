from numba import jit, njit
import numpy as np
@njit
def fitness_multi_55(x):
    #UNTITLED2 Summary of this function goes here
    #   Detailed explanation goes here
    a=x[0]; b=x[1]; c=x[2]; d=x[3]; e=x[4]; f=x[5]; g=x[6]; h=x[7]; i1=x[8]; 
    j=x[9]; k=x[10]; l=x[11]; m=x[12]; n=x[13]; o=x[14];

    # Las 25 celdas del cuadrado de 5x5, el primer número representa
    # la fila y el segundo la columna
    c11=a*b*c*d; c21=e*f*g*h; c31=i1*j*k*o; c41=l*m; c51=n*o;
    c12=e*i1*l*n*o; c22=j*m*o; c32=a*f; c42=b*c*g; c52=d*h*k;
    c13=g*o; c23=b*k*n; c33=e*h*l; c43=d*i1*j; c53=a*c*f*m*o;
    c14=h; c24=a*d*i1*o; c34=c*g*m; c44=f*k*n*o; c54=b*e*j*l;
    c15=f*j*k*m; c25=c*l; c35=b*d*n*o; c45=a*e*h*o; c55=g*i1;

    # Sumas horizontales, verticales y diagonales
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

    # Diferencias de las sumas de horizontales, verticales y diagonales
    dif=(np.abs(h1-h2) + np.abs(h1-h3) + np.abs(h1-h4) + np.abs(h1-h5) +
         np.abs(h1-v1) + np.abs(h1-v2) + np.abs(h1-v3) + np.abs(h1-v4) + np.abs(h1-v5) +
         np.abs(h1-d1) + np.abs(h1-d2))/np.sum(x**2);
    
    # con esto se asegura que no haya valores iguales
    z_equal = len(np.unique(np.array([c11,c12,c13,c14,c15,c21,c22,c23,c24,c25,
        c31,c32,c33,c34,c35,c41,c42,c43,c44,c45,c51,c52,c53,c54,c55])));

    z = dif + np.exp(10*(25-z_equal));

    return z
