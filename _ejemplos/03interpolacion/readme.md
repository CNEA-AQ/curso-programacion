# Interpolación numérica

> Dado *a*,*b*,..., y una función *f(x)* ó sus evaluaciones en *f(a)*,*f(b)*,... . Hayar una aproximación a f(x) (F(x)) tal que: F(a)=f(a), F(b)=f(b), ...


## Polinomio de Taylor
Los polinomios de Taylor son una concepto central de todo el análisis numérico. La idea es que a cualquier función continua y derivable la podemos aproximar en un entorno de un punto **xo** por un polinomio que en ese punto cumpla:
    - Vale f(xo) en xo
    - Todas las derivadas *n-ésimas* de P(x) en xo, coinciden con las derivadas de f(x) en xo.

Podemos construir de forma bastante intuitiva este polinomio:
$$ T(x) = f(xo)+f'(x-xo) + f''(x-xo)^2 / 2! + f'''(x-xo)^3/3!+...$$

## Polinomio de Lagrange
Es un polinomo que se contruye:
  1. Para cada **X_i**: 
      - hacer que el polinomio valga 0 en todos los *x_j* (donde j distinto a i)
      - hacer que el polinomio valga 1 en *x_i*
      - multiplicar todo por *y_i*

  2. Sumar todos los términos de los **x_i**

$$ L(x) =y1* ( (x1-x)*(x2-x)*...*(xn-x))/(x1-x2)*(x1-x3)*...*(x1-xn)) ) + y2*((x1-x)*(x2-x)*...*(xn-x))/(x2-x1)*(x2-x3)*...*(x2.xn)) + .... $$
## Interpolación de Newton
Es un polinomio de Taylor donde las derivadas se construyen vía el método de *difrencias divididas*.

## Interpolación de Hermite
La interpolación de Hermite comparte con el método de Newton el hecho de que utiliza aproximaciónes a las derivadas, y puede hacerse con el método de *diferencias divididas*. Pero a diferencia de este, el polinomio de Hermite se construye de a pedazos, utilizando sólo las **m** derivadas en cada tramo.


## Splines
Los splines también son polinomios *a trozos*. 
La idea es interpolar para cada intervalo (x_i;x_{i+1}) con polinomios q_i que procuren mantener la curvatura de la función entera continua.
La curvatura se define : $k = ddf/ (1+df^2)^{3/2}$
Para garantizar esto se debe cumplir:
  - Las derivadas primeras entre puntos sucesivos debe ser igual.
  - Las derivadas segundas entre puntos sucesivos debe ser igual.

Esto puede garantizarse sólo si se utilizan polinomios de hasta grado 3. Por eso el spline más utilizado es el *spline cúbico*

### Splines cúbicos
