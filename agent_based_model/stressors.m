T = 1e3; % Length of simulation
sigma_m = 2e-1; % average fraction of time that a stressor is present
sigma_v = 1e-2; % average rate of switches between presence and absence
M = sigma_v / 2 * [1 - (1/(1-sigma_m)),1/(1-sigma_m);1/sigma_m, 1 - 1/sigma_m]; % transition matrix
lam = zeros(1,3); % initialise rates at which stressors change
lam_prob = zeros(1,3); % probabilities that 1 of the three stressors change
StressArr = zeros(T, nStressors);
t_change = [];
for t = 1:T
     for i = 1:nStressors
      r = rand(1); 
               if StressArr(t,i) == 0
                   lam(i) = M(1,2);
               else
                  lam(i) = M(2,1); 
               end             
                if r<lam(i)
                   StressArr(t+1,i) = mod(StressArr(t,i)+1,2); % stressor changes if probability is greater than a random number
                else
                    StressArr(t+1,i) = StressArr(t,i); % stressor remains the same
                end
     end
end
 t =1;
while t <T-1
    temp =1;
    while StressArr(t+1,:) == StressArr(t,:) & t < T
        temp = temp +1;
        t = t + 1;
    end
    t_change = [t_change, temp];
    t = t+1;
end
sum(t_change)
t_change = [t_change, T]; %put the last change 'out of bound' -> help with ODE code

figure(3)
clf
%subplot(8+1,2,[1 2])
subplot(3,1,1) 
imagesc(StressArr')
colorbar
title('Stressors')