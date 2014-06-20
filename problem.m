function F=problem(x)
phi_sh     = 1;
phi_sf     = 2;
shh=(phi_sf/phi_sh)/(1+phi_sf/phi_sh)
sfh=1-(phi_sf/phi_sh)/(1+phi_sf/phi_sh)
tau_c      = 0.1;
A=(phi_sh/2)*shh^2+(phi_sf/2)*sfh^2;
F=[x(2)-x(1)+tau_c*(x(2))^2;
    1-x(4)-x(2)-(tau_c/2)*(x(2))^2-A;
    1-x(1)-x(3)-(tau_c/2)*(x(3))^2-A;
    x(3)-x(4)+tau_c*(x(3))^2];
