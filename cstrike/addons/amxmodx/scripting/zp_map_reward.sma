#include <amxmodx>
//#include <zombie_plague/zp_packs_system>

native zp_get_user_packs(index);
native zp_set_user_packs(index, amount);

#define PLUGIN "[ZP] One-Time Map Reward"
#define VERSION "1.0"
#define AUTHOR "DadoDz"

new bool:g_claim[33];

#define PACKS_REWARD 15

public plugin_init()
{
	register_plugin(PLUGIN, VERSION, AUTHOR);

	register_clcmd("say /get", "clcmd_claim")
	register_clcmd("say get", "clcmd_claim")
}

public client_putinserver(id) g_claim[id] = false;

public clcmd_claim(id)
{
    if (g_claim[id])
    {
        client_print_color(id, print_team_default, "^x04[ZP]^x01 You already claimed your map reward!");
        return PLUGIN_HANDLED;
    }

    g_claim[id] = true;
    zp_set_user_packs(id, zp_get_user_packs(id) + PACKS_REWARD);
    client_print_color(id, print_team_default, "^x04[ZP]^x01 You received^x04 %d packs^x01 for this map!", PACKS_REWARD);
    return PLUGIN_HANDLED;
}
