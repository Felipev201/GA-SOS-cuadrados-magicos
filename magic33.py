from numba import jit, njit
import numpy as np
@njit
def fitness33y6(x):
    # Fitness para encontrar el único cuadrado mágico de 3x3
    # utilizando 6 números al cuadrado
    a=x[0]; b=x[1]; c=x[2];
    if a>b+c:
        amb_sqrt = np.sqrt(a-b)
        amb_sqrt_int = np.rint(amb_sqrt)
        apc_sqrt = np.sqrt(a+c)
        apc_sqrt_int = np.rint(apc_sqrt)
        apbpc_sqrt = np.sqrt(a+b+c)
        apbpc_sqrt_int = np.rint(apbpc_sqrt)
        ambmc_sqrt = np.sqrt(a-b-c)
        ambmc_sqrt_int = np.rint(ambmc_sqrt)
        amc_sqrt = np.sqrt(a-c)
        amc_sqrt_int = np.rint(amc_sqrt)
        ambpc_sqrt = np.sqrt(a-b+c)
        ambpc_sqrt_int = np.rint(ambpc_sqrt)

        z1 = np.abs(amb_sqrt_int-amb_sqrt)
        z2 = np.abs(apc_sqrt_int-apc_sqrt)
        z3 = np.abs(apbpc_sqrt_int-apbpc_sqrt)
        z4 = np.abs(ambmc_sqrt_int-ambmc_sqrt)
        z5 = np.abs(amc_sqrt_int-amc_sqrt)
        z6 = np.abs(ambpc_sqrt_int-ambpc_sqrt)

        # con esto se asegura que no haya valores iguales
        z_equal = len(np.unique(np.array([a-b,a+b-c,a+c,a+b+c,a,a-b-c,a-c,a-b+c,a+b])))

        z= z1 + z2 + z3 + z4 + z5 + z6 + np.exp(10*(9-z_equal))
    else:
        z = 1000    
    return z
