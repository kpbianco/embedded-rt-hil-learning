%% P01 - See a Periodic Scheduler Miss a Deadline
close all; clc;

%% Baseline
T1=5; C1=1; T2=12; C2=3; jitterMs=0; horizonMs=120;
out = model(T1,C1,T2,C2,jitterMs,horizonMs);

%% Timeline
figure('Name','P01 baseline');
stairs(out.time,out.timeline,'LineWidth',1.2);
grid on; ylim([-0.2 2.2]); yticks([0 1 2]); yticklabels({'Idle','Task 1','Task 2'});
xlabel('Time (ms)'); ylabel('Processor owner');
title(sprintf('Fixed-priority schedule, utilization = %.2f',out.utilization));

%% Sweep 1 - low-priority WCET
c2Values = [2 5 8];
figure('Name','P01 execution-time sweep');
for i=1:numel(c2Values)
    s=model(T1,C1,T2,c2Values(i),0,60);
    subplot(numel(c2Values),1,i);
    stairs(s.time,s.timeline,'LineWidth',1.1); grid on;
    ylim([-0.2 2.2]); yticks([0 1 2]);
    title(sprintf('C2 = %.1f ms, U = %.2f, misses = [%d %d]', ...
        c2Values(i),s.utilization,s.misses(1),s.misses(2)));
end

%% Sweep 2 - release jitter
jitters=[0 0.5 1.5];
fprintf('Jitter sweep:\n');
for i=1:numel(jitters)
    s=model(T1,C1,T2,C2,jitters(i),horizonMs);
    fprintf('  jitter %.1f ms -> misses [%d %d]\n',jitters(i),s.misses(1),s.misses(2));
end

%% Broken case - average utilization alone
broken = model(5,2.4,10,4.8,1.0,200);
figure('Name','P01 broken assumption');
stairs(broken.time,broken.timeline,'LineWidth',1.1); grid on;
ylim([-0.2 2.2]); yticks([0 1 2]); yticklabels({'Idle','Task 1','Task 2'});
xlabel('Time (ms)'); title(sprintf(['Broken claim: U = %.2f looks like the whole story, ' ...
    'but misses = [%d %d]'],broken.utilization,broken.misses(1),broken.misses(2)));

assert(out.utilization < 1,'Baseline should remain below full utilization.');
