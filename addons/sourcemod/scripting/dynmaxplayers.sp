#pragma semicolon 1
#pragma newdecls required

#include <sdktools>
#include <sourcescramble>

public Plugin myinfo =
{
	name = "Dynamic Max Players",
	author = "Mikusch",
	description = "Allows changing maxplayers while the server is running.",
	version = "1.0.0",
	url = "https://github.com/Mikusch/dynmaxplayers"
}

public void OnPluginStart()
{
	GameData gameconf = new GameData("dynmaxplayers");
	if (!gameconf)
		ThrowError("Failed to find dynmaxplayers gamedata");
	
	MemoryPatch patch = MemoryPatch.CreateFromConf(gameconf, "maxplayers::AllowChangeWhileRunning");
	if (!patch.Validate())
		ThrowError("Failed to verify maxplayers patch.");
	else if (patch.Enable())
		LogMessage("Enabled maxplayers patch.");
}
