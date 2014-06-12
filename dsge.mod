/* 2 Country RBC */
%----------------------------------------------------------------
% 0. Housekeeping (close all graphic windows)
%----------------------------------------------------------------
close all;

%----------------------------------------------------------------
% 1. Defining variables
%----------------------------------------------------------------

var chh chf cfh cff shh sfh ph pf b1hh b1fh b2 b2hh b2fh b1ff R1h R2h R1f gf gh dh df;
varexo sh sff e_dh e_df e_b2 e_b1 d_ssh d_ssf;
 
parameters beta phi_b phi_bff phi_bfh phi_s phi_sfg phi_sfh tau_c alpha_bh alpha_bf alpha_dh alpga_df;

%----------------------------------------------------------------
% 2. Calibration   
%----------------------------------------------------------------

beta       = 0.9975;   
phi_b      = 1.2;
phi_bfh    = 1.5;
phi_bff    = 1.0;
phi_s      = 1.2;
phi_sfh    = 1.5;
phi_sff    = 1.0;
tau_c      = 0.01;
beta       = 0.9975;
alpha_bh   = 0.6;
alpha_bf   = 0.6;
alpha_dh   = 0.6;
alpga_df   = 0.6;

%----------------------------------------------------------------
% 3. Model
%----------------------------------------------------------------

model;    
%Home agent FOCs: %FINISHED
    chh     =chf*(1+tau_c);                      
    R1h     =(beta*(chh/chh(+1))*(1+phi_b*(b1hh(+1)-b1hh))-phi_b*(b1hh-b1hh(-1));
    R2h     =(beta*(chh/chh(+1))*(R1h(+1)+phi_b*(b2hh(+1)-b2hh))-phi_b*(b2hh-b2hh(-1));
    ph      =beta*(chh/chh(+1))*(ph(+1)+dh(+1)+phi_s*(shh(+1)-shh))-phi_s*(shh-shh(-1));
%Foreign agent FOCs:
    cff     =cfh*(1+tau_c);  
    R1f     =beta*cff/cff(+1);
    R1h     =
    R2h     =Rf*Rh(+1)-phi_bf*(b2fh-b2fh(-1));
    ph      =R1f*(ph(+1)+dh(+1))-phi_sfh*(sfh-sfh(-1));
    pf      =R1f*(pf(+1)+df(+1))-phi_sff*(sff-sff(-1));
%Home Government:
    b2      =b2hh+b2fh;
    b2      =(1-alpha_bh)+alpha_bh*b2(-1)+e_b2;
    g       =b2*R2h-b2(-1)*R1h;
%Foreign Government:
    gf      =R1f*b1ff-b1ff(-1);
    b1ff    =(1-alpha_bf)+alpha_bf*b1ff(-1)+e_b1;
%Firms:
    sfh+shh  =sh;
    dh      =d_ssh*(1-alpha_dh)+alpha_dh*dh(-1)+e_dh;
    df      =d_ssf*(1-alpha_df)+alpha_df*df(-1)+e_df;
%Budget constraints:
    chh+cfh+gh=dh-(phi_b-2)*(b2hh-b2hh(-1))^2-(phi_bfh-2)*(b2fh-b2fh(-1))^2-(phi_s/2)*(shh-shh(-1))^2-(phi_sfh/2)*(sfh-sfh(-1))^2-tau_c*cfh;
    chf+cff+gf=df-(phi_sff)*(sff-sff(-1))^2;
end;

%----------------------------------------------------------------
% 4. Computation
%----------------------------------------------------------------

initval;
    sh=1;
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






