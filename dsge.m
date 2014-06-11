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
M_.exo_names = 'sff';
M_.exo_names_tex = 'sff';
M_.exo_names_long = 'sff';
M_.exo_names = char(M_.exo_names, 'e_dh');
M_.exo_names_tex = char(M_.exo_names_tex, 'e\_dh');
M_.exo_names_long = char(M_.exo_names_long, 'e_dh');
M_.exo_names = char(M_.exo_names, 'e_df');
M_.exo_names_tex = char(M_.exo_names_tex, 'e\_df');
M_.exo_names_long = char(M_.exo_names_long, 'e_df');
M_.exo_names = char(M_.exo_names, 'e_b');
M_.exo_names_tex = char(M_.exo_names_tex, 'e\_b');
M_.exo_names_long = char(M_.exo_names_long, 'e_b');
M_.exo_names = char(M_.exo_names, 'e_g');
M_.exo_names_tex = char(M_.exo_names_tex, 'e\_g');
M_.exo_names_long = char(M_.exo_names_long, 'e_g');
M_.exo_names = char(M_.exo_names, 'hh');
M_.exo_names_tex = char(M_.exo_names_tex, 'hh');
M_.exo_names_long = char(M_.exo_names_long, 'hh');
M_.exo_names = char(M_.exo_names, 'hf');
M_.exo_names_tex = char(M_.exo_names_tex, 'hf');
M_.exo_names_long = char(M_.exo_names_long, 'hf');
M_.exo_names = char(M_.exo_names, 'w');
M_.exo_names_tex = char(M_.exo_names_tex, 'w');
M_.exo_names_long = char(M_.exo_names_long, 'w');
M_.exo_names = char(M_.exo_names, 'g_ss');
M_.exo_names_tex = char(M_.exo_names_tex, 'g\_ss');
M_.exo_names_long = char(M_.exo_names_long, 'g_ss');
M_.exo_names = char(M_.exo_names, 't_ss');
M_.exo_names_tex = char(M_.exo_names_tex, 't\_ss');
M_.exo_names_long = char(M_.exo_names_long, 't_ss');
M_.exo_names = char(M_.exo_names, 'd_ss');
M_.exo_names_tex = char(M_.exo_names_tex, 'd\_ss');
M_.exo_names_long = char(M_.exo_names_long, 'd_ss');
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
M_.endo_names = char(M_.endo_names, 'sh');
M_.endo_names_tex = char(M_.endo_names_tex, 'sh');
M_.endo_names_long = char(M_.endo_names_long, 'sh');
M_.endo_names = char(M_.endo_names, 'sfh');
M_.endo_names_tex = char(M_.endo_names_tex, 'sfh');
M_.endo_names_long = char(M_.endo_names_long, 'sfh');
M_.endo_names = char(M_.endo_names, 'ph');
M_.endo_names_tex = char(M_.endo_names_tex, 'ph');
M_.endo_names_long = char(M_.endo_names_long, 'ph');
M_.endo_names = char(M_.endo_names, 'pf');
M_.endo_names_tex = char(M_.endo_names_tex, 'pf');
M_.endo_names_long = char(M_.endo_names_long, 'pf');
M_.endo_names = char(M_.endo_names, 'b2');
M_.endo_names_tex = char(M_.endo_names_tex, 'b2');
M_.endo_names_long = char(M_.endo_names_long, 'b2');
M_.endo_names = char(M_.endo_names, 'b2h');
M_.endo_names_tex = char(M_.endo_names_tex, 'b2h');
M_.endo_names_long = char(M_.endo_names_long, 'b2h');
M_.endo_names = char(M_.endo_names, 'b2f');
M_.endo_names_tex = char(M_.endo_names_tex, 'b2f');
M_.endo_names_long = char(M_.endo_names_long, 'b2f');
M_.endo_names = char(M_.endo_names, 'b1h');
M_.endo_names_tex = char(M_.endo_names_tex, 'b1h');
M_.endo_names_long = char(M_.endo_names_long, 'b1h');
M_.endo_names = char(M_.endo_names, 'b1f');
M_.endo_names_tex = char(M_.endo_names_tex, 'b1f');
M_.endo_names_long = char(M_.endo_names_long, 'b1f');
M_.endo_names = char(M_.endo_names, 'b');
M_.endo_names_tex = char(M_.endo_names_tex, 'b');
M_.endo_names_long = char(M_.endo_names_long, 'b');
M_.endo_names = char(M_.endo_names, 'Ri');
M_.endo_names_tex = char(M_.endo_names_tex, 'Ri');
M_.endo_names_long = char(M_.endo_names_long, 'Ri');
M_.endo_names = char(M_.endo_names, 'Ri2');
M_.endo_names_tex = char(M_.endo_names_tex, 'Ri2');
M_.endo_names_long = char(M_.endo_names_long, 'Ri2');
M_.endo_names = char(M_.endo_names, 'Ri1');
M_.endo_names_tex = char(M_.endo_names_tex, 'Ri1');
M_.endo_names_long = char(M_.endo_names_long, 'Ri1');
M_.endo_names = char(M_.endo_names, 'tau_f');
M_.endo_names_tex = char(M_.endo_names_tex, 'tau\_f');
M_.endo_names_long = char(M_.endo_names_long, 'tau_f');
M_.endo_names = char(M_.endo_names, 'tau');
M_.endo_names_tex = char(M_.endo_names_tex, 'tau');
M_.endo_names_long = char(M_.endo_names_long, 'tau');
M_.endo_names = char(M_.endo_names, 'g');
M_.endo_names_tex = char(M_.endo_names_tex, 'g');
M_.endo_names_long = char(M_.endo_names_long, 'g');
M_.endo_names = char(M_.endo_names, 'dh');
M_.endo_names_tex = char(M_.endo_names_tex, 'dh');
M_.endo_names_long = char(M_.endo_names_long, 'dh');
M_.endo_names = char(M_.endo_names, 'df');
M_.endo_names_tex = char(M_.endo_names_tex, 'df');
M_.endo_names_long = char(M_.endo_names_long, 'df');
M_.endo_names = char(M_.endo_names, 'AUX_ENDO_LAG_8_1');
M_.endo_names_tex = char(M_.endo_names_tex, 'AUX\_ENDO\_LAG\_8\_1');
M_.endo_names_long = char(M_.endo_names_long, 'AUX_ENDO_LAG_8_1');
M_.param_names = 'phi_b';
M_.param_names_tex = 'phi\_b';
M_.param_names_long = 'phi_b';
M_.param_names = char(M_.param_names, 'phi_bf');
M_.param_names_tex = char(M_.param_names_tex, 'phi\_bf');
M_.param_names_long = char(M_.param_names_long, 'phi_bf');
M_.param_names = char(M_.param_names, 'phi_s');
M_.param_names_tex = char(M_.param_names_tex, 'phi\_s');
M_.param_names_long = char(M_.param_names_long, 'phi_s');
M_.param_names = char(M_.param_names, 'phi_sf');
M_.param_names_tex = char(M_.param_names_tex, 'phi\_sf');
M_.param_names_long = char(M_.param_names_long, 'phi_sf');
M_.param_names = char(M_.param_names, 'rho_g');
M_.param_names_tex = char(M_.param_names_tex, 'rho\_g');
M_.param_names_long = char(M_.param_names_long, 'rho_g');
M_.param_names = char(M_.param_names, 'rho_b');
M_.param_names_tex = char(M_.param_names_tex, 'rho\_b');
M_.param_names_long = char(M_.param_names_long, 'rho_b');
M_.param_names = char(M_.param_names, 'rho_d');
M_.param_names_tex = char(M_.param_names_tex, 'rho\_d');
M_.param_names_long = char(M_.param_names_long, 'rho_d');
M_.param_names = char(M_.param_names, 'psi');
M_.param_names_tex = char(M_.param_names_tex, 'psi');
M_.param_names_long = char(M_.param_names_long, 'psi');
M_.param_names = char(M_.param_names, 'beta');
M_.param_names_tex = char(M_.param_names_tex, 'beta');
M_.param_names_long = char(M_.param_names_long, 'beta');
M_.exo_det_nbr = 0;
M_.exo_nbr = 11;
M_.endo_nbr = 23;
M_.param_nbr = 9;
M_.orig_endo_nbr = 22;
M_.aux_vars(1).endo_index = 23;
M_.aux_vars(1).type = 1;
M_.aux_vars(1).orig_index = 9;
M_.aux_vars(1).orig_lead_lag = -1;
M_.Sigma_e = zeros(11, 11);
M_.Correlation_matrix = eye(11, 11);
M_.H = 0;
M_.Correlation_matrix_ME = 1;
options_.block=0;
options_.bytecode=0;
options_.use_dll=0;
erase_compiled_function('dsge_static');
erase_compiled_function('dsge_dynamic');
M_.lead_lag_incidence = [
 0 10 33;
 0 11 0;
 0 12 34;
 0 13 0;
 1 14 35;
 2 15 36;
 0 16 37;
 0 17 38;
 3 18 0;
 4 19 39;
 5 20 40;
 6 21 0;
 0 22 0;
 7 23 0;
 0 24 0;
 0 25 0;
 0 26 41;
 0 27 0;
 0 28 0;
 8 29 0;
 0 30 42;
 0 31 43;
 9 32 0;]';
