%To Start the system type start.


:- use_module(library(jpl)).
start :-sleep(0.4),	
		write('-----------------------------------------------------------------'),nl,
		sleep(0.4),
		write('*****************************************************************'),nl,
		sleep(0.2),
		write("###################||| COURSE ADVISER EXPERT SYSTEM |||#########################"),nl,
		sleep(0.4),
		write('*****************************************************************'),nl,
		sleep(0.4),
		write('-----------------------------------------------------------------'),nl,nl,nl,
		
		
        /*write("Hi Tell me your name Please : "),
        read(Patient),*/
		
		
		interface2.
		
		
       /* hypothesis(Patient,Disease),
        write(Patient),write(', you '), write(' probably have '),write(Disease),write('.'),undo,
		nl,nl,nl,
		sleep(0.7),
		write('*****************************************************************'),nl,
		sleep(0.4),
		write("################||| THANK YOU FOR USE ME |||#####################"),nl,
		sleep(0.4),
		write('*****************************************************************'),nl.*/
        
        
	selection(Student,maths) :- verify(Student," are you intetesting for maths (y/n) ?").
	selection(Student,information_technology) :- verify(Student," are you intetesting for IT (y/n) ?").
	selection(Student,physics) :- verify(Student," are you intetesting for physics (y/n) ?").
	selection(Student,engineering_technology) :- verify(Student," are you intetesting for Engineering Technology (y/n) ?").
	selection(Student,botany) :- verify(Student," are you intetesting for botany (y/n) ?").
	selection(Student,zoology) :- verify(Student," are you intetesting for zoology (y/n) ?").
	selection(Student,chemistry) :- verify(Student," are you intetesting for chemistry (y/n) ?").
	selection(Student,accounting) :- verify(Student," are you intetesting for accounting (y/n) ?").
	selection(Student,economics) :- verify(Student," are you intetesting for economics (y/n) ?").
	selection(Student,business_studies) :- verify(Student," are you intetesting for business studies (y/n) ?").
    
	

        
    hypothesis(Student,information_technology_course) :-
        selection(Student,maths),
        selection(Student,information_technology),
        selection(Student,physics).
      
        
    hypothesis(Student,engineering_technology_course) :-
        selection(Student,maths),
		selection(Student,physics),
        selection(Student,engineering_technology).
        
	hypothesis(Student,bio_science_course) :-
        selection(Student,botany),
		selection(Student,zoology),
        selection(Student,chemistry).	
   
    hypothesis(Student,management_studies_course) :-
        selection(Student,accounting),
		selection(Student,economics),
        selection(Student,business_studies).
		
	hypothesis(Student,chemistry_course) :-
        selection(Student,maths),
		selection(Student,physics),
        selection(Student,chemistry).	
		
    hypothesis(Student,phamacist_course) :-
        selection(Student,maths),
		selection(Student,physics),
        selection(Student,chemistry).	
		
	hypothesis(_,"I'm Sorry, I couldn't found a suitable course for you...").
	
    response(Reply) :-
        read(Reply),
        write(Reply),nl.
		
ask(Student,Question) :-
	write(Student),write(', do you'),write(Question),
	/*read(N),
	( (N == yes ; N == y)
      ->
       assert(yes(Question)) ;
       assert(no(Question)), fail),*/
	
	interface(', do you',Student,Question),
	write('Loading.'),nl,
	sleep(1),
	write('Loading..'),nl,
	sleep(1),
	write('Loading...'),nl,
	sleep(1),
    nl.
	
:- dynamic yes/1,no/1.		
	
verify(S,C) :-
   (yes(C) 
    ->
    true ;
    (no(C)
     ->
     fail ;
     ask(S,C))).
	 
undo :- retract(yes(_)),fail. 
undo :- retract(no(_)),fail.
undo.


st(Student):- 

		hypothesis(Student,Course),
		interface3(Student,', Most probably you suitable for  ',Course,'.'),
        write(Student),write(', Most probably you suitable for '),write(Course),write('.'),undo,end.

end :-
		nl,nl,nl,
		sleep(0.7),
		write('*****************************************************************'),nl,
		sleep(0.4),
		write("################||| THANK YOU FOR USE ME |||#####################"),nl,
		sleep(0.4),
		write('*****************************************************************'),nl.

interface(X,Y,Z) :-
	atom_concat(Y,X, FAtom),
	atom_concat(FAtom,Z,FinalAtom),
	jpl_new('javax.swing.JFrame', ['COURSE ADVISER'], F),
	jpl_new('javax.swing.JLabel',['--- COURSE ADVISER EXPERT SYSTEM ---'],LBL),
	jpl_new('javax.swing.JPanel',[],Pan),
	jpl_call(Pan,add,[LBL],_),
	jpl_call(F,add,[Pan],_),
	jpl_call(F, setLocation, [400,300], _),
	jpl_call(F, setSize, [400,300], _),
	jpl_call(F, setVisible, [@(true)], _),
	jpl_call(F, toFront, [], _),
	jpl_call('javax.swing.JOptionPane', showInputDialog, [F,FinalAtom], N),
	jpl_call(F, dispose, [], _), 
	write(N),nl,
	( (N == yes ; N == y)
      ->
       assert(yes(Z)) ;
       assert(no(Z)), fail).
	   		
interface2 :-
	jpl_new('javax.swing.JFrame', ['COURSE ADVISER'], F),
	jpl_new('javax.swing.JLabel',['--- COURSE ADVISER EXPERT SYSTEM ---'],LBL),
	jpl_new('javax.swing.JPanel',[],Pan),
	jpl_call(Pan,add,[LBL],_),
	jpl_call(F,add,[Pan],_),
	jpl_call(F, setLocation, [400,300], _),
	jpl_call(F, setSize, [400,300], _),
	jpl_call(F, setVisible, [@(true)], _),
	jpl_call(F, toFront, [], _),
	jpl_call('javax.swing.JOptionPane', showInputDialog, [F,'Hi, Tell me your name please'], N),
	jpl_call(F, dispose, [], _), 
	/*write(N),nl,*/
	(	N == @(null)
		->	write('you cancelled'),interface3('you cancelled. ','Thank you ','for use ','me.'),end,fail
		;	write("Hi, Tell me your name please: "),write(N),nl,st(N)
	).
	
	
interface3(P,W1,D,W2) :-
	atom_concat(P,W1, A),
	atom_concat(A,D,B),
	atom_concat(B,W2,W3),
	jpl_new('javax.swing.JFrame', ['COURSE ADVISER'], F),
	jpl_new('javax.swing.JLabel',['--- COURSE ADVISER EXPERT SYSTEM ---'],LBL),
	jpl_new('javax.swing.JPanel',[],Pan),
	jpl_call(Pan,add,[LBL],_),
	jpl_call(F,add,[Pan],_),
	jpl_call(F, setLocation, [400,300], _),
	jpl_call(F, setSize, [400,300], _),
	jpl_call(F, setVisible, [@(true)], _),
	jpl_call(F, toFront, [], _),
	jpl_call('javax.swing.JOptionPane', showMessageDialog, [F,W3], N),
	jpl_call(F, dispose, [], _), 
	/*write(N),nl,*/
	(	N == @(void)
		->	write('')
		;	write("")
	).
	