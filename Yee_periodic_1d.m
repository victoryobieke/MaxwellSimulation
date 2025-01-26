%=============================================================
 % Code: Electromagnetic Pulse Propagation in a Free Space
    %% Author: Vrushali Bokil 
%=============================================================


tic


% =========Discretization parameters=======

% time interval is [0,T]
T = 20.0*pi; 
% Spatial interval is [0, 2.0*pi]
X0 = 0.0; 
X1 = 2.0*pi;
cfl = 1; 
% cfl = 0.5


M = [8 16 32 64 128 256 512];
Err = 0*M;
for l = 1:length(M)
  h = (X1-X0)/M(l);
  M0h = X0:h:X1; % primary grid for electric field
  Mhalfh = X0+0.5*h:h:X1-0.5*h; % staggered (dual) grid-magnetic field 
                                               
  deltat = cfl*h; 
  Nsteps = floor(T/deltat);
  Ldeltat = T-Nsteps*deltat;

%==========Initial Conditions=============

 % E = sin(M0h);
 E = sin(M0h) + (10^(-9)) * cos((M(l)/2) * M0h);
 H = sin(Mhalfh+0.5*deltat);


%========plot Initial Profile===============
figure(1)
subplot(2,1,1)
plot(M0h,E,'r')
xlabel('X')
ylabel('E_0')
subplot(2,1,2)
plot(Mhalfh,H,'g')
xlabel('Xhalf')
ylabel('H_0.5')


% Define Error to be zero initially 
AbsError = 0.0;

% To test accuracy we can use different norms. The energy norm is defined as
%         EnergyNorm(t) = int_X0^X1 (|E(t,x)|^2 +|H(t,x)|^2) dx; 
% the energy norm is the spatial integral of the sum of squares of E and
% H. This is a function of time t. We will use a discrete version of this
% norm. 

% Main Body of Code Update the Maxwell Curl Equations

for Timestep = 1:Nsteps
  
   % Update E
   E(2:end-1)=E(2:end-1)+(deltat/(h))*(H(2:end)-H(1:end-1)); 
    
   %Periodic BC
   % Update E
   E(1)= E(1)+(deltat/h)*(H(1)-H(end));
   E(end)=E(1);

   % Update H
   H(1:end)=H(1:end)+(deltat/(h))*(E(2:end)-E(1:end-1));

end
 %Exact Solutions
  Exact = sin(M0h+Nsteps*deltat);
  Hxact = sin(Mhalfh+(Nsteps+0.5)*deltat);
  
  %compute error 
  Err(l) = sqrt(h)*(norm(E-Exact,2))

 % figure(2)
 % subplot(2,1,1)  
 % plot(M0h,E,'b',M0h,Exact,'r--')
 % xlabel('X')
 % ylabel('E or H')
 % subplot(2,1,2)
 % plot(Mhalfh,H,'k',Mhalfh,Hxact,'g--')
   % 
   % figure;
   %  plot(log2(M), log2(Err), '-o', 'LineWidth', 2);
   %  hold on;
   %  % %legend('Numerical Error', 'Reference Line');
   %  xlabel('M)');
   %  ylabel('Error');
   %  title('Error Convergence of Yee Scheme with perturbation');
   %  % grid on;
end
%compute ratios of errors
Ratios = Err(1:6)./Err(2:7)
%compute rate of convergence
Rate = log2(Ratios)

toc

