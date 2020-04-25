%Taking input of RA,dec value of the star
RA=0;% in hours
dec=0; %in degrees
%Converting to radians
ra_star= RA*15*pi/180.0;     
dec_star= dec*pi/180.0;
%Deriving the coordinates of the star from these values
x_star=cos(dec_star)*cos(ra_star);
y_star=cos(dec_star)*sin(ra_star);
z_star=sin(dec_star);
%Defining the position of the sensor using the 3 euler angles
a_sensor= pi/2;%This is RA
b_sensor= pi/2; %This is dec
c_sensor=pi;%This is roll
%Now the order for rotation is ZYX
%Writing the corresponding rotation matrices in order to obtain star
%coordinates in sensor's coordinates
Rz = [cos(a_sensor) -sin(a_sensor) 0; sin(a_sensor) cos(a_sensor) 0;0 0 1];
Ry = [cos(b_sensor) 0 sin(b_sensor); 0 1 0; -sin(b_sensor) 0 cos(b_sensor)];
Rx = [1 0 0;0 cos(c_sensor) -sin(c_sensor) ; 0 sin(c_sensor) cos(c_sensor)];
%Storing as a row vestor is easier than a column
T_r1 = [x_star y_star z_star];
%in order z,y,x
T_r2 = T_r1*Rz;
T_r3 = T_r2*Ry;
T_r4 = T_r3*Rx;
%Display the final coordinates
disp(T_r4)


