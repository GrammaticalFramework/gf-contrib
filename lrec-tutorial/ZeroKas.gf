concrete ZeroKas of Zero = {
	lincat
		S, VP = Str;
		NP = {s : Case => Str ; g : Gender};
		V2 = {v : Gender => Str ; p : Str};
	lin
		Pred np vp = np.s ! Dat ++ vp;
		Compl v2 np = v2.v ! np.g ++ np.s ! Nom ++ v2.p;

		John = {s = table { Dat => "Johnas" ; Nom => "John"}; g = Masc};
		Mary = {s = table { Dat => "Mariayi" ; Nom => "Maria"}; g = Fem};

		Love = {v = table {Masc => "chu"; Fem => "cha"} ; p = "khwash karaan"};
	param
		Case = Dat | Nom;
		Gender = Masc | Fem;
}