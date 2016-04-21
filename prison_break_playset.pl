%Assignment 3
%Joshua Roberts, Magan Omar, Rene Romo, Athif Wulandana
%Relations

roles_relation(prison_ward/inmate).
roles_relation(radiation_induced_cannibal/desired_victim).
roles_relation(psychologist/patient).
roles_relation(doctor/patient).
symmetric(siblings).
symmetric(cousins).
roles_relation(parent/child).
roles_relation(uncle/nephew).
symmetric(family).
roles_relation(boss/employee).
roles_relation(assassin/target).
roles_relation(prison_gang_leader/bodyguard).
roles_relation(prison_gang_leader/gang_member).
roles_relation(guard/inmate).
roles_relation(loan_shark/borrower).
roles_relation(client/lawyer).
roles_relation(informant/guard).
roles_relation(chaplain/inmate).
roles_relation(janitor/inmate).
roles_relation(warden/secretary).
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












