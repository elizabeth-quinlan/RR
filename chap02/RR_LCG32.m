function x=RR_LCG32(i_max,reverse)
% Pseudo Random Number Generator (PRNG) with an LCG with period m=65521.
% Note: if this routine hasn't been run yet in this Matlab session, it
% initializes the previous state using the fractional seconds of the clock.
% INPUTS: i_max   (OPTIONAL) number of random numbers to return.  default=1
%         reverse (OPTIONAL) set to true to run backward, omit to run forward
% OUTPUT: x
% TESTs:  RR_LCG32(7)
%         RR_LCG32(6,true)
%% Renaissance Robotics codebase, Chapter 2, https://github.com/tbewley/RR
%% Copyright 2024 by Thomas Bewley, distributed under BSD 3-Clause License.

persistent XOLD, if nargin<1, i_max=1; end
m=65521; if nargin<2, a=32236; else, a=17364; end
if isempty(XOLD), t=second(datetime), XOLD=round((t-floor(t))*m), end
x=mod(a*XOLD,m);
for i=2:i_max, x(i)=mod(a*x(i-1),m); end, XOLD=x(end);
