%Assignment 3
% Joshua Roberts (jpr293), Magan Omar(mao312), Rene Romo(rgr355), Athif
% Wulandana (aiw564)
% Prison Break
% Set in a prison, our Prison Break playset focuses on the relationships and needs of the prison population, including inmates and guards alike. Will you break out of (or into) the prison with the help of a guard? Will you instead form a gang and be feared by both inmates and guards? The possibilities are endless in Prison Break.
%Relations
:- discontiguous roles_relation/1, symmetric/1, left_unique/1,right_unique/1, implies/3, implies/2, contradiction/2.

conflicting_roles([prison_ward,inmate,guard, warden,
	prison_gang_leader, bodyguard, gang_member]).

roles_relation(prison_warden/inmate). %I'm assuming this is different to warden down below.
left_unique(prison_warden/inmate).

roles_relation(radiation_induced_cannibal/desired_victim).

roles_relation(psychologist/patient).
left_unique(psychologist/patient).

roles_relation(doctor/patient).

symmetric(siblings).
implies(relationship(X,siblings,_),
	relationship(X,family,_),
	role(X,sibling)).

implies(relationship(_,siblings,Y),
	relationship(_,family,Y),
	role(Y,sibling)).

symmetric(cousins).
implies(relationship(X,cousins,_),
	relationship(X,family,_),
	role(X,cousin)).

implies(relationship(_,cousins,Y),
	relationship(_,family,Y),
	role(Y,cousin)).


roles_relation(parent/child).
implies(relationship(X,parent/child,_),
	relationship(X,family,_),
	role(X,parent)).

implies(relationship(_,parent/child,Y),
	relationship(_,family,Y),
	role(child)).

roles_relation(uncle/nephew).
implies(relationship(X,uncle/nephew,_),
	relationship(X,family,_),
	role(uncle)).

implies(relationship(_,uncle/nephew,Y),
	relationship(_,family,Y),
	role(nephew)).

roles_relation(aunt/niece).
implies(relationship(X,aunt/niece,_),
	relationship(X,family,_),
	role(aunt)).

implies(relationship(_,aunt/niece,Y),
	relationship(_,family,Y),
	role(niece)).

symmetric(family).
implies(relationship(X,family,_)).

implies(relationship(_,family,Y)).

roles_relation(boss/employee).
left_unique(boss/employee).

roles_relation(assassin/target).
right_unique(assassin/target).%Asssuming it only has one target.

roles_relation(prison_gang_leader/bodyguard).

roles_relation(prison_gang_leader/gang_member).
left_unique(prison_gang_leader/gang_member). %Assuming it only has one leader

roles_relation(guard/inmate).

roles_relation(loan_shark/borrower).
left_unique(loan_shark/borrower). %Assuming it only has one loan shark

roles_relation(client/lawyer).
right_unique(client/laywer).

roles_relation(informant/guard).
roles_relation(chaplain/inmate).
roles_relation(janitor/inmate).

roles_relation(warden/secretary).
left_unique(warden/secretary).
right_unique(warden/secretary).

roles_relation(retired_assassin/contractor).


%Needs
need(break_out).
implies(needs(C, break_out), role(C, inmate)).
need(create_a_gang).
implies(needs(C, create_a_gang), role(C, inmate)).
need(get_out_on_good_behavior).
implies(needs(C, get_out_on_good_behavior), role(C, inmate)).
need(make_money).
need(smuggle).
need(drugs).
need(see_his_family).
need(booty).
need(food).
need(drink).
need(cigarettes).
need(alcohol).
need(big_macs).
need(get_into_prison).
contradiction(needs(C, get_into_prison), role(C, inmate)).
need(keep_inmates_in_prison).
need(keep_inmates_alive).
need(revenge_for_being_locked_up).
implies(needs(C, revenge_for_being_locked_up), role(C, inmate)).
need(find_the_snitch).
implies(needs(C, find_the_snitch), role(C, inmate)).
need(murder_someone_to_get_initiated).
implies(needs(C, murder_someone_to_get_initiated), role(C, inmate)).
need(gain_salvation).
need(convert_others).

