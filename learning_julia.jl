println("I'm excited to learn Julia!")

myanswer = 42
typeof(myanswer)

my_pi = 3.141592
typeof(my_pi)

😸 = "Smiley cat!"
typeof(😸)

#Single line comment
#=
Multi
line
comment
=#

days = 365
days_float = convert(Float64,days)

convert(Int64,"1")

parse(Int64,"1")

clever = """quotes with "this feature" are cool"""

clever = "We will get an "error" here"

typeof('a')

'We will get an error here'

name = "Jane"
fingers = 10
toes = 10
println("Hello my name is $name")
println("Hi I have $fingers fingers and 10+10=$(fingers+toes)")
println("1+1=",2,"!")

s3="How many cats "
s4="are too many cats"
s3*s4

"$s3$s4"

myphonebook = Dict("Jenny" => "111-2222", "Bob" => "121-2121")

myphonebook["Craig"] = "222-3333"

myphonebook

pop!(myphonebook,"Craig")

myphonebook

myphonebook["Jenny"]

myfavoriteanimals = ("seals","dogs","giraffes")

myfavoriteanimals[1]

myfavoriteanimals[1] = "seal lions"

fibonacci = [1,1,2,3,5,8]

stuff = [1,2,"pizza"]

push!(fibonacci,21)

pop!(fibonacci)

mat = [[1,2],[2,1]]

rand(4,3)

rand(4,3,2)

n = 0
while n < 10
    n+=1
    println(n)
end

myfriends = ["Steven","Cara","Brendan"]

i = 1
while i <= length(myfriends)
    friend = myfriends[i]
    println("Hi $friend, it's great to see you!")
    i+=1
end

for n in 1:10
    println(n)
end

for n ∈ 1:10 #\in + tab
    println(n)
end 

m,n = 5,5
A = zeros(m,n)

for i ∈ 1:m
    for j ∈ 1:n
        A[i,j] = i+j
    end
end
A  

B = zeros(m,n)
for i ∈ 1:m, j ∈ 1:n
    B[i,j] = i+j
end
B    

C = [i+j for i ∈ 1:m, j ∈ 1:n]

for n in 1:10
    A = [i+j for i in 1:n, j in 1:n]
    display(A)
end 

x = 5
y = 3
if x < y
    println("a")
elseif y < x
    println("b")
else
    println("c")
end

if x > y
    println(x)
else
    println(y)
end

(x > y) ? x : y

(x > y) && println("Print")
(x < y) && println("Don't print")

function sayhi(name)
    println("Hi $name, it's great to see you!")
end

sayhi("George")

function f(x)
    x^2
end

f(42)

f2(x) = x^2
f2(42)

f3 = x -> x^2
f3(42)

A = rand(3,3)
f(A)

arr = [1,2,4,4]
f(arr)

f.(arr) #broadcast f over a one-dimensional array, tells Julia to unambiguously apply f to the elements of the input

using Plots

x = -3:0.1:3
f(x) = x^2
y = f.(x)

gr() #Load the GR backend

plot(x,y,label="line")
scatter!(x,y,label="points") #The ! (bang) stacks plots

plotlyjs() #Now using the plotlyjs backend

#same syntax as before
plot(x,y,label="line")
scatter!(x,y,label="points") #The ! (bang) stacks plots
#now we can run cursor over data and see values

globaltemperatures = [14.4,14.5,14.8,15.2,15.5,15.8]
numpirates = [45000,20000,15000,5000,400,17]

plot(numpirates,globaltemperatures,legend=false)
scatter!(numpirates,globaltemperatures,legend=false)
xflip!()
xlabel!("Number of pirates (Approximate)")
ylabel!("Global Temperature (C)")
title!("Influence of pirate population on global warming")

p1 = plot(x,x)
p2 = plot(x,x.^2)
p3 = plot(x,x.^3)
p4 = plot(x,x.^4)
plot(p1,p2,p3,p4,layout=(2,2),legend=false)

methods(+)

@which 3+3

@which 3.0 + 3.0

@which 3 + 3.0

import Base: +

"hello " + "world!" 

@which "hello " + "world!" 

+(x::String, y::String) = string(x,y)

"hello " + "world!"

@which "hello " + "world!" 

foo(x,y) = println("heyo")
foo(x::Int,y::Float64) = println("hello")
foo(x::Float64,y::Float64) = println("hi")
foo(x::Int,y::Int) = println("Howdy")

foo(1,1)

foo(1.,1.)

foo(1,1.)

foo(true,false)

A = rand(1:4,3,3)

B = A
C = copy(A)
[B C]

A[1] = 17
[B C]

x = ones(3)

b = A*x

Asym = A + A'

Apd = A'A

A\b #Solve Ax=b. I think that the solution with the smallest norm is returned

using LinearAlgebra

A = randn(3,3)

l,u,p = lu(A)

display(norm(l*u-A))
display(norm(l*u-A[p,:]))

l,u,p = lu(A, Val(false)) #turn off pivoting
display(norm(l*u-A))
