% Define the different programming languages and their characteristics
language(1, "C", low_level, system_programming).
language(2, "Python", high_level, general_purpose).
language(3, "Java", high_level, general_purpose).
language(4, "Prolog", high_level, logic_programming).

% Define the questions and their corresponding answers
question(1, "What type of language do you need? [1] Low-level [2] High-level [3] Logic-based ").
question(2, "Do you need a language for system programming? [1] Yes [2] No ").
question(3, "Do you need a language for general purpose? [1] Yes [2] No ").

% Define the main expert system rule
expert_system :- 
    question(1, Q1),
    read(A1),
    ( (A1 == 1) -> 
      ( language(Id, L, low_level, _), 
        write("You should consider using "), write(L), write(".") ) ; 
      (A1 == 2) -> 
      ( question(2, Q2),
        read(A2),
        ( (A2 == 1) -> 
          ( language(Id, L, _, system_programming), 
            write("You should consider using "), write(L), write(".") ) ; 
          question(3, Q3),
          read(A3),
          ( (A3 == 1) -> 
            ( language(Id, L, _, general_purpose), 
              write("You should consider using "), write(L), write(".") ) ; 
            (A1 == 3) -> 
            ( language(Id, L, _, logic_programming), 
              write("You should consider using "), write(L), write(".") ) 
            )
          )
        )
      ).