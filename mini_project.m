%enter the sample freqency 
samplingFrequency=input("enter the Sampling frequency\n");
typeOf_SF=class(samplingFrequency);
while(~isnumeric(samplingFrequency)||samplingFrequency<=0)
    samplingFrequency=input("sampling Frequency is positive number try again\n");
    typeOf_SF=class(samplingFrequency);

end
%enter the starting point 
starting_time=input('enter the Starting time\n');
s=starting_time;
typeOf_Starting_time=class(starting_time);
while(~isnumeric(starting_time))
    starting_time = input("starting time is a number try again\n");
    typeOf_Starting_time = class(starting_time);

end
%enter the ending point
ending_time=input('enter the ending time\n');
e=ending_time;
typeOf_ending_time=class(ending_time);
while(~isnumeric(ending_time))
    ending_time = input("ending time is a number try again\n");
    typeOf_ending_time = class(ending_time);

end

%enter the number of breaking points
numberOfBreakPoints=input('enter the number Of Break Points\n');
typeOf_breaking_point=class(numberOfBreakPoints);
while(~isnumeric(numberOfBreakPoints)||numberOfBreakPoints<0)
    numberOfBreakPoints = input("number Of Break Points is a positive number try again\n");
    typeOf_breaking_point = class(numberOfBreakPoints);
    
end
%enter the position of breaking points in seconds
position=zeros(1,numberOfBreakPoints);

for i=1:1:numberOfBreakPoints
    l= input("enter the position number "+i+" ");
    while(~isnumeric(l))
            l= input(" position is a number enter position"+i+" ");
    end
    position(i)=l;
end
position = [starting_time position ending_time];

%enter the type of signals thromugh each duration
fprintf("a. DC signal\nb. Ramp signal\nc. General order polynomial\nd. Exponential signal\ne. Sinusoidal signal\nf. Sinc function\ng. Triangle pulse\n");
signals=[];
sizeOfsignals = size(signals);
%figure;

for i=1:1:numberOfBreakPoints+1
    c =input("enter type signal from "+position(i)+" second to "+position(i+1)+" ");
    while ~(ischar(c))
         c =input("please enter a character which listed\n");
    end
    switch c
        case 'a'
            amplitude_DC = input("enter the amplitude of DC signal");
            t=linspace(position(i),position(i+1),(position(i+1)-position(i))* samplingFrequency);
            signal= zeros(1,(position(i+1)-position(i))* samplingFrequency)+ amplitude_DC;
            plot(t,signal,'b-','LineWidth',1)
            hold on;
        case 'b'
            slope     = input("enter slope of the ramp signal ");
            intercept_ramp = input("enter the intercept of the ramp signal ");
            t=linspace(position(i),position(i+1),(position(i+1)-position(i))* samplingFrequency);
          
            signal = slope*t + intercept_ramp;
            
            plot(t,signal,'b-','LineWidth',1)
            hold on;
        case 'c'
            amplitude_poly = input("enter the amplitude of the General order polynomial ");
            Power = input("enter the Power of the General order polynomial ");
            intercept_poly = input("enter the intercept of the General order polynomia ");
            t=linspace(position(i),position(i+1),(position(i+1)-position(i))* samplingFrequency);
          
            signal = amplitude_poly * (t.^Power) + intercept_poly;
            
            plot(t,signal,'r-','LineWidth',1)
            hold on;
        case 'd'
            amplitude_expo=input("enter the amplitude of the exponential signal ");
            exponent=input("enter the exponent of the exponential signal ");
            t=linspace(position(i),position(i+1),(position(i+1)-position(i))* samplingFrequency);
          
            signal =amplitude_expo* exp(exponent*t) ;
            
            plot(t,signal,'g-','LineWidth',1)
            hold on;
        case 'e'
            amplitude_sinusoidal=input("enter the amplitude of the sinusoidal signal ");
            freqency=input("enter the freqency of the sinusoidal signal ");
            phase= input("the phase of the sinusoidal signal ");
            t=linspace(position(i),position(i+1),(position(i+1)-position(i))* samplingFrequency);
            signal = amplitude_sinusoidal*sin(2*pi*freqency*t+phase);
            plot(t,signal,'y-','LineWidth',1)
            hold on;
        case 'f'
            amplitude_sinc = input("enter the amplitude of sinc function ");
            center_shift_sinc = input("enter the center shift of the sinc function ");
            t=linspace(position(i),position(i+1),(position(i+1)-position(i))* samplingFrequency);
            signal = amplitude_sinc*sinc(t-center_shift_sinc);
            plot(t,signal,'g-','LineWidth',1)
            hold on;
        case 'g'
            amplitude_triangle = input("enter the amplitude of the triangle signal ");
            center_shift_triangle = input("enter the center shift of triangle signal ");
            width= input("enter the width of triangle signal ");
            t=linspace(position(i),position(i+1),(position(i+1)-position(i))* samplingFrequency);
            signal = amplitude_triangle *sawtooth(2*pi*(t-center_shift_triangle)/width,0.5);
            plot(t,signal,'g-','LineWidth',1)
            hold on;
    end
    if i== numberOfBreakPoints+1
        hold off;
    end
    f = cat(2,signals,signal);
    signals=f;
    m=f; 
