def fibs(number)
    a = 0
    b = 1
    fib = []
    (1..number).each do
        fib.push(a)
        a,b = b, a+b
    end
    return fib
end

def fibs_rec(number)
    return [] if number == 0
    return [0] if number == 1
    return [0,1] if number == 2

    fib = fibs_rec(number - 1)
    fib << fib[-2] + fib[-1]

    return fib
end

#puts fibs(10)
puts fibs_rec(10)