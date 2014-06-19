/* 2 Country RBC */
%----------------------------------------------------------------
% 0. Housekeeping (close all graphic windows)
%----------------------------------------------------------------
close all;

%----------------------------------------------------------------
% 1. Defining variables
%----------------------------------------------------------------

var chh chf cfh cff shh sfh ph pf b1hh b1fh b1h b2h b2hh b2fh b1ff R1h R2h R1f gf gh dh df;
varexo sh e_dh e_df e_b2h e_b1f d_ssh d_ssf sff;
 
parameters beta phi_b phi_bff phi_bfh phi_s phi_sfg phi_sfh tau_c alpha_bh alpha_bf alpha_dh alpha_df;

%----------------------------------------------------------------
% 2. Calibration   
%----------------------------------------------------------------

beta       = 0.9975;   
phi_b      = 1;
phi_bfh    = 1;
phi_bff    = 1;
phi_s      = 1;
phi_sfh    = 1;
phi_sff    = 1;
tau_c      = 0.1;
alpha_bh   = 0.2;
alpha_bf   = 0.2;
alpha_dh   = 0.2;
alpha_df   = 0.2;

%----------------------------------------------------------------
% 3. Model
%----------------------------------------------------------------

model;    
%Home agent FOCs: %FINISHED
    chh     =chf*(1+tau_c);                      
    R1h     =beta*(chh/chh(+1))*(1+phi_b*(b1hh(+1)-b1hh))-phi_b*(b1hh-b1hh(-1));
    R2h     =beta*(chh/chh(+1))*(R1h(+1)+phi_b*(b2hh(+1)-b2hh))-phi_b*(b2hh-b2hh(-1));
    ph      =beta*(chh/chh(+1))*(ph(+1)+dh(+1)+phi_s*(shh(+1)-shh))-phi_s*(shh-shh(-1));
%Foreign agent FOCs:
    cff     =cfh*(1+tau_c);  
    R1f     =beta*cff/cff(+1);
    R1h     =R1f*(1+phi_bfh*(b1fh(+1)-b1fh))-phi_bfh*(b1fh-b1fh(-1));
    R2h     =R1f*(R1h(+1)+phi_bfh*(b2fh(+1)-b2fh))-phi_bfh*(b2fh-b2fh(-1));
    ph      =R1f*(ph(+1)+dh(+1)+phi_sfh*(sfh(+1)-sfh))-phi_sfh*(sfh-sfh(-1));
    pf      =R1f*(pf(+1)+df(+1));
%Home Government:
    b1h     =b1hh+b1fh;
    b2h     =b2hh+b2fh;
    b1h     =b2h(-1);
    b2h     =(1-alpha_bh)+alpha_bh*b2h(-1)+e_b2h;
    gh      =b2h*R2h-b2h(-2);
%Foreign Government:
    b1ff    =(1-alpha_bf)+alpha_bf*b1ff(-1)+e_b1f;
    gf      =R1f*b1ff-b1ff(-1);
%Firms:
    sfh+shh  =sh;
    dh      =d_ssh*(1-alpha_dh)+alpha_dh*dh(-1)+e_dh;
    df      =d_ssf*(1-alpha_df)+alpha_df*df(-1)+e_df;
%Budget constraints:
    chh+cfh+gh=dh-(phi_b-2)*(b2hh-b2hh(-1))^2-(phi_bfh-2)*(b2fh-b2fh(-1))^2-(phi_s/2)*(shh-shh(-1))^2-(phi_sfh/2)*(sfh-sfh(-1))^2-tau_c*cfh;
    chf+cff+gf=df-tau_c*chf;
end;

%----------------------------------------------------------------
% 4. Computation
%----------------------------------------------------------------

initval;
    sff=1;
    sh=1;
    e_dh=0;
    e_df=0; 
    e_b1f=0; 
    e_b2h=0;
    d_ssh=1;
    d_ssf=1;

    cff=1;
    cfh=1/(1+tau_c);
    chh=1;
    cfh=1/(1+tau_c);

    R1h=beta;
    R2h=beta^2;
    ph=dh/(1-beta);
    pf=df/(1-beta);
    R1f=beta;
end;
check;
steady;






