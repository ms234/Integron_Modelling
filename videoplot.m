v = VideoWriter('ibM.avi');
open(v);
F(T) = struct('cdata',[],'colormap',[]);
for t = 1:T
time = 1:t+1;
gen1 = sum(sum(Genotypes(:,2,:,:),4),3);
gen2 = sum(sum(Genotypes(:,3,:,:),4),3);
gen3 = sum(sum(Genotypes(:,4,:,:),4),3);
gen4 = sum(sum(Genotypes(:,1,:,:),4),3);
plot(time,gen1(1:t+1),time,gen2(1:t+1),time,gen3(1:t+1),'LineWidth',3);
xlim([0,T]);
box off;
set(gca,'Color',[109, 201, 211]/255)
set(gca,'FontSize',10,'fontWeight','bold')
set(gcf,'Color',[109, 201, 211]/255)
F(t) = getframe(gcf);
writeVideo(v,F(t));
end
close(v)