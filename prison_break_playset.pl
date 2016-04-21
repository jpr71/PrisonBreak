%Assignment 3
%Relations
:- discontiguous roles_relation/1, symmetric/1.

conflicting_roles([prison_ward,inmate,guard, warden,
	prison_gang_leader, bodyguard, gang_member]).

roles_relation(prison_warden/inmate).
left_unique(prison_warden/inmate).

roles_relation(radiation_induced_cannibal/desired_victim).

roles_relation(psychologist/patient).
left_unique(psychologist/patient).

roles_relation(doctor/patient).

symmetric(siblings).
implies(relationship(X,siblings,_),
	relationship(X,family,_),
	role(X,sibling),
	role(X,family)).

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
implies(relationship(X,parent/child,_)
	implies(X,family,_)).

implies(relationship(_,parent/child,Y)
	implies(_,family,Y)).

roles_relation(uncle/nephew).
implies(relationship(X,uncle/nephew,_)
	implies(X,family,_)).

implies(relationship(_,uncle/nephew,Y)
	implies(_,family,Y)).

symmetric(family).
implies(relationship(X,family,_)).

implies(relationship(_,family,Y)).

roles_relation(boss/employee).
left_unique(boss/employee).

roles_relation(assassin/target).
right_unique(assassin/target).

roles_relation(prison_gang_leader/bodyguard).

roles_relation(prison_gang_leader/gang_member).
left_unique(prison_gang_leader/gang_member).

roles_relation(guard/inmate).

roles_relation(loan_shark/borrower).
left_unique(loan_shark/borrower).

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
need(create_a_gang).
need(get_out_on_good_behavior).
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
need(keep_inmates_in_prison).
need(keep_inmates_alive).
need(revenge_for_being_locked_up).
need(find_the_snitch).
need(murder_someone_to_get_initiated).
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
location(prisoners_mind).
location(storage_closet).
location(prison_bomb_shelter).
location(outside_prison_walls).
