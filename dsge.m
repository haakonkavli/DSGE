%
% Status : main Dynare file 
%
% Warning : this file is generated automatically by Dynare
%           from model file (.mod)

clear all
clear global
tic;
global M_ oo_ options_ ys0_ ex0_
options_ = [];
M_.fname = 'dsge';
%
% Some global variables initialization
%
global_initialization;
diary off;
logname_ = 'dsge.log';
if exist(logname_, 'file')
    delete(logname_)
end
diary(logname_)
M_.exo_names = 'e_s';
M_.exo_names_tex = 'e\_s';
M_.exo_names = char(M_.exo_names, 'e_sf');
M_.exo_names_tex = char(M_.exo_names_tex, 'e\_sf');
M_.exo_names = char(M_.exo_names, 'e_b');
M_.exo_names_tex = char(M_.exo_names_tex, 'e\_b');
M_.endo_names = 'c';
M_.endo_names_tex = 'c';
M_.endo_names = char(M_.endo_names, 'c_f');
M_.endo_names_tex = char(M_.endo_names_tex, 'c\_f');
M_.endo_names = char(M_.endo_names, 's');
M_.endo_names_tex = char(M_.endo_names_tex, 's');
M_.endo_names = char(M_.endo_names, 's_f');
M_.endo_names_tex = char(M_.endo_names_tex, 's\_f');
M_.endo_names = char(M_.endo_names, 'p');
M_.endo_names_tex = char(M_.endo_names_tex, 'p');
M_.endo_names = char(M_.endo_names, 'b');
M_.endo_names_tex = char(M_.endo_names_tex, 'b');
M_.endo_names = char(M_.endo_names, 'R');
M_.endo_names_tex = char(M_.endo_names_tex, 'R');
M_.endo_names = char(M_.endo_names, 'g');
M_.endo_names_tex = char(M_.endo_names_tex, 'g');
M_.endo_names = char(M_.endo_names, 'd');
M_.endo_names_tex = char(M_.endo_names_tex, 'd');
M_.endo_names = char(M_.endo_names, 'd_f');
M_.endo_names_tex = char(M_.endo_names_tex, 'd\_f');
M_.param_names = 'beta';
M_.param_names_tex = 'beta';
M_.param_names = char(M_.param_names, 'rho');
M_.param_names_tex = char(M_.param_names_tex, 'rho');
M_.param_names = char(M_.param_names, 'rho_f');
M_.param_names_tex = char(M_.param_names_tex, 'rho\_f');
M_.param_names = char(M_.param_names, 'phi');
M_.param_names_tex = char(M_.param_names_tex, 'phi');
M_.param_names = char(M_.param_names, 'phi_f');
M_.param_names_tex = char(M_.param_names_tex, 'phi\_f');
M_.param_names = char(M_.param_names, 'alpha_b');
M_.param_names_tex = char(M_.param_names_tex, 'alpha\_b');
M_.param_names = char(M_.param_names, 'alpha_s');
M_.param_names_tex = char(M_.param_names_tex, 'alpha\_s');
M_.param_names = char(M_.param_names, 'alpha_sf');
M_.param_names_tex = char(M_.param_names_tex, 'alpha\_sf');
M_.exo_det_nbr = 0;
M_.exo_nbr = 3;
M_.endo_nbr = 10;
M_.param_nbr = 8;
M_.orig_endo_nbr = 10;
M_.aux_vars = [];
M_.Sigma_e = zeros(3, 3);
M_.H = 0;
options_.block=0;
options_.bytecode=0;
options_.use_dll=0;
erase_compiled_function('dsge_dynamic');
M_.lead_lag_incidence = [
 0 6 16;
 0 7 17;
 1 8 0;
 2 9 0;
 0 10 18;
 3 11 0;
 0 12 0;
 0 13 0;
 4 14 19;
 5 15 0;]';
M_.equations_tags = {
};
M_.exo_names_orig_ord = [1:3];
M_.maximum_lag = 1;
M_.maximum_lead = 1;
M_.maximum_endo_lag = 1;
M_.maximum_endo_lead = 1;
oo_.steady_state = zeros(10, 1);
M_.maximum_exo_lag = 0;
M_.maximum_exo_lead = 0;
oo_.exo_steady_state = zeros(3, 1);
M_.params = NaN(8, 1);
M_.NNZDerivatives = zeros(3, 1);
M_.NNZDerivatives(1) = 45;
M_.NNZDerivatives(2) = 46;
M_.NNZDerivatives(3) = -1;
close all;
M_.params( 1 ) = 0.9975;
beta = M_.params( 1 );
M_.params( 2 ) = 0.9;
rho = M_.params( 2 );
M_.params( 3 ) = 0.85;
rho_f = M_.params( 3 );
M_.params( 4 ) = 0.1;
phi = M_.params( 4 );
M_.params( 5 ) = 0.2;
phi_f = M_.params( 5 );
M_.params( 6 ) = 0.8;
alpha_b = M_.params( 6 );
M_.params( 7 ) = 0.8;
alpha_s = M_.params( 7 );
M_.params( 8 ) = 0.8;
alpha_sf = M_.params( 8 );
%
% INITVAL instructions
%
options_.initval_file = 0;
oo_.exo_steady_state( 1 ) = 0;
oo_.exo_steady_state( 2 ) = 0;
oo_.exo_steady_state( 3 ) = 0;
oo_.steady_state( 3 ) = M_.params(5)/(M_.params(5)+M_.params(4));
oo_.steady_state( 4 ) = M_.params(4)/(M_.params(5)+M_.params(4));
oo_.steady_state( 5 ) = 1/(1-M_.params(1))*(M_.params(1)-M_.params(5)*M_.params(4)/(M_.params(5)+M_.params(4)));
oo_.steady_state( 7 ) = M_.params(1);
oo_.steady_state( 6 ) = 1;
oo_.steady_state( 8 ) = M_.params(1)-1;
oo_.steady_state( 9 ) = 1;
oo_.steady_state( 10 ) = 1;
oo_.steady_state( 1 ) = M_.params(5)/(M_.params(5)+M_.params(4))*(1-M_.params(5)*M_.params(4)*0.5/(M_.params(5)+M_.params(4)));
oo_.steady_state( 2 ) = oo_.steady_state(10)+M_.params(4)/(M_.params(5)+M_.params(4))*(1-M_.params(4)*M_.params(5)*0.5/(M_.params(5)+M_.params(4)));
oo_.endo_simul=[oo_.steady_state*ones(1,M_.maximum_lag)];
if M_.exo_nbr > 0;
	oo_.exo_simul = [ones(M_.maximum_lag,1)*oo_.exo_steady_state'];
end;
if M_.exo_det_nbr > 0;
	oo_.exo_det_simul = [ones(M_.maximum_lag,1)*oo_.exo_det_steady_state'];
end;
check;
steady;
%
% SHOCKS instructions
%
make_ex_;
M_.exo_det_length = 0;
M_.Sigma_e(1, 1) = (0.1)^2;
M_.Sigma_e(2, 2) = (0.1)^2;
M_.sigma_e_is_diagonal = 1;
options_.irf = 24;
var_list_=[];
info = stoch_simul(var_list_);
save('dsge_results.mat', 'oo_', 'M_', 'options_');
diary off

disp(['Total computing time : ' dynsec2hms(toc) ]);
