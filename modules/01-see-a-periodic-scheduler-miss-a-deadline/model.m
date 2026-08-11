function out = model(T1,C1,T2,C2,jitterMs,horizonMs)
%MODEL Two-task fixed-priority preemptive scheduler at 0.1 ms resolution.
arguments
    T1 (1,1) double {mustBePositive} = 5
    C1 (1,1) double {mustBeNonnegative} = 1
    T2 (1,1) double {mustBePositive} = 12
    C2 (1,1) double {mustBeNonnegative} = 3
    jitterMs (1,1) double {mustBeNonnegative} = 0
    horizonMs (1,1) double {mustBePositive} = 120
end
dt = 0.1;
ticks = round(horizonMs/dt);
period = max(1,round([T1 T2]/dt));
execution = max(0,round([C1 C2]/dt));
jitterTicks = round(jitterMs/dt);
remaining = [0 0];
deadline = [inf inf];
releaseIndex = [0 0];
timeline = zeros(1,ticks);
misses = [0 0];
releases = [0 0];
for tick = 1:ticks
    for task = 1:2
        baseRelease = (releaseIndex(task))*period(task)+1;
        signedJitter = round(jitterTicks*sin(0.73*releaseIndex(task)+task));
        releaseTick = max(1,baseRelease+signedJitter);
        if tick >= releaseTick
            if remaining(task) > 0
                misses(task) = misses(task)+1;
            end
            remaining(task) = remaining(task)+execution(task);
            deadline(task) = tick+period(task);
            releases(task) = releases(task)+1;
            releaseIndex(task) = releaseIndex(task)+1;
        end
        if tick >= deadline(task) && remaining(task) > 0
            misses(task) = misses(task)+1;
            deadline(task) = inf;
        end
    end
    if remaining(1) > 0
        active = 1;
    elseif remaining(2) > 0
        active = 2;
    else
        active = 0;
    end
    timeline(tick) = active;
    if active > 0
        remaining(active) = remaining(active)-1;
    end
end
out = struct();
out.time = (0:ticks-1)*dt;
out.timeline = timeline;
out.misses = misses;
out.releases = releases;
out.utilization = C1/T1 + C2/T2;
out.idle_fraction = mean(timeline==0);
out.dt = dt;
end
