fs = 48000; 

f1 = 300
f2 = 5000
f3 = 18000
fs = 44100

nCyl = 5

A = 1

t = 0:1/fs:nCyl

x1 = A*sin(2*pi*t*f1)
x2 = A*sin(2*pi*t*f2)
x3 = A*sin(2*pi*t*f3)

sum = x1+x2+x3

sound(x1, fs)

audiowrite("Sum.wav", sum, fs)