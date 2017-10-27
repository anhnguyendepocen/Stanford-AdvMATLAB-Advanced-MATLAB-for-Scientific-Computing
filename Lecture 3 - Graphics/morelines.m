function [] = morelines(hObject,eventdata)

x = get(hObject,'LevelList');
xnew = linspace(x(1),x(end),length(x)+1);
set(hObject,'LevelList',xnew);

end