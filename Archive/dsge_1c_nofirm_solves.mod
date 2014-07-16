/* 2 Country RBC */
%----------------------------------------------------------------
% 0. Housekeeping (close all graphic windows)
%----------------------------------------------------------------
close all;

%----------------------------------------------------------------
% 1. Defining variables
%----------------------------------------------------------------

var c c_f s s_f p b R g d d_f;
varexo e_s e_sf e_b;
 
parameters beta rho rho_f phi phi_f alpha_b  alpha_s alpha_sf;

%----------------------------------------------------------------
% 2. Calibration   
%----------------------------------------------------------------


beta       = 0.9975;

rho      = 0.9;
rho_f     = 0.85;

phi     = 0.1;
phi_f     = 0.2;

alpha_b    = 0.8;
alpha_s   = 0.8;
alpha_sf   = 0.8;


%----------------------------------------------------------------
% 3. Model
%----------------------------------------------------------------

model(linear);    
%Home agent FOCs: 
    p      =beta*((c/c(+1))^rho) * (p(+1)+d(+1)) - phi*s;
%Foreign agent FOCs:
    p      =beta*((c_f/c_f(+1))^rho_f) * (p(+1)+d(+1)) - phi_f*s_f;
    R      =beta*((c_f/c_f(+1))^rho_f);
%Foreign Government:
    b      =(1-alpha_b)+alpha_b*b(-1)+e_b;
    g      =R*b-b(-1);
%Firms:
    s_f+s   =1;
    d       =(1-alpha_s)+alpha_s*d(-1)+e_s;
    d_f     =(1-alpha_sf)+alpha_sf*d_f(-1)+e_sf;
%Budget constraints:
    c+p*s+(phi/2)*s^2 = s(-1)*(p+d);
    c_f+p*s_f+(phi_f/2)*s_f^2 + R*b = g+s_f(-1)*(p+d)+d_f+b(-1);
end;

%----------------------------------------------------------------
% 4. Computation
%----------------------------------------------------------------

initval;
    e_s=0;
    e_sf=0; 
    e_b=0; 
    s=phi_f/(phi_f+phi);
    s_f=phi/(phi_f+phi);
    p=(1/(1-beta))*(beta-phi_f*phi/(phi_f+phi));
    R=beta;
    b=1;
    g=beta-1;
    d=1;
    d_f=1;
    c=(phi_f/(phi_f+phi))*(1-0.5*phi*phi_f/(phi_f+phi));
    c_f=d_f+(phi/(phi_f+phi))*(1-0.5*phi_f*phi/(phi_f+phi));
end;
check;
steady;


shocks;
var e_s; stderr 0.1;
var e_sf; stderr 0.1;
end;

stoch_simul(irf=24);




