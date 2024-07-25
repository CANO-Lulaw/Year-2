def fibonacci(n):
    if n < 2:
        return n
    return fibonacci(n-1) + fibonacci(n-2)

inp = int(input("Enter Number : "))
F = fibonacci(inp)
print(f"fibo({inp}) = {F} ")