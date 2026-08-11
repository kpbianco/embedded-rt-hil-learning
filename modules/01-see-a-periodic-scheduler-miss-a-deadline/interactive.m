function interactive
fig=uifigure('Name','P01 Real-Time Scheduler','Position',[100 100 1150 720]);
g=uigridlayout(fig,[3 6]); g.RowHeight={'1x','1x',100};
ax=uiaxes(g); ax.Layout.Row=1; ax.Layout.Column=[1 6];
axLoad=uiaxes(g); axLoad.Layout.Row=2; axLoad.Layout.Column=[1 4];
summary=uilabel(g,'WordWrap','on'); summary.Layout.Row=2; summary.Layout.Column=[5 6];

T1=uislider(g,'Limits',[2 20],'Value',5); T1.Layout.Row=3; T1.Layout.Column=1;
C1=uislider(g,'Limits',[0.1 8],'Value',1); C1.Layout.Row=3; C1.Layout.Column=2;
T2=uislider(g,'Limits',[4 40],'Value',12); T2.Layout.Row=3; T2.Layout.Column=3;
C2=uislider(g,'Limits',[0.1 15],'Value',3); C2.Layout.Row=3; C2.Layout.Column=4;
J=uislider(g,'Limits',[0 3],'Value',0); J.Layout.Row=3; J.Layout.Column=5;
H=uislider(g,'Limits',[50 300],'Value',120); H.Layout.Row=3; H.Layout.Column=6;
controls=[T1 C1 T2 C2 J H];
for i=1:numel(controls)
    controls(i).ValueChangingFcn=@(~,~) updatePlots();
    controls(i).ValueChangedFcn=@(~,~) updatePlots();
end
updatePlots();

    function updatePlots
        out=model(T1.Value,C1.Value,T2.Value,C2.Value,J.Value,H.Value);
        cla(ax); stairs(ax,out.time,out.timeline,'LineWidth',1.2);
        grid(ax,'on'); ylim(ax,[-0.2 2.2]); yticks(ax,[0 1 2]);
        yticklabels(ax,{'Idle','Task 1','Task 2'});
        xlabel(ax,'Time (ms)'); title(ax,'Who owns the CPU?');

        cla(axLoad); bar(axLoad,[C1.Value/T1.Value C2.Value/T2.Value out.idle_fraction]);
        xticks(axLoad,1:3); xticklabels(axLoad,{'Task 1 load','Task 2 load','Measured idle'});
        ylabel(axLoad,'Fraction'); grid(axLoad,'on'); title(axLoad,'Load is necessary but not sufficient');

        summary.Text=sprintf(['T1 %.2f, C1 %.2f ms\nT2 %.2f, C2 %.2f ms\n' ...
            'jitter %.2f ms\nutilization %.3f\nmisses [%d %d]'], ...
            T1.Value,C1.Value,T2.Value,C2.Value,J.Value,out.utilization,out.misses(1),out.misses(2));
    end
end
