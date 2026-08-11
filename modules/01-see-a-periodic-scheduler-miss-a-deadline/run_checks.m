function run_checks
a=model(5,1,12,3,0,120);
assert(a.utilization<1,'Baseline utilization should be below one.');
assert(numel(a.timeline)==1200,'Timeline resolution mismatch.');
over=model(5,3,10,6,0,100);
assert(over.utilization>1,'Overloaded case must exceed one.');
assert(any(over.misses>0),'Overloaded schedule should miss deadlines.');
assert(all(ismember(unique(a.timeline),[0 1 2])),'Invalid task identifier.');
disp('P01 checks passed.');
end
