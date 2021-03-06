/* 2 Country qBC */
%----------------------------------------------------------------
% 0. Housekeeping (close all graphic windows)
%----------------------------------------------------------------
close all;

%----------------------------------------------------------------
% 1. Defining variables
%----------------------------------------------------------------

var c c_f s s_f p b q g d d_f h h_f w A K H I;
varexo e_df e_b e_A;
 
parameters beta rho rho_f phi phi_f phi_I mu alpha_A alpha_b alpha_df xhi gamma gamma_f delta;

%----------------------------------------------------------------
% 2. Calibration   
%----------------------------------------------------------------


beta         = 0.9975;

rho          = 0.9;
rho_f        = 0.85;

xhi          = 1;
gamma        = 0.9;
gamma_f      = 0.9;

phi          = 0.1;
phi_f        = 0.2;
phi_I        = 0.1;
    
mu           = 0.3;
delta        = 0.05;
alpha_A      = 0.8;
alpha_b      = 0.8;
alpha_df     = 0.8;


%----------------------------------------------------------------
% 3. Model
%----------------------------------------------------------------

model;    
%Home agent FOCs: 
    c      =xhi*(h^(-gamma))/w;
    p      =beta*((c/c(+1))^rho) * (p(+1)+d(+1)) - phi*s;
%Foreign agent FOCs:
    c_f    =xhi*(h_f^(-gamma_f))/w;
    p      =beta*((c_f/c_f(+1))^rho_f) * (p(+1)+d(+1)) - phi_f*s_f;
    q      =beta*((c_f/c_f(+1))^rho_f);
%Foreign Government:
    b      =(1-alpha_b)+alpha_b*b(-1)+e_b;
    g      =q*b-b(-1);
%Firms:
    s_f+s   =1;
    d       =A*K(+1)^mu*H^(1-mu)-w*h-I-phi_I/2*I^2;
    d_f     =(1-alpha_df)+alpha_df*d_f(-1)+e_df;
    w       =(1-mu)*A*(K(+1)/H)^mu;
    1+phi_I*I(-1)=beta*(mu*A*(H/K(+1))^(1-mu)+(1-delta)+phi_I*I*(1-delta));
    K(+1)   =I+(1-delta)*K;
    A       =(1-alpha_A)+alpha_A*A(-1)+e_A;
    H       =h+h_f;
%Budget constraints:
    c+p*s+(phi/2)*s^2 =w*h + s(-1)*(p+d);
    c_f+p*s_f+(phi_f/2)*s_f^2 + q*b =w*h_f +  g+s_f(-1)*(p+d)+d_f+b(-1);
end;

%----------------------------------------------------------------
% 4. Computation
%----------------------------------------------------------------

initval;
    e_df=0; 
    e_b=0; 
    s=phi_f/(phi_f+phi);
    s_f=phi/(phi_f+phi);
    p=(1/(1-beta))*(beta-phi_f*phi/(phi_f+phi));
    q=beta;
    b=1;
    g=beta-1;
    d=1;
    d_f=1;
    c=(phi_f/(phi_f+phi))*(1-0.5*phi*phi_f/(phi_f+phi));
    c_f=d_f+(phi/(phi_f+phi))*(1-0.5*phi_f*phi/(phi_f+phi));
    h=0.5;
    h_f=0.5;
    A=1;
    K=1;
    H=1;
    w=1-mu;
end;
check;
steady;


shocks;
var e_A; stderr 0.1;
end;

stoch_simul(irf=24);




