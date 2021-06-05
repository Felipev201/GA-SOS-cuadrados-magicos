%%
clear
%-------------------------------------------------------------------------
%-------------------------------------------------------------------------
%-------------------------------------------------------------------------
%----------------------------- SOS algorithm -----------------------------
%-------------------------------------------------------------------------
%-------------------------------------------------------------------------
%-------------------------------------------------------------------------
npob=500;        % numero de población


nvar=15;         % numero de variables
ittot=10000;     % iteraciones totales
lb=2*ones(1,nvar);      % lower bound
ub=50*ones(1,nvar);

% inicialización de variables
graf=10;
fita=zeros(ittot/graf,1);
ind=1;
fit=zeros(npob,1);

% población inicial
xt = randi(ub(1),npob,nvar);

% --------------------------------fitness
tic
for itin=1:npob
    fit(itin)=fitness_multi_55(xt(itin,:));
end

% Encuentra el mejor fitness
ibest=find(fit==min(fit));
ibest=ibest(1);


%for iter=0:ittot
iter = 0;
% min(fit)>1e-2 &&
while min(fit)>1 && iter<ittot+1
    ct1=0;  % contador para saber si se cambio algun fitnes
for it=1:npob
%------------------------------ Mutualismo -------------------------------
% se elige al organismo aleatorio con el que se hara el mutualismo
jt=randi(npob-1);
jt=jt+(jt>=it);

% Mutual vector
mv=(xt(it,:)+xt(jt,:))/2;

% vector Bf
bf=randi(2,[2,1]);

% nuevos individuos
xin=round(xt(it,:) + rand(1,nvar).*(xt(ibest,:)-mv*bf(1)));
xjn=round(xt(jt,:) + rand(1,nvar).*(xt(ibest,:)-mv*bf(2)));
ut=round(rand(1,nvar).*(ub-lb) + lb);
xin(xin>ub)=ut(xin>ub); xin(xin<lb)=ut(xin<lb);
xjn(xjn>ub)=ut(xjn>ub); xjn(xjn<lb)=ut(xjn<lb);
% xin(xin>ub)=ub(xin>ub); xin(xin<lb)=lb(xin<lb);
% xjn(xjn>ub)=ub(xjn>ub); xjn(xjn<lb)=lb(xjn<lb);

% evalua fitnes de x antiguas
fiti=fitness_multi_55(xt(it,:));
fitj=fitness_multi_55(xt(jt,:));

% evalua fitnes de x nuevas
fitin=fitness_multi_55(xin);
fitjn=fitness_multi_55(xjn);

% reemplazo
if fitin<fiti
    xt(it,:)=xin;
    ct1=1;
end
if fitjn<fitj
    xt(jt,:)=xjn;
    ct1=1;
end

%------------------------- Comensalismo --------------------------------
% se elige al organismo aleatorio con el que se hara el comensalismo
jt=randi(npob-1);
jt=jt+(jt>=it);

% nuevo individuo
xin=round(xt(it,:) + (2*rand(1,nvar)-1).*(xt(ibest,:)-xt(jt,:)));
ut=round(rand(1,nvar).*(ub-lb) + lb);
xin(xin>ub)=ut(xin>ub); xin(xin<lb)=ut(xin<lb);
% xin(xin>ub)=ub(xin>ub); xin(xin<lb)=lb(xin<lb);

% evalua fitnes de x antiguas
fiti=fitness_multi_55(xt(it,:));

% evalua fitnes de x nuevas
fitin=fitness_multi_55(xin);

% reemplazo
if fitin<fiti
    xt(it,:)=xin;
    ct1=1;
end

%----------------------- Parasitismo -----------------------------------
% se elige al organismo aleatorio al que se le inyectrá el parásito
jt=randi(npob-1);
jt=jt+(jt>=it);

% elige el número de dimensiones a modificar del vector parásito
nd=randi(nvar);
% elige cuales dimensiones va a cambiar
cd=randperm(nvar);
cd=cd(1:nd);

% vector parasito
xp=xt(it,:);
xp(cd)=round(rand(1,nd).*(ub(cd)-lb(cd))+lb(cd));

% evalua fitnes de x host
fitj=fitness_multi_55(xt(jt,:));

% evalua fitnes de x parasito
fitp=fitness_multi_55(xp);

% reemplazo
if fitp<fitj
    xt(jt,:)=xp;
    ct1=1;
end
end
% Entra a este if solo si se cambio alguna poblacion
if ct1==1
    % Evalua fitness total
    for itin=1:npob
        fit(itin)=fitness_multi_55(xt(itin,:));
    end

    % Encuentra el mejor fitness
    ibest=find(fit==min(fit));
    ibest=ibest(1);
end


if mod(iter,graf)==0
    % Fitness acumulado
    fita(ind)=min(fit);
    ind=ind+1;
end
iter = iter + 1;
end
toc

index = find(fit==min(fit));
index = index(1);
fit_f=fit(index);   
xt_f=xt(index,:);   

xt_f
fit_f