function eul2 = rot2eul( R, varargin )

%   ROTM2EUL Convert rotation matrix to Euler angles
%   EUL = ROTM2EUL(R) converts a 3D rotation matrix, R, into the corresponding
%   Euler angles, EUL. R is an 3-by-3-by-N matrix containing N rotation
%   matrices. The output, EUL, is an N-by-3 matrix of Euler rotation angles.
%   Rotation angles are in radians.
%
%   EUL = ROTM2EUL(R, SEQ) converts a rotation matrix into Euler angles.
%   The Euler angles are specified by the axis rotation sequence, SEQ.
%
%   The default rotation sequence is 'ZYX', where the order of rotation
%   angles is Z Axis Rotation, Y Axis Rotation, and X Axis Rotation.
%
%   The following rotation sequences, SEQ, are supported: 'ZYX' and 'ZYZ'.
%
%   Example:
%      % Calculates Euler angles for a rotation matrix
%      % By default, the ZYX axis order will be used.
%      R = [0 0 1; 0 1 0; -1 0 0];
%      eul = rotm2eul(R)
%
%      % Calculate the Euler angles for a ZYZ rotation
%      eulZYZ = rotm2eul(R, 'ZYZ')
%
%   See also eul2rotm
%   Copyright 2014-2015 The MathWorks, Inc.
%   #codegen

robotics.internal.validation.validateRotationMatrix(R, 'rotm2eul', 'R');
seq = robotics.internal.validation.validateEulerSequence(varargin{:});

% The parsed sequence will be in all upper-case letters and validated
coder.varsize('Rcalc', [3 3 Inf], [0 0 1]);
Rcalc = R;
switch seq
    case 'ZYX'
        % Handle Z-Y-X rotation order        
        eul = calculateEulerAngles(Rcalc, seq);

    case 'ZYZ'
        % Handle Z-Y-Z rotation order
        eul = calculateEulerAngles(Rcalc, seq);
end

% Shape output as a series of row vectors
eul2 = reshape(eul,[3, numel(eul)/3]).';

end

function eul = calculateEulerAngles(R, seq)
%calculateEulerAngles Calculate Euler angles from rotation matrix
%   EUL = calculateEulerAngles(R, SEQ) calculates the Euler angles, EUL,
%   corresponding to the input rotation matrix, R. The Euler angles follow
%   the axis order specified in SEQ. 

nextAxis = [2, 3, 1, 2];

% Pre-populate settings for different axis orderings
% Each setting has 4 values:
%   1. firstAxis : The right-most axis of the rotation order. Here, X=1,
%      Y=2, and Z=3.
%   2. repetition : If the first axis and the last axis are equal in
%      the sequence, then repetition = 1; otherwise repetition = 0.
%   3. parity : Parity is 0 if the right two axes in the sequence are
%      YX, ZY, or XZ. Otherwise, parity is 1.
%   4. movingFrame : movingFrame = 1 if the rotations are with
%      reference to a moving frame. Otherwise (in the case of a static
%      frame), movingFrame = 0.
seqSettings.ZYX = [1, 0, 0, 1];
seqSettings.ZYZ = [3, 1, 1, 1];

% Retrieve the settings for a particular axis sequence
setting = seqSettings.(seq);
firstAxis = setting(1);
repetition = setting(2);
parity = setting(3);
movingFrame = setting(4);

% Calculate indices for accessing rotation matrix
i = firstAxis;
j = nextAxis(i+parity);
k = nextAxis(i-parity+1);

if repetition
    % Find special cases of rotation matrix values that correspond to Euler
    % angle singularities.
    sy = sqrt(R(i,j,:).*R(i,j,:) + R(i,k,:).*R(i,k,:));    
    singular = sy < 10 * eps(class(R));
    
    % Calculate Euler angles
    eul = [atan2(R(i,j,:), R(i,k,:)), atan2(sy, R(i,i,:)), atan2(R(j,i,:), -R(k,i,:))];
    
    % Singular matrices need special treatment
    if any(singular)
        eul(:,:,singular) = [atan2(-R(j,k,singular), R(j,j,singular)), ...
            atan2(sy(:,:,singular), R(i,i,singular)), zeros(1,1,sum(singular))];
    end
    
else
    % Find special cases of rotation matrix values that correspond to Euler
    % angle singularities.    
    sy = sqrt(R(i,i,:).*R(i,i,:) + R(j,i,:).*R(j,i,:));    
    singular = sy < 10 * eps(class(R));
    
    % Calculate Euler angles
    eul = [atan2(R(k,j,:), R(k,k,:)), atan2(-R(k,i,:), sy), atan2(R(j,i,:), R(i,i,:))];
    
    % Singular matrices need special treatment
    if any(singular)
        eul(:,:,singular) = [atan2(-R(j,k,singular), R(j,j,singular)), ...
            atan2(-R(k,i,singular), sy(:,:,singular)), zeros(1,1,sum(singular))];
    end    
end

if parity
    % Invert the result
    eul = -eul;
end

if movingFrame
    % Swap the X and Z columns
    eul(:,[1,3],:)=eul(:,[3,1],:);
end

end