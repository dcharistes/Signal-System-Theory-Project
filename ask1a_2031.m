function ask1a_2031

clc;clear;
dt=0.01;
t=-10:dt:10;

for i=1:5
    switch(i)
        case 1 
            x=3/4*heaviside(t+0.25);
            h=exp(-0.25*t).*heaviside(t-0.75);
            c_culc=3*(exp(-3/16)-exp(-(4*t+1)/16)).*heaviside(t-0.5);
        case 2
            x=heaviside(t+0.25)-heaviside(t-1);
            h=exp((-1/3)*t.^2);
            c_culc=dt*conv(x,h,'same');
        case 3
            x=exp(-0.75*t).*(heaviside(t+2)-heaviside(t-0.75));
            h=0.75*heaviside(t)-0.25;
            c_culc=(1/3*(exp(-9/16)-exp(3/2)))*(heaviside(t+10)-heaviside(t+2)) + (1/3*(2*exp(3/2)+exp(-9/16))-exp(-0.75*t)).*(heaviside(t+2)-heaviside(t-0.75)) + (2/3*(exp(3/2)-exp(-9/16)))*heaviside(t-0.75);
        case 4
            x=0.75*(heaviside(t+(pi/4))-heaviside(t-(pi/4)));
            h=cos(0.25*t);
            c_culc=(-3*(sin(0.25*t-(pi/16))-sin(0.25*t+(pi/16)))).*(heaviside(t+(pi/4))-heaviside(t-(pi/4)));
        case 5
            x=heaviside(t+1)-heaviside(t-2);
            h=0.25*(heaviside(t+0.75)-heaviside(t-0.75));
            c_culc= 0*(heaviside(t+(7/4))) + (1/4*(t+7/4)).*(heaviside(t+(7/4))-heaviside(t+0.25)) + 3/8*(heaviside(t+0.25)-heaviside(t-(5/4))) + (-0.25*t +(11/16)).*(heaviside(t-(5/4))-heaviside(t-(11/4))) + 0*heaviside(t-(11/4));
        
    end

    l=(1:length(c_culc)).*dt +t(1);
    
    figure(i)
    subplot(311), plot(t,x,'r'), title('x impulse response'),
    grid on, xlim([-10 10]), xlabel('t'), ylabel('amp');
    
    subplot(312), plot(t,h,'b'), title('h system input'),
    grid on, xlim([-10 10]), xlabel('t'), ylabel('amp');
    
    subplot(313), plot(l,c_culc,'r'), title('x(t)*h(t) system response - convolution(culc)'),
    grid on, xlim([-10 10]), xlabel('t'), ylabel('amp');
    
end

end