M_.nstatic = 7;
M_.nfwrd   = 7;
M_.npred   = 5;
M_.nboth   = 4;
M_.nsfwrd   = 11;
M_.nspred   = 9;
M_.ndynamic   = 16;
M_.equations_tags = {
};
M_.static_and_dynamic_models_differ = 0;
M_.exo_names_orig_ord = [1:11];
M_.maximum_lag = 1;
M_.maximum_lead = 1;
M_.maximum_endo_lag = 1;
M_.maximum_endo_lead = 1;
oo_.steady_state = zeros(23, 1);
M_.maximum_exo_lag = 1;
M_.maximum_exo_lead = 1;
oo_.exo_steady_state = zeros(11, 1);
M_.params = NaN(9, 1);
M_.NNZDerivatives = zeros(3, 1);
M_.NNZDerivatives(1) = 124;
M_.NNZDerivatives(2) = 193;
M_.NNZDerivatives(3) = -1;
close all;
M_.params( 1 ) = 2.6;
phi_b = M_.params( 1 );
M_.params( 2 ) = 1.5;
phi_bf = M_.params( 2 );
M_.params( 3 ) = 2;
phi_s = M_.params( 3 );
M_.params( 4 ) = 1.5;
phi_sf = M_.params( 4 );
M_.params( 9 ) = 0.9975;
beta = M_.params( 9 );
M_.params( 5 ) = 0.6;
rho_g = M_.params( 5 );
M_.params( 6 ) = 0.6;
rho_b = M_.params( 6 );
M_.params( 7 ) = 0.6;
rho_d = M_.params( 7 );
M_.params( 8 ) = 0.3;
psi = M_.params( 8 );
%
% INITVAL instructions
%
options_.initval_file = 0;
oo_.exo_steady_state( 1 ) = 1;
oo_.exo_steady_state( 2 ) = 0;
oo_.exo_steady_state( 3 ) = 0;
oo_.exo_steady_state( 4 ) = 0;
oo_.exo_steady_state( 5 ) = 0;
oo_.exo_steady_state( 6 ) = 1.1;
oo_.exo_steady_state( 7 ) = 1;
oo_.exo_steady_state( 8 ) = 1;
oo_.exo_steady_state( 9 ) = 0;
oo_.exo_steady_state( 10 ) = (-2);
oo_.exo_steady_state( 11 ) = 5;
oo_.steady_state( 3 ) = 2;
oo_.steady_state( 4 ) = 2;
oo_.steady_state( 1 ) = 2;
oo_.steady_state( 2 ) = 2;
oo_.steady_state(23)=oo_.steady_state(9);
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
