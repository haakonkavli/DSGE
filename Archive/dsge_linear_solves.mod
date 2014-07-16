/* 2 Country RBC */
%----------------------------------------------------------------
% 0. Housekeeping (close all graphic windows)
%----------------------------------------------------------------
close all;

%----------------------------------------------------------------
% 1. Defining variables
%----------------------------------------------------------------

var chh chf cfh cff shh sfh ph pf b R g dh df;
varexo e_sh e_sf e_b sff sh ;
 
parameters beta phi_sh phi_sf tau_c alpha_b  alpha_sh alpha_sf d_ssh d_ssf chhs chfs cfhs cffs A B Af Bf ph_ss pf_ss;

%----------------------------------------------------------------
% 2. Calibration   
%----------------------------------------------------------------

    chhs=0.336;
    chfs=0.3254;
    cfhs=0.3254;
    cffs=0.336;
    d_ssh=1;
    d_ssf=1;
beta       = 0.9975;   
phi_sh     = 1;
phi_sf     = 2;
tau_c      = 0.1;
alpha_b    = 0.8;
alpha_sh   = 0.8;
alpha_sf   = 0.8;
A = (chfs/chhs)+(tau_c*(chfs/chhs)*chfs)-1;
B = (chfs/chhs)+(2*tau_c*(chfs/chhs)*chfs);
ph_ss=(beta-phi_sh*((phi_sf/phi_sh)/(1+phi_sf/phi_sh)))/(1-beta);
pf_ss=beta/(1-beta);
Af=(cfhs/cffs)+(tau_c*(cfhs/cffs)*cfhs)-1;
Bf = (cfhs/cffs)+(2*tau_c*(cfhs/cffs)*cfhs);
%----------------------------------------------------------------
% 3. Model
%----------------------------------------------------------------

model(linear);    
%Home agent FOCs: 
    chh     =  A+B*chf;                  
    ph      =beta*((1+chh-chh(+1)+ph(+1))+(1+chh-chh(+1)+dh(+1))*(1/ph_ss))-1-(phi_sh/ph_ss)*(1+shh);
%Foreign agent FOCs:
    cff     =Af+Bf*cfh;  
    ph      =beta*((1+cff-cff(+1)+ph(+1))+(1+cff-cff(+1)+dh(+1))*(1/ph_ss))-1-(phi_sf/ph_ss)*(1+sfh);
    pf      =beta*((1+cff-cff(+1)+pf(+1))+(1+cff-cff(+1)+df(+1))*(1/pf_ss))-1;
    R       =(cff-cff(+1))-1;
%Foreign Government:
    b       =(1-alpha_b)+alpha_b+alpha_b*b(-1)+e_b-1;
    g    =pf_ss*(1+R+b)-((1+b(-1))/(1-beta))-1;
%Firms:
    sfh+shh  =sh-1;
    dh      =(1-alpha_sh)+alpha_sh+alpha_sh*dh(-1)+e_sh-1;
    df      =(1-alpha_sf)+alpha_sf+alpha_sf*df(-1)+e_sf-1;
%Budget constraints:
    cfh =(1/cfhs)*((1+dh)-chhs*(1+chh)-(phi_sh/2)*(1+2*shh)-(phi_sf/2)*(1+2*sfh)-(tau_c/2)*(1+2*cfh))-1;
    cff =(1/cffs)*((1+df)-chfs*(1+chf)-(tau_c/2)*(1+2*chf))-1;
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
end;
check;
steady;


shocks;
var e_sh; stderr 0.1;
var e_sf; stderr 0.1;
end;

stoch_simul(irf=24);




