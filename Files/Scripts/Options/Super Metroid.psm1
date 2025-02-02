function PatchOptions() {
    
    if (IsChecked $Redux.Graphics.Widescreen)           { ApplyPatch -Patch "Compressed\widescreen.ips"; Copy-Item -LiteralPath ($GameFiles.compressed + "\widescreen.bso") -Destination ($ROMFile.Patched.replace($ROMFile.Extension, ".bso")) -Force }
    if (IsChecked $Redux.Graphics.RedesignedSamus)      { ApplyPatch -Patch "Compressed\redesigned_samus.ips" }

    if (IsChecked $Redux.Gameplay.FixedUnlockedDoors)   { ApplyPatch -Patch "Compressed\fixed_tourian_unlocked_doors.ips" }
    if (IsChecked $Redux.Gameplay.HeavyPhysics)         { ApplyPatch -Patch "Compressed\heavy_physics.ips" }
    if (IsChecked $Redux.Gameplay.SaveStationsRefill)   { ApplyPatch -Patch "Compressed\save_stations_refill_everything.ips" }
    if (IsChecked $Redux.Gameplay.SkipCeres)            { ApplyPatch -Patch "Compressed\skip_ceres.ips" }

}



#==============================================================================================================================================================================================
function PatchReduxOptions() {

    if (IsChecked $Redux.Revert.Xray)                   { ApplyPatch -Patch "Compressed\Original\x_ray.ips" }
    if (IsChecked $Redux.Revert.ElevatorSpeed)          { ApplyPatch -Patch "Compressed\Original\elevator_speed.ips" }

}



#==============================================================================================================================================================================================
function CreateOptions() {
    
    CreateOptionsDialog -Columns 2 -Height 320

}


#==============================================================================================================================================================================================
function CreateTabMain() {
    
    # GRAPHICS #
    CreateReduxGroup    -Tag "Graphics" -Text "Graphics"
    CreateReduxCheckBox -Name "Widescreen"                -Text "16:9 Widescreen [!]"  -Info "16:9 Widescreen display`n[!] Only works with the BSNES / Higan Widescreen feature, and will thus not cause a change in Dolphin"  -Credits "ocesse" -Native
    CreateReduxCheckBox -Name "RedesignedSamus"           -Text "Redesigned Samus"     -Info "Change the appearence of Samus"                                                                                                  -Credits "Dmit Ryaz"

    # GAMEPLAY #
    CreateReduxGroup    -Tag "Gameplay" -Text "Gameplay" -Height 2
    CreateReduxCheckBox -Name "FixedTourianUnlockedDoors" -Text "Fixed Unlocked Doors" -Info "Makes it so that the Tourian doors now let you go back to Crateria normally`nThis patch is already implemented into Redux"  -Credits "ShadowOne333 and this team"
    CreateReduxCheckBox -Name "HeavyPhysics"              -Text "Heavy Physics [!]"    -Info "This will make it so that Samus now lands faster and with more gravity to her, similar to that of the GBA Metroids`n[!]This breaks the Demo sequences`n[!]In-game cutscenes and main gameplay still play out normally" -Credits "ShadowOne333 and this team"
    CreateReduxCheckBox -Name "SaveStationsRefill"        -Text "Save Stations Refill" -Info "Save Stations will now refill both Energy and all Weapons"                                                                   -Credits "ShadowOne333 and this team"
    CreateReduxCheckBox -Name "SkipCeres"                 -Text "Skip Ceres"           -Info "Skip the Ceres Station sequence at the beginning, and start off directly on Planet Zebes' Landing Site on New Game"          -Credits "ShadowOne333 and this team"

}


#==============================================================================================================================================================================================
function CreateTabRedux() {
    
    # ORIGINAL #
    CreateReduxGroup    -Tag "Revert" -Text "Original (Revert)"
    CreateReduxCheckBox -Name "Xray"                      -Text "X-Ray"              -Info "Restores the original Super Metroid X-Ray Visor width"  -Credits "ShadowOne333 and this team"
    CreateReduxCheckBox -Name "ElevatorSpeed"             -Text "Elevator Speed"     -Info "Restores the original Super Metroid elevator speeds"    -Credits "ShadowOne333 and this team"

}