/* 2 Country RBC */
%----------------------------------------------------------------
% 0. Housekeeping (close all graphic windows)
%----------------------------------------------------------------
close all;

%----------------------------------------------------------------
% 1. Defining variables
%----------------------------------------------------------------

var chh chf cfh cff sh sfh ph pf b2 b2h b2f b1h b1f b Ri Ri2 Ri1 tau_f tau g dh df;
varexo sff e_dh e_df e_b e_g hh hf w g_ss t_ss d_ss;
 
parameters phi_b phi_bf phi_s phi_sf rho_g rho_b rho_d psi beta;

%----------------------------------------------------------------
% 2. Calibration   - SET PHI low (<1) and get sensible IRFs but b2<0.
%                        PHI high (>1) and get strange IRF but b2>0
%----------------------------------------------------------------


phi_b   = 2.6;
phi_bf  = 1.5;
phi_s   = 2;
phi_sf = 1.5;
beta    = 0.9975;
rho_g   = 0.6;
rho_b   = 0.6;
rho_d   = 0.6;
psi    = 0.3;
%----------------------------------------------------------------
% 3. Model
%----------------------------------------------------------------

model;    
%Home agent FOCs:
    chh     =chf;                      
    Ri1     =beta*(chh/chh(+1));
    Ri2     =(beta*(chh/chh(+1))*(Ri1(+1)+phi_b*((b2h(+1)-b2h)/b2h^2)*(1+((b2h(+1)-b2h)/b2h))))-phi_b*((b2h-b2h(-1))/b2h(-1)^2);
    ph      =beta*(chh/chh(+1))*(ph(+1)+dh(+1)+phi_s*((sh(+1)-sh)/sh^2)*(1+(sh(+1)-sh)/sh))-phi_s*(sh-sh(-1))/sh(-1)^2;
    chh+chf+ph*sh+Ri2*b2h+Ri1*b1h-w*hh-ph*sh(-1)-dh*sh(-1)-Ri1*b2h(-1)-b1h(-1)-tau+(phi_s/2)*(((sh-sh(-1))^2)/sh(-1))+(phi_b/2)*(((b2h-b2h(-1))^2)/b2h(-1));
%Foreign agent FOCs:
    cfh     =cff;  
    Ri      =beta*cfh/cfh(+1);
    Ri1     =beta*cfh/cfh(+1);
    Ri2     =(beta*(cfh/cfh(+1))*(Ri1(+1)+phi_bf*((b2f(+1)-b2f)/b2f^2)*(1+((b2f(+1)-b2f)/b2f))))-phi_bf*((b2f-b2f(-1))/b2f(-1)^2);
    ph      =beta*(cfh/cfh(+1))*(ph(+1)+dh(+1)+phi_sf*((sfh(+1)-sfh)/sfh^2)*(1+(sfh(+1)-sfh)/sfh))-phi_sf*(sfh-sfh(-1))/sfh(-1)^2;
    pf      =beta*(cfh/cfh(+1))*(pf(+1)+df(+1)+phi_sf*((sff(+1)-sff)/sff^2)*(1+(sff(+1)-sff)/sff))-phi_sf*(sff-sff(-1))/sff(-1)^2;
    cfh+cff+ph*sfh+pf*sff+Ri2*b2f+Ri*b+Ri1*b1f-w*hf-ph*sfh(-1)-dh*sfh(-1)-pf*sff(-1)-df*sff(-1)-Ri1*b2f(-1)-tau_f+(phi_sf/2)*(((sfh-sfh(-1))^2)/sfh(-1))+(phi_sf/2)*(((sff-sff(-1))^2)/sff(-1))+(phi_bf/2)*(((b2f-b2f(-1))^2)/b2f(-1));
%Home Government:
    b1h+b1f =b2(-1);
    b2      =b2h+b2f;
    g       =tau+Ri2*b2-b2(-2);
    tau     =g_ss+t_ss+psi*(Ri1*b2(-1)+b2(-2));
    g       =g_ss*(1-rho_g)+rho_g*g(-1)+e_g;
%Global Central Bank:
    tau_f   =Ri*b-b(-1);
    b       =rho_b*b(-1)+e_b;
%Firms:
    dh      =d_ss*(1-rho_d)+e_dh;
    df      =d_ss*(1-rho_d)+e_df;
%Aggregate:
    sfh+sh  =1;
end;

%----------------------------------------------------------------
% 4. Computation
%----------------------------------------------------------------

initval;
    sff=1;
    e_dh=0;
    e_df=0; 
    e_b=0; 
    e_g=0; 
    hh=1.1; 
    hf=1; 
    w=1;
    g_ss=0;
    t_ss=-2;
    d_ss=5;
    cfh=2;
    cff=2;
    chh=2;
    chf=2;
end;
check;
steady;






