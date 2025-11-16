%% ================================================================
%  Create / Update Parameters in Simulink Data Dictionary
%  Dictionary: Satelite_Dynamic.sldd
%  Author: (Your Name)
%  Description: Creates all spacecraft simulation parameters
% =================================================================

clear; clc;

%% --- Open or Create SLDD ------------------------------------------------
dictName = 'Satelite_Dynamics.sldd';

if isfile(dictName)
    fprintf('Opening existing dictionary: %s\n', dictName);
    dictObj = Simulink.data.dictionary.open(dictName);
else
    fprintf('Creating new dictionary: %s\n', dictName);
    dictObj = Simulink.data.dictionary.create(dictName);
end

% Access Design Data section
dData = getSection(dictObj, 'Design Data');


%% ========================================================================
% 1. Initial Attitude (Euler Angles) [deg]
% ========================================================================
InitialAttitude_deg = Simulink.Parameter;
InitialAttitude_deg.Value      = [12 31 -40];
InitialAttitude_deg.DataType   = 'single';
InitialAttitude_deg.Dimensions = [1 3];
InitialAttitude_deg.Unit       = 'deg';

addEntry(dData, 'InitialAttitude_deg', InitialAttitude_deg);


%% ========================================================================
% 2. Final Desired Attitude (Euler Angles) [deg]
% ========================================================================
FinalDesiredAttitude_deg = Simulink.Parameter;
FinalDesiredAttitude_deg.Value      = [40 -30 90];
FinalDesiredAttitude_deg.DataType   = 'single';
FinalDesiredAttitude_deg.Dimensions = [1 3];
FinalDesiredAttitude_deg.Unit       = 'deg';

addEntry(dData, 'FinalDesiredAttitude_deg', FinalDesiredAttitude_deg);


%% ========================================================================
% 3. Initial Body Rates [deg/s]
% ========================================================================
InitialBodyRates_degps = Simulink.Parameter;
InitialBodyRates_degps.Value      = [10 -20 12];
InitialBodyRates_degps.DataType   = 'single';
InitialBodyRates_degps.Dimensions = [1 3];
InitialBodyRates_degps.Unit       = 'deg/s';

addEntry(dData, 'InitialBodyRates_degps', InitialBodyRates_degps);


%% ========================================================================
% 4. Final Desired Body Rates [deg/s]
% ========================================================================
FinalDesiredBodyRates_degps = Simulink.Parameter;
FinalDesiredBodyRates_degps.Value      = [0 0 0];
FinalDesiredBodyRates_degps.DataType   = 'single';
FinalDesiredBodyRates_degps.Dimensions = [1 3];
FinalDesiredBodyRates_degps.Unit       = 'deg/s';

addEntry(dData, 'FinalDesiredBodyRates_degps', FinalDesiredBodyRates_degps);


%% ========================================================================
% 5. Satellite Moment of Inertia [kg*m^2]
% ========================================================================
SatelliteInertia = Simulink.Parameter;
SatelliteInertia.Value = [ 1.10  0.05   0.00;
                           0.05  1.90  -0.01;
                           0.00 -0.01   1.12 ];
SatelliteInertia.DataType   = 'single';
SatelliteInertia.Dimensions = [3 3];
SatelliteInertia.Unit       = 'kg*m^2';

addEntry(dData, 'SatelliteInertia', SatelliteInertia);


%% ========================================================================
% 6. Reaction Wheel Count
% ========================================================================
ReactionWheelCount = Simulink.Parameter;
ReactionWheelCount.Value      = 3;
ReactionWheelCount.DataType   = 'single';
ReactionWheelCount.Dimensions = [1 1];

addEntry(dData, 'ReactionWheelCount', ReactionWheelCount);


%% ========================================================================
% 7. Disturbance Torque (ECI frame)
% ========================================================================

% Sinusoidal type
DisturbanceTorqueType = Simulink.Parameter;
DisturbanceTorqueType.Value      = "Sinusoidal";
DisturbanceTorqueType.DataType   = 'string';
DisturbanceTorqueType.Dimensions = [1 1];

addEntry(dData, 'DisturbanceTorqueType', DisturbanceTorqueType);

% Numerical amplitude (1e-6 Nm)
DisturbanceTorqueAmplitude_Nm = Simulink.Parameter;
DisturbanceTorqueAmplitude_Nm.Value      = 1e-6;
DisturbanceTorqueAmplitude_Nm.DataType   = 'single';
DisturbanceTorqueAmplitude_Nm.Dimensions = [1 1];
DisturbanceTorqueAmplitude_Nm.Unit       = 'N*m';

addEntry(dData, 'DisturbanceTorqueAmplitude_Nm', DisturbanceTorqueAmplitude_Nm);


%% ========================================================================
% Finalize / Save
% ========================================================================
saveChanges(dictObj);

fprintf('\n✔ All parameters added/updated in %s\n', dictName);
