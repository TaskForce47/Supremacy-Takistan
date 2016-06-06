#ifdef patrols
  #define patrols_amount_min 3
  #define patrols_amount_max 7
  #define patrols_vehicles_min 2
  #define patrols_vehicles_max 7
  #define patrols_respawn_min 120
  #define patrols_respawn_max 900
  #define patrols_check_timer 300
#endif

switch (tf47_param_vehiclemod) do {
  //Vanilla
  case 0 : {
  };
  //CUP
  case 1 : {
  };
  //RHS
  case 2 : {
    #ifdef patrols
      #define patrols_vehicles ["rhsgref_ins_g_zsu234","rhsgref_ins_g_btr60","rhsgref_ins_g_btr70","rhsgref_ins_g_uaz","rhsgref_ins_g_uaz_ags","rhsgref_ins_g_uaz_dshkm_chdkz","rhsgref_ins_g_uaz_open","rhsgref_ins_g_uaz_spg9","rhsgref_ins_g_bmd1","rhsgref_ins_g_bmd1p","rhsgref_ins_g_bmd2","rhsgref_ins_g_bmp1","rhsgref_ins_g_bmp1d","rhsgref_ins_g_bmp1k","rhsgref_ins_g_bmp1p","rhsgref_ins_g_bmp2e","rhsgref_ins_g_bmp2","rhsgref_ins_g_bmp2d","rhsgref_ins_g_bmp2k","rhsgref_BRDM2_ins_g","rhsgref_BRDM2_ATGM_ins_g","rhsgref_BRDM2UM_ins_g","rhsgref_BRDM2_HQ_ins_g","rhsgref_ins_g_t72ba","rhsgref_ins_g_t72bb","rhsgref_ins_g_t72bc","rhsgref_ins_g_BM21","rhsgref_ins_g_gaz66","rhsgref_ins_g_gaz66_ammo","rhsgref_ins_g_gaz66_flat","rhsgref_ins_g_gaz66o","rhsgref_ins_g_gaz66o_flat","rhsgref_ins_g_gaz66_r142","rhsgref_ins_g_gaz66_zu23","rhsgref_ins_g_gaz66_ap2","rhsgref_ins_g_gaz66_repair","rhsgref_ins_g_ural","rhsgref_ins_g_ural_open","rhsgref_ins_g_ural_work","rhsgref_ins_g_ural_work_open","rhsgref_ins_g_ural_Zu23"]
      #define patrols_infantry ["rhsgref_ins_g_specialist_aa","rhsgref_ins_g_grenadier_rpg","rhsgref_ins_g_machinegunner","rhsgref_ins_g_medic","rhsgref_ins_g_militiaman_mosin","rhsgref_ins_g_squadleader","rhsgref_ins_g_rifleman","rhsgref_ins_g_rifleman_akm","rhsgref_ins_g_rifleman_aksu","rhsgref_ins_g_grenadier","rhsgref_ins_g_rifleman_RPG26","rhsgref_ins_g_saboteur","rhsgref_ins_g_engineer","rhsgref_ins_g_sniper","rhsgref_ins_g_spotter"]
    #endif
  };
  default {};
};
