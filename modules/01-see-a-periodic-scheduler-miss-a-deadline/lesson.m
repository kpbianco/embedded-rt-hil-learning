%% P01 - See a Periodic Scheduler Miss a Deadline
% Guiding question:
% When does logically correct software become physically late?
%
% Mental model:
% A real-time system is correct only when the right computation finishes before the physical deadline. Priority, execution time, and release timing compete on one processor.

%% Read the baseline lesson
disp('When does logically correct software become physically late?');
disp('A real-time system is correct only when the right computation finishes before the physical deadline. Priority, execution time, and release timing compete on one processor.');

%% Run the deterministic experiment
experiment;

%% Open the live lever panel
% Move one control at a time and connect the visible change to the model.
interactive;
