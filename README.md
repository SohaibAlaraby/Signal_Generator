# Signal_Generator
# Mini Project I: General signal generator
It is required to implement a general signal generator that has the following specifications: 
1. When the program starts the program asks the user for the following parameters: 
a. Sampling frequency of signal. 
b. Start and end of time scale 
c. Number of the break points and their positions (i.e. the points that the signal definition rule 
changes). 
Example: The signal is defined from -2:0 as a DC signal and from 0:2 as ramp the user will enter that 
the number of break points =1 and the position at t=0. 
2. According to the number of break points the program asks the user at each region to enter the 
specifications of the signal at this region Which are: 
a. DC signal: Amplitude. 
b. Ramp signal: slope – intercept. 
c. General order polynomial: Amplitude-power – intercept.
d. Exponential signal: Amplitude – exponent. 
e. Sinusoidal signal: Amplitude – frequency – phase. 
f. Sinc function: Amplitude – center shift.
g. Triangle pulse: Amplitude – center shift- width.
3. Display the resulting signal in time domain .
4. the program asks the user if he wants to perform any operation on the signal
a. Amplitude Scaling: scale value. 
b. Time reversal. 
c. Time shift: shift value. 
d. Expanding the signal: expanding value
e. Compressing the signal: compressing value
f. Clipping the signal: upper and Lower clipping values
g. The first derivative of the signal.
h. None
5. Display the new signal in time domain
