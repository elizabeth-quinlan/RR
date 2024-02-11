function x=RR_LCG64(i_max,reverse)
% Pseudo Random Number Generator (PRNG) with an LCG with period m=2^32-5=4294967291
% Note: if this routine hasn't been run yet in this Matlab session, it
% initializes the previous state using the fractional seconds of the clock.
% INPUTS: i_max   (OPTIONAL) number of random numbers to return.  default=1
%         reverse (OPTIONAL) set to true to run backward, omit to run forward
% OUTPUT: x
% TEST:   RR_LCG64(7)
%         RR_LCG64(6,true)
%% Renaissance Robotics codebase, Chapter 2, https://github.com/tbewley/RR
%% Copyright 2024 by Thomas Bewley, distributed under BSD 3-Clause License.

persistent XOLD, if nargin<1, i_max=1; end
m=uint64(4294967291); if nargin<2, a=uint64(1815976680); else, a=uint64(279470273); end
if isempty(XOLD), t=second(datetime), XOLD=uint64(round((t-floor(t))*m)), end
x=mod(a*XOLD,m);
for i=2:i_max, x(i)=mod(a*x(i-1),m); end, XOLD=x(end);
