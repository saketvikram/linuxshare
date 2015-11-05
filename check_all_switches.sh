# List of switches in different buildings
export sw_building_c="swc.ff swc1.ff swc2.ff swc21.ff  swc3.ff swc4.ff swc5.ff swc6.ff swc7.priv.phil.muni.cz swc8.ff swc9.ff"
export sw_building_d="swd.ff swd1.ff swd2.ff swd21.ff swd3.ff"
export sw_building_e="swe1.ff"
export sw_building_f="swf.ff swf1.ff swf2.ff swf3.ff swf4.ff"
export sw_building_g="swg3.ff swgpp2.ff"
export sw_building_j="swjx.priv.phil.muni.cz swj5"
export sw_building_g="swgx.priv.phil.muni.cz"
export sw_building_k="swk.ff swk1.ff swk2.ff swk3.ff swk4.ff swk8.priv.phil.muni.cz swk9.ff"
export sw_building_l="swl1.ff swl2.ff"
export sw_building_m="swmx.priv.phil.muni.cz"
export sw_building_n="swn.ff swn7.ff swn8.ff swn9.ff"
export sw_building_r="swr1.ff swr2.ff"
export sw_server_room="sws.ff sws5.ff"
export sw_building_u="swu.priv.phil.muni.cz swu1.priv.phil.muni.cz swu2.priv.phil.muni.cz swu21.priv.phil.muni.cz swu22.priv.phil.muni.cz swu23.priv.phil.muni.cz"

login_name=georgiev

# Making loop to connect to all switches and setup some parameter.
# This is done when there is no network management system.
for switch_name in \
$sw_building_c \
$sw_building_d \
$sw_building_e \
$sw_building_f \
$sw_building_g \
$sw_building_j \
$sw_building_g \
$sw_building_k \
$sw_building_l \
$sw_building_m \
$sw_building_n \
$sw_building_r \
$sw_server_room \
$sw_building_u # end of loop condition
do
  echo Connecting to $switch_name
  echo
  ssh $login_name@$switch_name
  echo
done
