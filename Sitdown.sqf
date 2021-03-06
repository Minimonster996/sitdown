//this addAction ["<t color='#0099FF'>Sit Down</t>","Chair\sitdown.sqf","",0,false,false,"",'player distance _target < 2 && !(_target getVariable ["sitting",false]) && isNil "life_sitting_chair" && isNil "life_action_standup"'];
_chair = _this select 0; 
_unit = _this select 1;
_chair setVariable ["sitting",true,true]; 

_dir = switch (typeOf _chair) do
{
	case "Land_ChairPlastic_F": { 270 };
	case "Land_Bench_F": { 90 };
	default { 180 };
};

_z = switch (typeOf _chair) do
{
	case "Land_Bench_01_F" : { -0.5 };
	default { 0 };
};


[_unit,"Crew",false] remoteExecCall ["RR_fnc_animSync",0];
waitUntil {animationState player == "crew"};
_unit setPos [(getPosATL _chair select 0),(getPosATL _chair select 1),(getPosATL _chair select 2)-_z];
_unit setDir ((getDir _chair) - _dir); 
life_action_standup = _unit addaction ["<t color='#0099FF'>Stand Up</t>",{[] call RR_fnc_standup;}];
life_sitting_chair = _chair;
_unit setposatl [getPosATL _unit select 0, getPosATL _unit select 1,((getPosATL _unit select 2))];
