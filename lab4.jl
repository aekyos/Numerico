###########################Ejercicio 1)a)
using DelimitedFiles
using LinearAlgebra

function ej1a()
    datos = readdlm("datos1a.dat", '\t', Float64)

    x = datos[:,1]    
    y = datos[:,2]
    
    m = length(x)
    
    sum_xi=sum(x)                               #calculo la sumatora de los xi
    
    sum_yi=sum(y)                               #calculo la sumatora de los yi
    
    sum_xi_yi = 0
    for i=1 : m
        sum_xi_yi = sum_xi_yi + (x[i]*y[i])     #calculo la sumatora de los xi*yi
    end
    
    sum_xi_cuad = 0
    for i=1 : m
        sum_xi_xi = sum_xi_yi + (x[i]*x[i])     #calculo la sumatora de los xi^2
    end
    
    a = (m*sum_xi_yi-sum_xi*sum_yi)/(m*sum_xi_cuad-(sum_xi*sum_xi))                     #calculo el a con la formula
    b = ((sum_xi_cuad*sum_yi)-(sum_xi_yi*sum_xi))/((m*sum_xi_cuad)-(sum_xi*sum_xi))     #calculo el b con la formula
    
    return a,b
end

###########################Ejercicio 1)b)
using Polynomials

function ej1b()
    p = Poly([-1/2, 3/4])                   #declaro el polinomio p 
    x = LinRange(0,10,20)                   #hago 20 puntos x-espaciados en [0,10]
    y = ones(20)
    for i=1 : 20 
        y[i] = polyval(p,x[i])+randn()      #evaluo los puntos en los xi y le sumo randn asi no quedan justo igual
    end
    
    a = polyfit(x, y, 1)    #hago la aproximacion en sentido de cuadrados minimos de los puntos que calcule antes (tiene que dar mas o menos lo mismo que el p)

    return a
end

###########################Ejercicio 2)a)
function ej2a()
    x = LinRange(0,1,50)                    #hago 50 puntos x espaciados en [0,1]
    y = asin.(x)                            #le aplico arcsen(x) a todos los puntos
    
    a = polyfit(x, y, 5)                    #aproximo en sentido de cuad min con el pol de gr 5
    
    return a
end

###########################Ejercicio 2)b)
function ej2b()
    x = LinRange(0,4*pi,50)                 #hago 50 puntos x espaciados en [0,4π]
    y = cos.(x)                             #le aplico cos(x) a todos los puntos
    
    a = polyfit(x, y, 5)                    #aproximo en sentido de cuad min con el pol de gr 5
    
    return x
end

###########################Ejercicio 3)a)
function ej3a() 
    datos = readdlm("datos3a.dat", '\t', Float64)

    x = datos[:,1]                      #leo los x del archivo
    y = datos[:,2]                      #leo los y del archivo
    ln_y = log.(y)                      #calculo ln y = ln C + A * ln x
    
    p = polyfit(log.(x), ln_y, 1)       #aproximo con ln x, ln y 
    
    a = exp(p[1])                       #hago e^(ln C + A * ln x) para recuperar la funcion y me da
    c = p[0]                            #C+ e^A * x. En estas dos lineas calculo el a y el c.
        
    return p,c,a
end

###########################Ejercicio 3)b)
function f_3b(x,y)
    f = x/y
    return f
end

function ej3b() 
    datos = readdlm("datos3b.dat", '\t', Float64)

    x = datos[:,1]                      #leo los x del archivo
    y = datos[:,2]                      #leo los y del archivo
    
    x_sobre_y = ones(length(x))         #llevo a la forma x/y = Ax+B
    for i=1 : length(x)
        x_sobre_y[i] = x[i]/y[i]        #calculo los x/y
    end
    
    p = polyfit(x, x_sobre_y, 1)        #aproximo con x/y, x            ??????BIEN
    
    a = exp(p[1])                       #recupero mi a original         ???COMO HAGO ESTO
    b = p[0]                            #recupero mi y original         ?COMO HAGO ESTO
        
    return p
end
