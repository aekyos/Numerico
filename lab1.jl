####################################################Ejercicio 2)

function overflow()
	j=1.0
	exponente = 1
	while isfinite(j)
		j=2*j
		println(j)
		println(isfinite(j))
		println(exponente)
		exponente = exponente + 1
	end
end

function underflow()
	j=1.0
	exponente = 1
	while j != 0
		j=j/2
		println(j)
		println(exponente)
		exponente = exponente + 1
	end
end	

####################################################Ejercicio 3)

function ejercicio3()
	x = 0;
	while x!=10
		x = x + 0.5
		println(x)
	end
end

# En 0,1 no frena porque este numero no tiene una representacion finita en binario pero el 0,5 si entonces funciona.

####################################################Ejercicio 4)

function fact6()
	x = 1
	for i = 1:6
		x = x * i
		println(x)
	end
end 

function factDeN(n)
	x = 1
	for i = 1:n
		x = x * i
		#println(x)
	end
	return x
end 

####################################################Ejercicio 5)
function ejercicio5(n,i)
	if n > i
		return n
	elseif n == i
		println("Son iguales")
	else n < i
	    return i
	end 
end

####################################################Ejercicio 6)
function ejercicio6(x,n)
	return (x^n)
end

function prim5pot(x)
	for i = 1:5
		println(ejercicio6(x,i))
	end
end

####################################################Ejercicio 7)

function baskmala(a,b,c)
	x1=((-b) + sqrt((b^2) -(4*a*c)))/(2*a)
	x2=((-b) - sqrt((b^2) -(4*a*c)))/(2*a)
	return (x1,x2)
end

function baskbuena(a,b,c)
	x1=(4*(-a)*(-c))/((2*a)*(-b+sqrt((b^2)-4*a*c)))
	x2=(4*(-a)*(-c))/((2*a)*(-b-sqrt((b^2)-4*a*c)))
	return (x1,x2)
end

####################################################Ejercicio 8)
function horn(coefs, x)
	n=2
	b=coefs[1]
	while n<((length(coefs))+1)
		b=(b*x)+coefs[n]
		n=n+1
	end
	return b
end

