// Compatability with future LS: Battlefields rewrite
class lsb_spaceDebrisPresets {
    class shipDebris {
        displayName = CSTRING(spaceDebrisPreset_shipDebris);
        objects[] = {
            "Land_DomeDebris_01_struts_large_green_F", 1,
            "Land_DomeDebris_01_struts_small_green_F", 1
        };
    };

    class asteroids {
        displayName = CSTRING(spaceDebrisPreset_asteroids);
        objects[] = {
            "Land_Lavaboulder_02_F", 1,
            "Land_Lavaboulder_03_F", 1,
            "Land_SharpRock_monolith", 1,
            "Land_SharpRock_spike", 1,
            "Land_SharpRock_wallV", 0.05,
            "Land_W_sharpRock_monolith", 1,
            "Land_W_sharpRock_spike", 1,
            "Land_W_sharpRock_wallH", 0.05,
            "Land_W_sharpRock_wallV", 0.05
        };
    };

    class asteroidsSmall {
        displayName = CSTRING(spaceDebrisPreset_asteroidsSmall);
        objects[] = {
            "Land_Bare_boulder_01_F", 1,
            "Land_Bare_boulder_02_F", 1,
            "Land_Bare_boulder_03_F", 1,
            "Land_Bare_boulder_04_F", 1,
            "Land_Bare_boulder_05_F", 1,
            "Land_LavaStone_big_F", 1,
            "Land_LavaStone_small_F", 1,
            "Land_SharpStone_01", 1,
            "Land_SharpStone_02", 1,
            "Land_SharpStone_03", 1,
            "Land_SharpStones_erosion", 1,
            "Land_Small_Stone_02_F", 1,
            "Land_W_sharpStone_01", 1,
            "Land_W_sharpStone_02", 1,
            "Land_W_sharpStone_03", 1,
            "Land_W_sharpStones_erosion", 1
        };
    };
};
