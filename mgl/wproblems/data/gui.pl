:- consult(library(pce)).

choose_var(Vs,P, A) :-
	unnormal(P;U),
	swritef(Tdlg,'Name %w', [U]),
	new(Dlg, dialog(Tdlg)),
	send_list(Dlg, append,
		[new(S, menu(variable)),
		 button(cancel, message(Dlg, return, @nil)),
		 button(ok, message(Dlg, return, S?selection))]),
	send_list(S, append, Vs),
	send(Dlg, default_button, ok),
	get(Dlg, confirm, A),
	send(Dlg, destroy),
	A \== @nil.




