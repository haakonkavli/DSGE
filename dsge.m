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
M_.exo_names = 'sh';
M_.exo_names_tex = 'sh';
M_.exo_names_long = 'sh';
M_.exo_names = char(M_.exo_names, 'sff');
M_.exo_names_tex = char(M_.exo_names_tex, 'sff');
M_.exo_names_long = char(M_.exo_names_long, 'sff');
M_.exo_names = char(M_.exo_names, 'e_dh');
M_.exo_names_tex = char(M_.exo_names_tex, 'e\_dh');
M_.exo_names_long = char(M_.exo_names_long, 'e_dh');
M_.exo_names = char(M_.exo_names, 'e_df');
M_.exo_names_tex = char(M_.exo_names_tex, 'e\_df');
M_.exo_names_long = char(M_.exo_names_long, 'e_df');
M_.exo_names = char(M_.exo_names, 'e_b2h');
M_.exo_names_tex = char(M_.exo_names_tex, 'e\_b2h');
M_.exo_names_long = char(M_.exo_names_long, 'e_b2h');
M_.exo_names = char(M_.exo_names, 'e_b1f');
M_.exo_names_tex = char(M_.exo_names_tex, 'e\_b1f');
M_.exo_names_long = char(M_.exo_names_long, 'e_b1f');
M_.exo_names = char(M_.exo_names, 'd_ssh');
M_.exo_names_tex = char(M_.exo_names_tex, 'd\_ssh');
M_.exo_names_long = char(M_.exo_names_long, 'd_ssh');
M_.exo_names = char(M_.exo_names, 'd_ssf');
M_.exo_names_tex = char(M_.exo_names_tex, 'd\_ssf');
M_.exo_names_long = char(M_.exo_names_long, 'd_ssf');
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
M_.endo_names = char(M_.endo_names, 'b1hh');
M_.endo_names_tex = char(M_.endo_names_tex, 'b1hh');
M_.endo_names_long = char(M_.endo_names_long, 'b1hh');
M_.endo_names = char(M_.endo_names, 'b1fh');
M_.endo_names_tex = char(M_.endo_names_tex, 'b1fh');
M_.endo_names_long = char(M_.endo_names_long, 'b1fh');
M_.endo_names = char(M_.endo_names, 'b1h');
M_.endo_names_tex = char(M_.endo_names_tex, 'b1h');
M_.endo_names_long = char(M_.endo_names_long, 'b1h');
M_.endo_names = char(M_.endo_names, 'b2h');
M_.endo_names_tex = char(M_.endo_names_tex, 'b2h');
M_.endo_names_long = char(M_.endo_names_long, 'b2h');
M_.endo_names = char(M_.endo_names, 'b2hh');
M_.endo_names_tex = char(M_.endo_names_tex, 'b2hh');
M_.endo_names_long = char(M_.endo_names_long, 'b2hh');
M_.endo_names = char(M_.endo_names, 'b2fh');
M_.endo_names_tex = char(M_.endo_names_tex, 'b2fh');
M_.endo_names_long = char(M_.endo_names_long, 'b2fh');
M_.endo_names = char(M_.endo_names, 'b1ff');
M_.endo_names_tex = char(M_.endo_names_tex, 'b1ff');
M_.endo_names_long = char(M_.endo_names_long, 'b1ff');
M_.endo_names = char(M_.endo_names, 'R1h');
M_.endo_names_tex = char(M_.endo_names_tex, 'R1h');
M_.endo_names_long = char(M_.endo_names_long, 'R1h');
M_.endo_names = char(M_.endo_names, 'R2h');
M_.endo_names_tex = char(M_.endo_names_tex, 'R2h');
M_.endo_names_long = char(M_.endo_names_long, 'R2h');
M_.endo_names = char(M_.endo_names, 'R1f');
M_.endo_names_tex = char(M_.endo_names_tex, 'R1f');
M_.endo_names_long = char(M_.endo_names_long, 'R1f');
M_.endo_names = char(M_.endo_names, 'gf');
M_.endo_names_tex = char(M_.endo_names_tex, 'gf');
M_.endo_names_long = char(M_.endo_names_long, 'gf');
M_.endo_names = char(M_.endo_names, 'gh');
M_.endo_names_tex = char(M_.endo_names_tex, 'gh');
M_.endo_names_long = char(M_.endo_names_long, 'gh');
M_.endo_names = char(M_.endo_names, 'dh');
M_.endo_names_tex = char(M_.endo_names_tex, 'dh');
M_.endo_names_long = char(M_.endo_names_long, 'dh');
M_.endo_names = char(M_.endo_names, 'df');
M_.endo_names_tex = char(M_.endo_names_tex, 'df');
M_.endo_names_long = char(M_.endo_names_long, 'df');
M_.endo_names = char(M_.endo_names, 'AUX_ENDO_LAG_11_1');
M_.endo_names_tex = char(M_.endo_names_tex, 'AUX\_ENDO\_LAG\_11\_1');
M_.endo_names_long = char(M_.endo_names_long, 'AUX_ENDO_LAG_11_1');
M_.param_names = 'beta';
M_.param_names_tex = 'beta';
M_.param_names_long = 'beta';
M_.param_names = char(M_.param_names, 'phi_b');
M_.param_names_tex = char(M_.param_names_tex, 'phi\_b');
M_.param_names_long = char(M_.param_names_long, 'phi_b');
M_.param_names = char(M_.param_names, 'phi_bff');
M_.param_names_tex = char(M_.param_names_tex, 'phi\_bff');
M_.param_names_long = char(M_.param_names_long, 'phi_bff');
M_.param_names = char(M_.param_names, 'phi_bfh');
M_.param_names_tex = char(M_.param_names_tex, 'phi\_bfh');
M_.param_names_long = char(M_.param_names_long, 'phi_bfh');
M_.param_names = char(M_.param_names, 'phi_s');
M_.param_names_tex = char(M_.param_names_tex, 'phi\_s');
M_.param_names_long = char(M_.param_names_long, 'phi_s');
M_.param_names = char(M_.param_names, 'phi_sfg');
M_.param_names_tex = char(M_.param_names_tex, 'phi\_sfg');
M_.param_names_long = char(M_.param_names_long, 'phi_sfg');
M_.param_names = char(M_.param_names, 'phi_sfh');
M_.param_names_tex = char(M_.param_names_tex, 'phi\_sfh');
M_.param_names_long = char(M_.param_names_long, 'phi_sfh');
M_.param_names = char(M_.param_names, 'tau_c');
M_.param_names_tex = char(M_.param_names_tex, 'tau\_c');
M_.param_names_long = char(M_.param_names_long, 'tau_c');
M_.param_names = char(M_.param_names, 'alpha_bh');
M_.param_names_tex = char(M_.param_names_tex, 'alpha\_bh');
M_.param_names_long = char(M_.param_names_long, 'alpha_bh');
M_.param_names = char(M_.param_names, 'alpha_bf');
M_.param_names_tex = char(M_.param_names_tex, 'alpha\_bf');
M_.param_names_long = char(M_.param_names_long, 'alpha_bf');
M_.param_names = char(M_.param_names, 'alpha_dh');
M_.param_names_tex = char(M_.param_names_tex, 'alpha\_dh');
M_.param_names_long = char(M_.param_names_long, 'alpha_dh');
M_.param_names = char(M_.param_names, 'alpha_df');
M_.param_names_tex = char(M_.param_names_tex, 'alpha\_df');
M_.param_names_long = char(M_.param_names_long, 'alpha_df');
M_.exo_det_nbr = 0;
M_.exo_nbr = 8;
M_.endo_nbr = 23;
M_.param_nbr = 12;
M_.orig_endo_nbr = 22;
M_.aux_vars(1).endo_index = 23;
M_.aux_vars(1).type = 1;
M_.aux_vars(1).orig_index = 12;
M_.aux_vars(1).orig_lead_lag = -1;
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
 0 12 35;
 0 13 0;
 0 14 0;
 0 15 36;
 1 16 37;
 2 17 38;
 0 18 39;
 0 19 40;
 3 20 41;
 4 21 42;
 0 22 0;
 5 23 0;
 6 24 43;
 7 25 44;
 8 26 0;
 0 27 45;
 0 28 0;
 0 29 0;
 0 30 0;
 0 31 0;
 9 32 46;
 10 33 47;
 11 34 0;]';
