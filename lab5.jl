###########################Ejercicio 1)
function f_1(x)
    f = x
    return f
end

function inte_num_comp(f,a,b,N,regla)
    xj = LinRange(a,b,N+1)                 #hago N+1 puntos (asi quedan N intervalos) x espaciados en [a,b]
    sx = 0
    
    if regla=="trapecio"                 #══════════════════════════════════════ REGLA DEL TRAPECIO
        println("REGLA DEL TRAPECIO:")
        
        for i=1 : N
            h = (xj[i+1]-xj[i])/N
            sx = sx + h / 2 * (f(xj[i+1])+f(xj[i]))
        end
        
        
    elseif regla=="pm"                   #═════════════════════════════════ REGLA DEL PUNTO MEDIO ═╗
        println("REGLA DEL PUNTO MEDIO:")                                                         #║
                                                                                                  #║
        for i=1 : N                                                                               #║
            pm = (xj[i+1]+xj[i])/2                                                                #║
            sx = sx + f(pm)*(xj[i+1]-xj[i])                                                       #║
        end                                                                                       #║
                                         #═════════════════════════════════════════════════════════╝
    elseif regla=="simpson"              #══════════════════════════════════════ REGLA DE SIMPSON ═╗        da cualquier cosa esto 
        if (mod(N,2)==1)
            println("NO SE PUEDE HACER SIMPSON CON N IMPAR.")
        else
            println("REGLA DE SIMPSON:")
            h = (b-a)/N
            sx0 = f(a)+f(b)
            sx1 = 0
            sx2 = 0 

            for i=1 : N-1
                x = i*h + a
                if (mod(i,2)==0)
                    sx2 = sx2 + f(x)
                else
                    sx1 = sx1 + f(x)
                end
            end
            sx = (sx0 + 2 * sx2 + 4 * sx1) * h/3
        end

    else
        println("no esta esta regla.")
    end
    
    return sx
end

###########################Ejercicio 2)
function f_ej2(x)
    f = 1/exp(x)
    return f
end

function ej2()
    trap_4 = inte_num_comp(f_ej2,0,1,4,"trapecio")
    trap_10 = inte_num_comp(f_ej2,0,1,10,"trapecio")
    trap_20 = inte_num_comp(f_ej2,0,1,20,"trapecio")
    
    println("La regla del trapecio con 4 intervalos es: ",trap_4)
    println("La regla del trapecio con 10 intervalos es: ",trap_10)
    println("La regla del trapecio con 20 intervalos es: ",trap_20)
    
    pm_4 = inte_num_comp(f_ej2,0,1,4,"pm")
    pm_10 = inte_num_comp(f_ej2,0,1,10,"pm")
    pm_20 = inte_num_comp(f_ej2,0,1,20,"pm")
    
    println("La regla del punto medio con 4 intervalos es: ",pm_4)
    println("La regla del punto medio con 10 intervalos es: ",pm_10)
    println("La regla del punto medio con 20 intervalos es: ",pm_20)
    
    simpson_4 = inte_num_comp(f_ej2,0,1,4,"simpson")
    simpson_10 = inte_num_comp(f_ej2,0,1,10,"simpson")
    simpson_20 = inte_num_comp(f_ej2,0,1,20,"simpson")
        
    println("La regla de simpson con 4 intervalos es: ",simpson_4)
    println("La regla de simpson con 10 intervalos es: ",simpson_10)
    println("La regla de simpson con 20 intervalos es: ",simpson_20)
end

###########################Ejercicio 3)
using Plots

function senint(xi)
    n = ceil(10*xi)                                     #CALCULO LA CANTIDAD DE INTERVALOS
    integral = inte_num_comp(cos,0,xi,n,"pm")           #HAGO LA INTEGRAL CON ESA CANTIDAD DE PUNTOS
    
    return integral    
end

function ej3(x)
    y = []
        
    for j=1 : length(x)
        append!(y,senint(j))                            #CALCULO senint(xi)
    end 
    
    return y                                           #DEVUELVO LA INTEGRAL DE TODOS LOS XI QUE ME PASARON
end

function ej3_plot()
    x = 0:0.5:(2*pi)
    plot(x,senint,linewidth=2,label="senint")                #GRAFICO SENINT(x)
    plot!(x,sin,label="sen")                                       #GRAFICO SEN(x)
end

###########################Ejercicio 4)a)
function f_ej4a(x)
    f = x/(exp(x))
    return f
end

function ej4a()
    real = 0.264241                                     #valor real la integral               
    i = 2
    a = inte_num_comp(f_ej4a,0,1,i,"simpson")
    error = abs(real-a)
    while (error > 0.0001)                              #MIENTRAS NO SE CUMPLA EL ERROR
        a = inte_num_comp(f_ej4a,0,1,i,"simpson")       #CALCULO LA INTEGRAL CON i INTERVALOS   
        i = i+2                                         #AUMENTO EN DOS LA CANTIDAD DE INTERVALOS PORQUE EN SIMPSON NO PUEDE SER IMPAR
        error = abs(real-a)                             #CALCULO EL ERROR
    end
    
    return a
end
