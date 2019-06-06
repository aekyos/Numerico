###########################Ejercicio 1)
function ilagrange(x,y,z)
	p=[]

	for i = 1:length(z)
		psubi=0

		for k = 1:length(y)
			l=1
			for j = 1:length(x)
				if k!=j
					l=l*((z[i]-x[j])/(x[k]-x[j]))
				end
			end
			psubi=psubi+y[k]*l
		end
		append!(p,psubi)
	end

	return p
end

###########################Ejercicio 2)
function inewton(x,y,z)
	dif=[]
	resultados=[]
	n=length(x)

	for i = 1:n
		append!(dif,y[i])
	end	

	for j = 2 : n
		for i = n : -1 : j
			dif[i] = (dif[i]-dif[i-1])/(x[i]-x[i-j+1])
		end
	end 
	
	for i = 1 : length(z)
		res_parcial = 0
		for j = 1 : n
			pol = 1
			for k = 1 : j-1
				pol = pol * (z[i]-x[k])
			end		
			res_parcial = res_parcial + dif[j] * pol
		end

		append!(resultados, res_parcial)
	end

	return resultados
end

function inewton_alternativa(x,y,z) #NO FUNCIONA PERO ES LO QUE ESTABA EN EL PIZARRON 
#	dif=[]
#	resultados=[]
#	n=length(x) 	
#
#	for i = 1:n
#		append!(dif,y[i])
#	end	
#
#	for j = 2 : n
#		for i = n : -1 : j
#			dif[i] = (dif[i]-dif[i-1])/(x[i]-x[i-j+1])
#		end
#	end 
#	
#	for i = 1 : length(z)
#		res_parcial = 0
#		for j = 1 : n
#			pol = 1
#			for k = 1 : j
#				pol = pol * (z[i]-x[k])
#			end		
#			res_parcial = res_parcial + dif[j] * pol
#		end
#
#		append!(resultados, res_parcial)
#	end
#
#	return resultados
end

###########################Ejercicio 3)
function uno_sobre_x(x)
	f=1/x
	return f
end

function ej3()
	x=[]
	y=[]
	z=[]
	
	for i = 1 : 5
		append!(x,i)
		f=uno_sobre_x(i)
		append!(y,f)
	end

	for j = 1 : 101
		a = (24/25)+(j/25)      #calculo los puntos equiespaciados
		append!(z,a)            #agrego los puntos al arreglo z
	end

	p = inewton(x,y,z)          #calculo polinomio interpolante de newton con los -x, y- y luego los evaluo en z
 
	return p
end 

###########################Ejercicio 4)
function f_ej4(x)
	f = 1/(1+25*x*x)
	return f	
end

function ej4()
	for n=1 : 15 # hago variar el n entre 1 y 15
		x = []
		y = []
		z = []

		for i=1 : n+1
			xi = (2*(i-1))/(n-1) 	#calculo los xi
			append!(x,xi)			#agrego los xi al arreglo
			yi = f_ej4(xi)			#calculo los f(xi)
			append!(y,yi)			#agrego los f(xi) al arreglo
		end
		
		zi = -1						#calculo el primer punto
		for i=1 : 201
			zi = -1 + ((i-1) / 100) #calculo los siguientes puntos equiespaciados
			append!(z,zi)			#agrego al arreglo los puntos 200 puntos equiespaciados en el [-1,1]
		end
		
		return z
	end
end

###########################Ejercicio 5)
using DelimitedFiles
using Dierckx

function ej5()
    a = readdlm("datos_aeroCBA.dat", '\t', Float64)
    todos_años = a[:,1]
    id = isfinite.(a[:,2])                              #ve que numeros son finitos y devuelve un bool
    años = a[id,1]                                      #se queda con los valores donde id es true
    temp = a[id,2]
    
    spl = Spline1D(años, temp, bc="extrapolate")        #hace el spline con los años donde hay temperatura media
    
    todas_temp = spl.(todos_años)                       #calculo el spline a todos los años
                                                        #falta graficar
    return todas_temp
end 
