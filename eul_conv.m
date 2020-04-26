RA=18;% in hours
dec=90; %in degrees
%Convert to radians
ra_star= RA*15*pi/180.0;     
dec_star= dec*pi/180.0;
x_star=cos(dec_star)*cos(ra_star);
y_star=cos(dec_star)*sin(ra_star);
z_star=sin(dec_star);
%euler angles
alpha_se = pi/2;
beta_se = pi/2 ;
phi_se = 0;
%order is ZYX
eul=[alpha_se beta_se phi_se];
rotm=eul2rotm(eul,'ZYX');

T_r1 = [x_star y_star z_star]; 
%final coordinates are
T_fin = T_r1*rotm
