function [] = cyclecolor(hObject,eventdata)

fig = ancestor(hObject,'figure');

cmap = get(fig,'colormap');
myhan = guidata(fig);
if ~isempty(myhan)
    myhan.numclick=myhan.numclick+50;
    myhan.numclick=mod(myhan.numclick,size(cmap,1));
else
    myhan = guihandles(fig);
    myhan.numclick=1;
end
set(hObject,'color',cmap(myhan.numclick,:));
guidata(fig,myhan) 

end