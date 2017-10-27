%% Section 3 Problem 
% In this problem, you will make a publication-quality plot commonly found in 
% the transonic aerodynamic shape optimization literature. You will plot pressure 
% coefficient variation ($C_p$) along the surface of the airfoil as well as the 
% airfoil profile on the same plot for both the initial and optimized airfoil 
% configurations.
% 
% 
% 
% The file |pressure_displacement_profiles.mat| contains the airfoil profile 
% and $C_p$ distribution over the airfoil. This file contains two variabes, initial 
% and optimal, which each have three fields: |x, cp, disp |which are vectors defining 
% the $x$ coordinates, $C_p$ profile, and shape profile, respectively. 
% 
% The code in Task 1 shows how to load and plot the pressure coefficient 
% and shape. 
%% Task 1
% Run the starter code and observe what it produces.

% Plot profiles
load pressure_displacement_profiles

% Plot initial -Cp and shape
fig1=figure;
plot(initial.x,-initial.cp,'b-'); hold on;
plot(initial.x,initial.disp,'k-');
legend('cp','disp');

% Plot optimal -Cp and shape
fig2=figure;
plot(optimal.x,-optimal.cp,'b-'); hold on;
plot(optimal.x,optimal.disp,'k-');
legend('cp','disp');

% Save to eps
print(fig1,'-depsc2','Hwk1Prob3_starter1');
print(fig2,'-depsc2','Hwk1Prob3_starter2');
%% Task 2
% Modify the starter code to generate everything in the same plot.
% 
% Several points to keep in mind:
% 
% * Plot the negative of $C_p$ instead of $C_p$ to generate the plots.
% * Use solid lines for the initial $C_p$ and shape profiles and dotted (not 
% dashed) for the optimal $C_p$ and shape profiles. 
% * All lines should be thick (at least linewidth of 2).
% * Generate a legend with the entries "Initial ($C_p$)", "Initial (Shape)","Optimal 
% ($C_p$)", "Optimal (Shape)".
% * Use the y-tick labels for "$-C_p$" from -1.2 to 1 with 0.2 spacing on the 
% left hand side.
% * Use the y-tick labels for "Distance transverse to airfoil" from -0.1 to 
% 0.6 with 0.1 spacing on the right hand side.
% * Label x as "Distance along airfoil" 
% * Write all labels with LATEX interpreter.
%% Checkpoint
% Please answer the following questions and put the answers in the EdX page:
% 
% (A) Which is the correct description of the figure from Task 1? 
% 
% 1. The left plot shows the coefficents only, while the right plot shows 
% the profiles only.
% 
% 2. The left plot shows the initial configuration only, while the right 
% plot shows the optimal configuration only.
% 
% (B) Which plotting function would be best to create the described plot 
% in Task 2?
% 
% (C) Which graphics handle should be modified to increase the linewidth?
% 
% (D) Which graphics handle should be modified to label the axes with the 
% LATEX interpreter?
% 
% (E) Which property should be modified in Task 2 so that it has correct 
% spacing for  "Distance transverse to airfoil" axis? Type in the proper name.
% 
% (F) Which graphics handle should be modified to save the figure in the 
% same format as seen in the MATLAB Figure window?
% 
% (G) Name the function from the MATLAB File Exchange that will fix the dashed 
% lines when the figure is saved to file.
% 
% (H) From the plot in Task 2, which configuration has a bigger cross-section 
% area of the airfoil? Initial or optimal?