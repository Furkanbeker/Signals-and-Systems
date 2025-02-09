fc = 3500;  
tstop = (5/350 - 1/fs);  
fs = 30 * 35000;   
t = 0:1/fs:tstop;  

f1 = 350;            
f2 = 3500;           
f3 = 35000;

x1 = square(2*pi*f1*t);  
x2 = square(2*pi*f2*t);  
x3 = square(2*pi*f3*t);  
            
h = exp(-(t)/(1/(2*pi*fc)));  
y1 = conv(x1, h, 'same'); 
y2 = conv(x2, h, 'same'); 
y3 = conv(x3, h, 'same'); 

figure; 
subplot(4,1,1); 
plot(t, h, 'm', 'LineWidth', 2); 
title('Low-pass Filter Impulse Response h(t)'); 
xlabel('Time (s)'); 
ylabel('Amplitude'); 
legend('h(t)'); 

subplot(4,1,2); 
plot( t, y1, 'r', t, x1, 'b', 'LineWidth', 1.5); 
title('Input and Output for low frequency f1 = 350 Hz'); 
xlabel('Time (s)'); 
ylabel('Amplitude'); 
legend('x(t)', 'y(t)'); 

subplot(4,1,3); 
plot(t, y2, 'r', t, x2, 'b',  'LineWidth', 1.5); 
title('Input and Output for medium f2 = 3.5 kHz'); 
xlabel('Time (s)'); 
ylabel('Amplitude'); 
legend('x(t)', 'y(t)'); 

subplot(4,1,4); 
plot( t, y3, 'r',t, x3, 'b', 'LineWidth', 1.5); 
title('Input and Output for high f3 = 35 kHz'); 
xlabel('Time (s)'); 
ylabel('Amplitude'); 
legend('x(t)', 'y(t)'); 
