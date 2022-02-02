def fibs(number)
    a = 0
    b = 1
    fib = []
    while a < number
        fib.push(a)
        a,b = b, a+b
    end
    return fib
end

puts fibs(10)