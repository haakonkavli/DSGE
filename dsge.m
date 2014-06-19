%
% Status : main Dynare file 
%
% Warning : this file is generated automatically by Dynare
%           from model file (.mod)

clear all
tic;
global M_ oo_ options_ ys0_ ex0_ estimation_info
options_ = [];
M_.fname = 'dsge';
%
% Some global variables initialization
%
global_initialization;
diary off;
diary('dsge.log');
M_.exo_names = 'e_sh';
M_.exo_names_tex = 'e\_sh';
M_.exo_names_long = 'e_sh';
M_.exo_names = char(M_.exo_names, 'e_sf');
M_.exo_names_tex = char(M_.exo_names_tex, 'e\_sf');
M_.exo_names_long = char(M_.exo_names_long, 'e_sf');
M_.exo_names = char(M_.exo_names, 'e_b');
M_.exo_names_tex = char(M_.exo_names_tex, 'e\_b');
M_.exo_names_long = char(M_.exo_names_long, 'e_b');
M_.exo_names = char(M_.exo_names, 'd_ssh');
M_.exo_names_tex = char(M_.exo_names_tex, 'd\_ssh');
M_.exo_names_long = char(M_.exo_names_long, 'd_ssh');
M_.exo_names = char(M_.exo_names, 'd_ssf');
M_.exo_names_tex = char(M_.exo_names_tex, 'd\_ssf');
M_.exo_names_long = char(M_.exo_names_long, 'd_ssf');
M_.exo_names = char(M_.exo_names, 'b_ss');
M_.exo_names_tex = char(M_.exo_names_tex, 'b\_ss');
M_.exo_names_long = char(M_.exo_names_long, 'b_ss');
M_.exo_names = char(M_.exo_names, 'sff');
M_.exo_names_tex = char(M_.exo_names_tex, 'sff');
M_.exo_names_long = char(M_.exo_names_long, 'sff');
M_.exo_names = char(M_.exo_names, 'sh');
M_.exo_names_tex = char(M_.exo_names_tex, 'sh');
M_.exo_names_long = char(M_.exo_names_long, 'sh');
M_.endo_names = 'chh';
M_.endo_names_tex = 'chh';
M_.endo_names_long = 'chh';
M_.endo_names = char(M_.endo_names, 'chf');
M_.endo_names_tex = char(M_.endo_names_tex, 'chf');
M_.endo_names_long = char(M_.endo_names_long, 'chf');
M_.endo_names = char(M_.endo_names, 'cfh');
M_.endo_names_tex = char(M_.endo_names_tex, 'cfh');
M_.endo_names_long = char(M_.endo_names_long, 'cfh');
M_.endo_names = char(M_.endo_names, 'cff');
M_.endo_names_tex = char(M_.endo_names_tex, 'cff');
M_.endo_names_long = char(M_.endo_names_long, 'cff');
M_.endo_names = char(M_.endo_names, 'shh');
M_.endo_names_tex = char(M_.endo_names_tex, 'shh');
M_.endo_names_long = char(M_.endo_names_long, 'shh');
M_.endo_names = char(M_.endo_names, 'sfh');
M_.endo_names_tex = char(M_.endo_names_tex, 'sfh');
M_.endo_names_long = char(M_.endo_names_long, 'sfh');
M_.endo_names = char(M_.endo_names, 'ph');
M_.endo_names_tex = char(M_.endo_names_tex, 'ph');
M_.endo_names_long = char(M_.endo_names_long, 'ph');
M_.endo_names = char(M_.endo_names, 'pf');
M_.endo_names_tex = char(M_.endo_names_tex, 'pf');
M_.endo_names_long = char(M_.endo_names_long, 'pf');
M_.endo_names = char(M_.endo_names, 'b');
M_.endo_names_tex = char(M_.endo_names_tex, 'b');
M_.endo_names_long = char(M_.endo_names_long, 'b');
M_.endo_names = char(M_.endo_names, 'R');
M_.endo_names_tex = char(M_.endo_names_tex, 'R');
M_.endo_names_long = char(M_.endo_names_long, 'R');
M_.endo_names = char(M_.endo_names, 'g');
M_.endo_names_tex = char(M_.endo_names_tex, 'g');
M_.endo_names_long = char(M_.endo_names_long, 'g');
M_.endo_names = char(M_.endo_names, 'dh');
M_.endo_names_tex = char(M_.endo_names_tex, 'dh');
M_.endo_names_long = char(M_.endo_names_long, 'dh');
M_.endo_names = char(M_.endo_names, 'df');
M_.endo_names_tex = char(M_.endo_names_tex, 'df');
M_.endo_names_long = char(M_.endo_names_long, 'df');
M_.param_names = 'beta';
M_.param_names_tex = 'beta';
M_.param_names_long = 'beta';
M_.param_names = char(M_.param_names, 'phi_sh');
M_.param_names_tex = char(M_.param_names_tex, 'phi\_sh');
M_.param_names_long = char(M_.param_names_long, 'phi_sh');
M_.param_names = char(M_.param_names, 'phi_sf');
M_.param_names_tex = char(M_.param_names_tex, 'phi\_sf');
M_.param_names_long = char(M_.param_names_long, 'phi_sf');
M_.param_names = char(M_.param_names, 'tau_c');
M_.param_names_tex = char(M_.param_names_tex, 'tau\_c');
M_.param_names_long = char(M_.param_names_long, 'tau_c');
M_.param_names = char(M_.param_names, 'alpha_b');
M_.param_names_tex = char(M_.param_names_tex, 'alpha\_b');
M_.param_names_long = char(M_.param_names_long, 'alpha_b');
M_.param_names = char(M_.param_names, 'alpha_sh');
M_.param_names_tex = char(M_.param_names_tex, 'alpha\_sh');
M_.param_names_long = char(M_.param_names_long, 'alpha_sh');
M_.param_names = char(M_.param_names, 'alpha_sf');
M_.param_names_tex = char(M_.param_names_tex, 'alpha\_sf');
M_.param_names_long = char(M_.param_names_long, 'alpha_sf');
M_.exo_det_nbr = 0;
M_.exo_nbr = 8;
M_.endo_nbr = 13;
M_.param_nbr = 7;
M_.orig_endo_nbr = 13;
M_.aux_vars = [];
M_.Sigma_e = zeros(8, 8);
M_.Correlation_matrix = eye(8, 8);
M_.H = 0;
M_.Correlation_matrix_ME = 1;
options_.block=0;
options_.bytecode=0;
options_.use_dll=0;
erase_compiled_function('dsge_static');
erase_compiled_function('dsge_dynamic');
M_.lead_lag_incidence = [
 0 4 17;
 0 5 0;
 0 6 0;
 0 7 18;
 0 8 0;
 0 9 0;
 0 10 19;
 0 11 20;
 1 12 0;
 0 13 0;
 0 14 0;
 2 15 21;
 3 16 22;]';
