###########################Ejercicio 1)
using LinearAlgebra

function sol_tr_sup(A, b)
    if det(A)==0
        println("ERROR: LA MATRIZ ES SINGULAR")
        return 0
    end 
    
    n = size(A,2)    
    x = ones(n)
    for i=n : -1 : 1
        sum = 0
        for j=i+1: n
            sum = sum + A[i,j] * x[j]
        end
        x[i] = (b[i] - sum) / A[i,i]
    end
    
    return x
end

function sol_tr_inf(A,b)
    if det(A)==0
        println("ERROR: LA MATRIZ ES SINGULAR")
        return 0
    end 
    
    n = size(A,2)    
    x = ones(n)
    for i=1 : n
        sum = 0
        for j=1: i-1
            sum = sum + A[i,j] * x[j]
        end
        x[i] = (b[i] - sum) / A[i,i]
    end
    
    return x
end

###########################Ejercicio 2)a)
function egauss(A,b)
    n = size(A,2)
    
    for k=1 : (n-1)
        for i=(k+1) : n
            if (A[k,k] == 0)
                println("La matriz ya es singular")
                break
            end
            
            z = A[i,k]/A[k,k]
            for j=k : n
                A[i,j] = A[i,j] - (z*A[k,j])
            end
            b[i] = b[i] - (z*b[k])
        end
    end
    
    return [A,b]
end

###########################Ejercicio 2)b)
function sol_eg(A,b)
    gauss = egauss(A,b)               #BIEN?????
    U = gauss[1] 
    y = gauss[2] 
    
    resultado = sol_tr_sup(U,y)
    
    return resultado
end

###########################Ejercicio 3)
function sol_lu(A, b)
    L,U,p = lu(A)
    
    b2  = p*b
    y = sol_tr_inf(L,b2)
    x = sol_tr_sup(U,y)
    
    return x
end

###########################Ejercicio 5)
function jacobi(A,b,err, mit)
    n = size(A,1)
    x_k_menos_1 = zeros(n)
    x = ones(n)
    
    k = 1 
    while (k<= mit)
        for i=1 :n
            aux = 0
            for j=1 : n
                if j!=i
                    aux = aux + A[i,j]*x[j]
                end
            end
            x[i] = aux
        end
        if norm(x-x_k_menos_1) < err
            return [x,k]
        end
        x_k_menos_1 = x
        k=k+1
    end
    
    
    return [x,k]
end

function gseidel(A,b,err, mit)
    n = size(A,2)
    x_k_menos_1 = zeros(n)
    x = zeros(n)
    
    k = 1 
    while (k <= mit)
        for i=1 :n
            aux = 0
            for j=1 : n
                if j!=i
                    aux = aux + A[i,j]*x[j]
                end
            end
            x[i] = (b[i] - aux) / A[i,i]
        end
        if norm(x-x_k_menos_1) < err             # veo si la norma de ||x-x(k-1)|| es menor que el error
            return [x,k]
        end
        x_k_menos_1 = x                          # actualizo el x(k-1)
        k=k+1
    end
    
    return [x,k]
end

###########################Ejercicio 6)a)
function ej6_a()
    A = [3 1 1;2 6 1;1 1 4]
    b = [5,9,6]
    
    gs = gseidel(A,b,1e-11,100)
    j = jacobi(A,b,1e-11,100)
		
    println(gs)
    println(j)
end