end
figure;
t=linspace(starting_time,ending_time,(ending_time-starting_time)*samplingFrequency);
plot(t,signals,'-g','LineWidth',1)
i=0;
fprintf("a. Amplitude Scaling: scale value. \nb. Time reversal. \nc. Time shift: shift value.\nd. Expanding the signal: expanding value\ne. Compressing the signal: compressing value\nf. Clipping the signal: upper and Lower clipping values\ng. The first derivative of the signal.\nh. None. \n")
figure_num=3;
t=linspace(starting_time,(ending_time),(ending_time-starting_time)*samplingFrequency);  %to prevent any change in time at any case

while 1
    c =input("which operation you want to perform on signals");
    while ~(ischar(c))
         c =input("please enter a character which listed\n");
    end

    switch c
        case 'a'
            amplitude_scaling = input("enter the magnitude of ampltude scale");%amplitude scaling 
            t1=linspace(starting_time,(ending_time),(ending_time-starting_time)*samplingFrequency);
            signals=signals * amplitude_scaling;
            figure(figure_num)
            plot(t1,signals,'b-','LineWidth',1)
            title('Amplified Signal')
            %hold on;
            %f=signals;
        case 'b'
            signals=flip(signals);%time reverse
            t2=linspace(starting_time,(ending_time),(ending_time-starting_time)*samplingFrequency);
            t2=-1. * t2;
            figure(figure_num)
            signals=signals(end:-1:1);
            plot(t2,signals,'b-','LineWidth',1)
            title('Time Reversed Signal')
            %temp = starting_time
            %starting_time = -ending_time
            %ending_time = -temp
            %f=signals;
        case 'c'
           time_shift = input("enter the time shift ");%time shift
           t3=linspace(starting_time,(ending_time),(ending_time-starting_time)*samplingFrequency);
           t3=t3 + time_shift;
           figure(figure_num)
           plot(t3,signals,'r-','LineWidth',1)
           title('Time Shifted Signal')
           
           %f=signals;
           %hold on;
        case 'd'
            expand=input("enter the expanding value");%time expantion
            %t=expand*t;
            start_expantion=starting_time * expand;
            end_expantion=ending_time * expand;
            t4=linspace(start_expantion,end_expantion,(end_expantion - start_expantion)*samplingFrequency);
            signals=resample(signals,expand,1,'Dimension',2);
            figure(figure_num)
            plot(t4,signals,'r-','LineWidth',1)
            title('Time Expand Signal')
            %f=signals;
            ending_time=end_expantion;
            starting_time=start_expantion;
            %hold on;
        case 'e'
           compress= input("enter compression factor");%time compression
           start_compression=starting_time/compress;
           end_compression=ending_time/compress;
           t5=linspace(start_compression,(end_compression),(end_compression-start_compression)*samplingFrequency);
           %t5=t5./compress;
           signals = downsample(signals,compress);
           figure(figure_num);          
           plot(t5,signals,'g-','LineWidth',1);
           title('Time Compressed Signal');
           ending_time=end_compression;
           starting_time=start_compression;
           %f=signals;
           %hold on;
        case 'f'
            min = input("enter the minmum clipping  ");%clipping
            max = input("enter the maxmum clipping  ");
            %signals = f;
            t6=linspace(starting_time,(ending_time),(ending_time-starting_time)*samplingFrequency);
            f=signals;
            signals(f < min) = min;
            signals(f > max) = max;
            figure(figure_num)          
            plot(t6,signals,'g-','LineWidth',1)
            title('Clipped Signal')
            %f=signals;
            %hold on;
        case 'g'
            t7=linspace(starting_time,(ending_time),(ending_time-starting_time)*samplingFrequency);
            diffsignal=zeros(1,size(signals,2));
            for k=1:(size(t7,2)-1)
                 diffsignal(k)=(signals(k+1)-signals(k))/(t7(k+1)-t7(k));
            end
            z=zeros(1,i);
            signal = [diffsignal z];
            signals=signal;
            figure(figure_num)          
            plot(t7,signals,'g-','LineWidth',1)
            title('Differntiate Signal')
            %f=signals;
        case 'h'
            signals= m;
            figure(figure_num)          
            plot(t,signals,'g-','LineWidth',1)
            title('nothing')  
            ending_time=e;
            starting_time=s;
            fprintf("%d",starting_time);
            fprintf("%d",ending_time);
    end
   figure_num=figure_num+1;

end



  