M_.nstatic = 6;
M_.nfwrd   = 4;
M_.npred   = 1;
M_.nboth   = 2;
M_.nsfwrd   = 6;
M_.nspred   = 3;
M_.ndynamic   = 7;
M_.equations_tags = {
};
M_.static_and_dynamic_models_differ = 0;
M_.exo_names_orig_ord = [1:8];
M_.maximum_lag = 1;
M_.maximum_lead = 1;
M_.maximum_endo_lag = 1;
M_.maximum_endo_lead = 1;
oo_.steady_state = zeros(13, 1);
M_.maximum_exo_lag = 0;
M_.maximum_exo_lead = 0;
oo_.exo_steady_state = zeros(8, 1);
M_.params = NaN(7, 1);
M_.NNZDerivatives = zeros(3, 1);
M_.NNZDerivatives(1) = 51;
M_.NNZDerivatives(2) = 40;
M_.NNZDerivatives(3) = -1;
close all;
M_.params( 1 ) = 0.9975;
beta = M_.params( 1 );
M_.params( 2 ) = 1.5;
phi_sh = M_.params( 2 );
M_.params( 3 ) = 1.5;
phi_sf = M_.params( 3 );
M_.params( 4 ) = 0.1;
tau_c = M_.params( 4 );
M_.params( 5 ) = 0.2;
alpha_b = M_.params( 5 );
M_.params( 6 ) = 0.2;
alpha_sh = M_.params( 6 );
M_.params( 7 ) = 0.2;
alpha_sf = M_.params( 7 );
%
% INITVAL instructions
%
options_.initval_file = 0;
oo_.exo_steady_state( 7 ) = 1;
oo_.exo_steady_state( 8 ) = 1;
oo_.exo_steady_state( 1 ) = 0;
oo_.exo_steady_state( 2 ) = 0;
oo_.exo_steady_state( 3 ) = 0;
oo_.exo_steady_state( 4 ) = 1;
oo_.exo_steady_state( 5 ) = 1;
oo_.exo_steady_state( 6 ) = 1;
oo_.steady_state( 10 ) = M_.params(1);
oo_.steady_state( 5 ) = M_.params(3)/M_.params(2)/(1+M_.params(3)/M_.params(2));
oo_.steady_state( 6 ) = 1-M_.params(3)/M_.params(2)/(1+M_.params(3)/M_.params(2));
oo_.steady_state( 7 ) = (M_.params(1)*oo_.exo_steady_state(4)-M_.params(2)*M_.params(3)/M_.params(2)/(1+M_.params(3)/M_.params(2)))/(1-M_.params(1));
oo_.steady_state( 8 ) = M_.params(1)*oo_.exo_steady_state(5)/(1-M_.params(1));
oo_.steady_state( 11 ) = oo_.exo_steady_state(6)*(M_.params(1)-1);
oo_.steady_state( 9 ) = oo_.exo_steady_state(6);
oo_.steady_state( 12 ) = oo_.exo_steady_state(4);
oo_.steady_state( 13 ) = oo_.exo_steady_state(5);
oo_.steady_state( 4 ) = 1;
oo_.steady_state( 1 ) = 1;
if M_.exo_nbr > 0;
	oo_.exo_simul = [ones(M_.maximum_lag,1)*oo_.exo_steady_state'];
end;
if M_.exo_det_nbr > 0;
	oo_.exo_det_simul = [ones(M_.maximum_lag,1)*oo_.exo_det_steady_state'];
end;
oo_.dr.eigval = check(M_,options_,oo_);
steady;
save('dsge_results.mat', 'oo_', 'M_', 'options_');
if exist('estim_params_', 'var') == 1
  save('dsge_results.mat', 'estim_params_', '-append');
end
if exist('bayestopt_', 'var') == 1
  save('dsge_results.mat', 'bayestopt_', '-append');
end
if exist('dataset_', 'var') == 1
  save('dsge_results.mat', 'dataset_', '-append');
end
if exist('estimation_info', 'var') == 1
  save('dsge_results.mat', 'estimation_info', '-append');
end


disp(['Total computing time : ' dynsec2hms(toc) ]);
if ~isempty(lastwarn)
  disp('Note: warning(s) encountered in MATLAB/Octave code')
end
diary off
