% Facts
edge('Makkah', 'Madinah').
edge('Makkah', 'Riyadh').
edge('Madinah', 'Makkah').
edge('Madinah', 'Tabuk').
edge('Madinah', 'Taif').
edge('Tabuk', 'Taif').
edge('Taif', 'Tabuk').
edge('Taif', 'Dammam').
edge('Riyadh', 'Dammam').
edge('Dammam', 'Riyadh').
edge('Dammam', 'Al-Qatif').
edge('Al-Qatif', 'Dammam').
edge('Al-Qatif', 'Madinah').

% Rules
travel(Start, End, Path) :-
    travel_path(Start, End, [Start], RevPath),
    reverse(RevPath, Path).

travel_path(End, End, Visited, Visited).

travel_path(From, To, Visited, Path) :-
    edge(From, Next),
    \+ member(Next, Visited),
    travel_path(Next, To, [Next|Visited], Path).

