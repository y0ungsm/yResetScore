/*	Copyright (C) 2021 y0ung
	This program is free software: you can redistribute it and/or modify
	it under the terms of the GNU General Public License as published by
	the Free Software Foundation, either version 3 of the License, or
	(at your option) any later version.
	This program is distributed in the hope that it will be useful,
	but WITHOUT ANY WARRANTY; without even the implied warranty of
	MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
	GNU General Public License for more details.
	
	You should have received a copy of the GNU General Public License
	along with this program. If not, see <http://www.gnu.org/licenses/>.
*/

#include <sourcemod>
#include <cstrike>
#include <multicolors>

public Plugin myinfo =  {
	name = "[ CSGO ] yResetScore", 
	author = "y0ung", 
	description = "[ yResetScore ]", 
	version = "1.0.1", 
	url = "FeelTheGame.eu"
};

public void OnPluginStart() {
	RegConsoleCmd("sm_rs", ResetScore);
	RegConsoleCmd("sm_resetscore", ResetScore);
}

public void OnMapStart() {
	
	ServerCommand("mp_backup_round_file \"\"");
	ServerCommand("mp_backup_round_file_last \"\"");
	ServerCommand("mp_backup_round_file_pattern \"\"");
	ServerCommand("mp_backup_round_auto 0");
	
}

public Action ResetScore(int client, int args) {
	
	if (GetClientDeaths(client) || CS_GetClientContributionScore(client))
	{
		CS_SetMVPCount(client, 0);
		CS_SetClientAssists(client, 0);
		SetEntProp(client, Prop_Data, "m_iFrags", 0);
		SetEntProp(client, Prop_Data, "m_iDeaths", 0);
		CS_SetClientContributionScore(client, 0);
		
		CPrintToChat(client, "{darkred}[yResetScore]{green} Twoje punkty zostały zresetowane");
	}
	else
	{
		CPrintToChat(client, "{darkred}[yResetScore]{green} Masz już 0 punktów");
	}
}

/* © 2021 Coded with ❤ for clients		  */