%Objects
object(shank).
object(drugs).
object(money).
object(shovel).
object(cell_key).
object(pack_of_cards).
object(prison_blueprints).
object(t_bone_steak).
object(cigarettes).
object(rope).
object(guard_uniform).
object(gun).
object(recording_device).
object(book).
object(ipod).
object(syringe).
object(ball).
object(hammer).
object(nail_filer).
object(lockpicks).
object(burner_phone).


% Object implications/contradictions
implies(has(C,gun),role(C,guard)).
implies(has(C,cell_key), role(C,guard)).
implies(has(C,guard_uniform), role(C,guard)).
implies(has(C,prison_blueprints), role(C,ward)).
implies(has(C,syringe), role(C,doctor)).
implies(has(C,lockpicks),role(C,inmate)).
implies(has(C,recording_device), role(C, informant)).

contradiction(has(C,cell_key), role(C,inmate)).
contradiction(has(C,cell_key), role(C,prison_gang_leader)).
contradiction(has(C,drugs), role(C,inmate)).
contradiction(has(C,drugs), role(C,prison_gang_leader)).
contradiction(has(C,gun), role(C,inmate)).
contradiction(has(C,gun), role(C,prison_gang_leader)).
contradiction(has(C,shovel), role(C,inmate)).
contradiction(has(C,shovel), role(C,prison_gang_leader)).
contradiction(has(C,money), role(C,inmate)).
contradiction(has(C,money), role(C,prison_gang_leader)).

contradiction(has(C,shank),role(C,inmate)).
% should a prision_gang_leader have a shank? -- I think so, so
% commenting line below
% contradiciton(has(C,shank),role(C,prison_gang_leader)).



%Locations
location(cafeteria).
location(cell).
location(watchtower).
location(office_of_the_warden).
location(tunnel).
location(doctors_office).
location(guard_break_room).
location(prison_yard).
location(prison_basketball_court).
location(solitary_cell).
location(showers).
location(prison_chapel).
location(library).
location(roof).
location(gym).
location(bathroom).
location(visitation_room).
location(inmates_mind).
location(storage_closet).
location(prison_bomb_shelter).
location(outside_prison_walls).

%location implications/contradictions
%role_location(politician, a_fact_finding_tour_in_the_bahmamas).
%implies(at(X, inside_car(leaky_rowboat)), at(X, river)).
%implies(at(C, inside_abondoned_facility), role(C, secret_agent)).

%inmates can't start outside the prison or in a watch tower
contradiction(at(C,outside_prison_walls), role(C, inmate)).
contradiction(at(C,watchtower), role(C,inmate)).

%probably don't have a need of food if you're in a cafeteria
contradiction(at(C,cafeteria), needs(C,food)).
contradiction(at(C,cafeteria), needs(C,drink)).

%implies(at(C,tunnel),role(C,inmate)).
%why would you be in the cell you have the key to?
contradiction(at(C,cell),has(C,cell_key)).


%contradiction if you're not in prison
contradiction(at(C,outside_prison_walls), needs(C,break_out)).
contradiction(at(C,outside_prison_walls), needs(C,get_out_on_good_behavior)).
contradiction(at(C,outside_prison_walls), needs(C,revenge_for_being_locked_up)).
contradiction(at(C,outside_prison_walls), needs(C,smuggle)).


implies(at(C,inmates_mind),role(C,inmate)).
implies(at(C,cell),role(C,inmate)).
implies(at(C,solitary_cell),role(C,inmate)).

implies(at(C,library),has(C,book)).
implies(at(C,tunnel),has(C,shovel)).
implies(at(C,doctors_office),has(C,syringe)).

%inmates shouldn't start in the guards locations
implies(at(C,guard_break_room),role(C,guard)).
implies(at(C,watchtower),role(C,guard)).












