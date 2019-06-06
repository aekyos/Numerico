#using Pkg
#Pkg.add("Plots")
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                               ####################################################Ejercicio 1)
function fun(x)
	#ESPECIFICAR LA FUNCION ACA
	n=x*x*x+5
	return n
end

function rbisec(fun,a,b,err,mit)
	u=fun(a)
	v=fun(b)
	y=b-a
	c=0
	w=0
	hx=[]
	hf=[]
	if (sign(u)==sign(v))
		error("Los signos son iguales")
	end
	for k in 1:mit
		y=y/2
		c=a+y
		w=fun(c)
		push!(hx, c)
		push!(hf, w)
		if abs(y)<err || abs(w)<err
			println("c es una aproximacion de la raiz")
			break
		end 
		if (sign(w)!=sign(u))
			b=c	
			v=w
		else
			a=c
			u=w
		end 
	end
	return [hx,hf]
end

####################################################Ejercicio 2)a)
function fun_lab2ej2a(x)
	x=2*x-tan(x)
	return x
end

####################################################Ejercicio 2)b)
function fun_lab2ej2b(x)
	x=x*x-3	
	return x
end

####################################################Ejercicio 2)c)
function dibujar(hx,hf,length)
	#using Plots
	#for k in 1:length
    #	plot(hx[k],hf[k])
	#end
end

####################################################Ejercicio 3)
function deriv(x)
	x=3*x*x
	return x
end

function rnewton(fun,deriv,x0,err,mit)
	v=fun(x0)	
	hx=[]
	hf=[]
	if abs(v)<err
		error("x0 es la solucion")
	end
	for k in 1:mit
		x1=x0-(v/deriv(x0))
		v=fun(x1)
		push!(hx, x1)
		push!(hf, v)
		if abs(x1-x0)<err || abs(v)<err
			break
		else
			x0=x1
		end
	end
	return [hx,hf]
end

####################################################Ejercicio 4)a)
global a=8
function deriv_4(x)
	x=3*x*x
	return x
end

function fun_lab2ej4a(x)
	x=x*x*x-a
	return x
end

####################################################Ejercicio 4)b)
function rnewton2(fun,deriv,x0,err,mit)
	b=64
	v=fun(x0,b)	
	hx=[]
	hf=[]
	if abs(v)<err
		error("x0 es la solucion")
	end
	for k in 1:mit
		x1=x0-(v/deriv(x0))
		v=fun(x1,b)
		push!(hx, x1)
		push!(hf, v)
		if abs(x1-x0)<err || abs(v)<err
			break
		else
			x0=x1
		end
	end
	return [hx,hf]
end

function fun_lab2ej4b(x,b)
	x=x*x*x-b
	return x
end

####################################################Ejercicio 5)
function ripf(fun,x0,err,mit)
	hx=[]
	hf=[]
	for k in 1:mit
		y=fun(x0)
		push!(hx, x0)
		push!(hf, y)
		if abs(x0-y)<err 
			println("y es el punto fijo buscado.")
			break
		end
		x0=y
	end
	return [hx,hf]
end

####################################################Ejercicio 6)
function ej6(x)
	y=2^(x-1)
end

####################################################Ejercicio 7)
function ej7(y,k)
	y-e
end

function lab2ej7bisec(ej7)
	[hx,hf]=rbisec(ej7,0,2,1e-5,100)
	return hx[size(hx,1)],hf[size(hf,1)]
end
