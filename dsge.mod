/* 2 Country RBC */
%----------------------------------------------------------------
% 0. Housekeeping (close all graphic windows)
%----------------------------------------------------------------
close all;

%----------------------------------------------------------------
% 1. Defining variables
%----------------------------------------------------------------

var chh chf cfh cff shh sfh ph pf b R g dh df;
varexo e_sh e_sf e_b d_ssh d_ssf b_ss sff sh ;
 
parameters beta phi_sh phi_sf tau_c alpha_b  alpha_sh alpha_sf;

%----------------------------------------------------------------
% 2. Calibration   
%----------------------------------------------------------------

beta       = 0.9975;   
phi_sh     = 1.5;
phi_sf     = 1.5;
tau_c      = 0.1;
alpha_b    = 0.2;
alpha_sh   = 0.2;
alpha_sf   = 0.2;

%----------------------------------------------------------------
% 3. Model
%----------------------------------------------------------------

model;    
%Home agent FOCs: %FINISHED
    chh     =chf*(1+tau_c);                      
    ph      =beta*(chh/chh(+1))*(ph(+1)+dh(+1))-phi_sh*shh;
%Foreign agent FOCs:
    cff     =cfh*(1+tau_c);  
    ph      =beta*(cff/cff(+1))*(ph(+1)+dh(+1))-phi_sf*sfh;
    pf      =beta*(cff/cff(+1))*(pf(+1)+df(+1));
    R       =beta*cff/cff(+1);
%Government:
    b       =b_ss*(1-alpha_b)+alpha_b*b(-1)+e_b;
    g       =R*b-b(-1);
%Firms:
    sfh+shh  =sh;
    dh      =d_ssh*(1-alpha_sh)+alpha_sh*dh(-1)+e_sh;
    df      =d_ssf*(1-alpha_sf)+alpha_sf*df(-1)+e_sf;
%Budget constraints:
    chh+cfh =dh-(phi_sf/2)*(shh)^2-(phi_sf/2)*(sfh)^2-tau_c*cfh;
    chf+cff =df-tau_c*chf;
end;

%----------------------------------------------------------------
% 4. Computation
%----------------------------------------------------------------

initval;
    sff=1;
    sh=1;
    e_sh=0;
    e_sf=0; 
    e_b=0; 
    d_ssh=1;
    d_ssf=1;
    b_ss=1;
    R=beta;
    shh=(phi_sf/phi_sh)/(1+phi_sf/phi_sh);
    sfh=1-(phi_sf/phi_sh)/(1+phi_sf/phi_sh);
    ph=(beta*d_ssh-phi_sh*(phi_sf/phi_sh)/(1+phi_sf/phi_sh))/(1-beta);
    pf=d_ssf*beta/(1-beta);
    g=b_ss*(beta-1);
    b=b_ss;
    dh=d_ssh;
    df=d_ssf;
    cff=1;
    chh=1;
    
end;
check;
steady;