M_.nstatic = 7;
M_.nfwrd   = 5;
M_.npred   = 3;
M_.nboth   = 8;
M_.nsfwrd   = 13;
M_.nspred   = 11;
M_.ndynamic   = 16;
M_.equations_tags = {
};
M_.static_and_dynamic_models_differ = 0;
M_.exo_names_orig_ord = [1:8];
M_.maximum_lag = 1;
M_.maximum_lead = 1;
M_.maximum_endo_lag = 1;
M_.maximum_endo_lead = 1;
oo_.steady_state = zeros(23, 1);
M_.maximum_exo_lag = 0;
M_.maximum_exo_lead = 0;
oo_.exo_steady_state = zeros(8, 1);
M_.params = NaN(12, 1);
M_.NNZDerivatives = zeros(3, 1);
M_.NNZDerivatives(1) = 101;
M_.NNZDerivatives(2) = 90;
M_.NNZDerivatives(3) = -1;
close all;
M_.params( 1 ) = 0.9975;
beta = M_.params( 1 );
M_.params( 2 ) = 1;
phi_b = M_.params( 2 );
M_.params( 4 ) = 1;
phi_bfh = M_.params( 4 );
M_.params( 3 ) = 1;
phi_bff = M_.params( 3 );
M_.params( 5 ) = 1;
phi_s = M_.params( 5 );
M_.params( 7 ) = 1;
phi_sfh = M_.params( 7 );
phi_sff    = 1;
M_.params( 8 ) = 0.1;
tau_c = M_.params( 8 );
M_.params( 9 ) = 0.2;
alpha_bh = M_.params( 9 );
M_.params( 10 ) = 0.2;
alpha_bf = M_.params( 10 );
M_.params( 11 ) = 0.2;
alpha_dh = M_.params( 11 );
M_.params( 12 ) = 0.2;
alpha_df = M_.params( 12 );
%
% INITVAL instructions
%
options_.initval_file = 0;
oo_.exo_steady_state( 2 ) = 1;
oo_.exo_steady_state( 1 ) = 1;
oo_.exo_steady_state( 3 ) = 0;
oo_.exo_steady_state( 4 ) = 0;
oo_.exo_steady_state( 6 ) = 0;
oo_.exo_steady_state( 5 ) = 0;
oo_.exo_steady_state( 7 ) = 1;
oo_.exo_steady_state( 8 ) = 1;
oo_.steady_state(23)=oo_.steady_state(12);
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
disp('Note: 1 warning(s) encountered in the preprocessor')
if ~isempty(lastwarn)
  disp('Note: warning(s) encountered in MATLAB/Octave code')
end
diary off
