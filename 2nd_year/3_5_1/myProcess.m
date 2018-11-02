function myProcess(data,str)
errorbar(data.U_2, data.I_2, data.dI_2, data.dI_2, data.dU_2, data.dU_2);
hold on
make_fancy("V_2 [V]","I_2 [\muA]","Zond's characteristic at I_p = "+str+"mA");
print(['Plot' char(str)],'-dpng', '-r300');
hold off