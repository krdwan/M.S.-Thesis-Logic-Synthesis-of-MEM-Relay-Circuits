module multBase_MEM_mod(A,B,Prod);

	input  [3:0] A,B;
	output [7:0] Prod;

  wire AA_106, AA_120, AA_121, AA_122, AA_123, AA_124, AA_125, AA_126, AA_127, AA_128, 
       AA_129, AA_131, AA_132, AA_134, AA_135, AA_137, AA_138, AA_139, AA_140, AA_141, 
       AA_142, AA_143, AA_144, AA_145, AA_146, AA_147, AA_149, AA_150, AA_151, AA_152, 
       AA_153, AA_154, AA_156, AA_157, AA_158, AA_159, AA_160, AA_161, Prod[0], AA_163, 
       AA_164, AA_165, AA_166, AA_167, AA_168, AA_169, AA_170, AA_171, AA_27, AA_28, 
       AA_32, AA_88, BB_107_30, BB_107_31, BB_107_311, BB_107_3110, BB_107_31101, BB_107_3111, BB_107_31110, BB_107_311101, 
       BB_13_30, BB_13_300, BB_13_3000, BB_13_30001, BB_13_3001, BB_13_30010, BB_13_300101, BB_13_30011, BB_13_301, BB_13_3010, 
       BB_13_30100, BB_13_301001, BB_13_30101, BB_13_301011, BB_13_3011, BB_13_30110, BB_13_301101, BB_13_30111, BB_13_301110, BB_13_301111, 
       BB_13_31, BB_13_310, BB_13_3100, BB_13_31000, BB_13_310001, BB_13_31001, BB_13_310010, BB_13_3101, BB_13_31010, BB_13_310101, 
       BB_13_31011, BB_13_310110, BB_13_310111, BB_13_311, BB_13_3110, BB_13_31100, BB_13_311001, BB_13_31101, BB_13_311010, BB_13_311011, 
       BB_13_3111, BB_13_31110, BB_13_311101, BB_13_31111, BB_13_311110, BB_1_31, BB_38_30, BB_38_300, BB_38_3000, BB_38_30001, 
       BB_38_3001, BB_38_30010, BB_38_30011, BB_38_301, BB_38_3010, BB_38_30100, BB_38_30101, BB_38_3011, BB_38_30110, BB_38_301101, 
       BB_38_30111, BB_38_31, BB_38_310, BB_38_3100, BB_38_31000, BB_38_31001, BB_38_3101, BB_38_31010, BB_38_310101, BB_38_31011, 
       BB_38_310110, BB_38_310111, BB_38_311, BB_38_3110, BB_38_31101, BB_38_311010, BB_38_3111, BB_38_31110, BB_38_311101, BB_38_31111, 
       BB_4_30, BB_4_300, BB_4_301, BB_4_3011, BB_4_31, BB_4_310, BB_4_3101, BB_4_311, BB_4_3111, BB_63_30, 
       BB_63_300, BB_63_3001, BB_63_301, BB_63_3010, BB_63_3011, BB_63_30110, BB_63_30111, BB_63_31, BB_63_310, BB_63_3100, 
       BB_63_31001, BB_63_3101, BB_63_31011, BB_63_310111, BB_63_311, BB_63_3110, BB_63_31101, BB_63_3111, BB_63_31110, BB_63_311101, 
       BB_89_30, BB_89_301, BB_89_3010, BB_89_3011, BB_89_30111, BB_89_301110, BB_89_31, BB_89_310, BB_89_3101, BB_89_31011, 
       BB_89_311, BB_89_3110, BB_89_31101, BB_89_3111, BB_89_31110, Prod[1], Prod[2], Prod[3], Prod[4], Prod[5], 
       Prod[6], Prod[7];

NEMR4T g1(.s(Prod[0]), .d(AA_120), .b(vdd), .g(A[0]));
NEMR4T g2(.s(AA_120), .d(gnd), .b(vdd), .g(B[0]));
NEMR4T g3(.s(AA_120), .d(gnd), .b(gnd), .g(B[0]));
NEMR4T g4(.s(Prod[0]), .d(AA_121), .b(gnd), .g(A[0]));
NEMR4T g5(.s(AA_121), .d(gnd), .b(vdd), .g(B[0]));
NEMR4T g6(.s(AA_121), .d(vdd), .b(gnd), .g(B[0]));
NEMR4T g7(.s(Prod[1]), .d(AA_170), .b(vdd), .g(A[1]));
NEMR4T g8(.s(AA_170), .d(AA_122), .b(vdd), .g(B[1]));
NEMR4T g9(.s(AA_122), .d(AA_120), .b(vdd), .g(A[0]));
NEMR4T g10(.s(AA_122), .d(AA_120), .b(gnd), .g(A[0]));
NEMR4T g11(.s(AA_170), .d(AA_163), .b(gnd), .g(B[1]));
NEMR4T g12(.s(AA_163), .d(AA_120), .b(vdd), .g(A[0]));
NEMR4T g13(.s(AA_163), .d(AA_123), .b(gnd), .g(A[0]));
NEMR4T g14(.s(AA_123), .d(vdd), .b(vdd), .g(B[0]));
NEMR4T g15(.s(AA_123), .d(vdd), .b(gnd), .g(B[0]));
NEMR4T g16(.s(Prod[1]), .d(BB_1_31), .b(gnd), .g(A[1]));
NEMR4T g17(.s(BB_1_31), .d(AA_124), .b(vdd), .g(B[1]));
NEMR4T g18(.s(AA_124), .d(AA_121), .b(vdd), .g(A[0]));
NEMR4T g19(.s(AA_124), .d(AA_121), .b(gnd), .g(A[0]));
NEMR4T g20(.s(BB_1_31), .d(AA_164), .b(gnd), .g(B[1]));
NEMR4T g21(.s(AA_164), .d(AA_121), .b(vdd), .g(A[0]));
NEMR4T g22(.s(AA_164), .d(AA_125), .b(gnd), .g(A[0]));
NEMR4T g23(.s(AA_125), .d(vdd), .b(vdd), .g(B[0]));
NEMR4T g24(.s(AA_125), .d(gnd), .b(gnd), .g(B[0]));
NEMR4T g25(.s(Prod[2]), .d(BB_4_30), .b(vdd), .g(B[2]));
NEMR4T g26(.s(BB_4_30), .d(BB_4_300), .b(vdd), .g(A[2]));
NEMR4T g27(.s(BB_4_300), .d(AA_126), .b(vdd), .g(A[1]));
NEMR4T g28(.s(AA_126), .d(AA_122), .b(vdd), .g(B[1]));
NEMR4T g29(.s(AA_126), .d(AA_122), .b(gnd), .g(B[1]));
NEMR4T g30(.s(BB_4_300), .d(AA_165), .b(gnd), .g(A[1]));
NEMR4T g31(.s(AA_165), .d(AA_122), .b(vdd), .g(B[1]));
NEMR4T g32(.s(AA_165), .d(AA_127), .b(gnd), .g(B[1]));
NEMR4T g33(.s(AA_127), .d(AA_123), .b(vdd), .g(A[0]));
NEMR4T g34(.s(AA_127), .d(AA_125), .b(gnd), .g(A[0]));
NEMR4T g35(.s(BB_4_30), .d(BB_4_301), .b(gnd), .g(A[2]));
NEMR4T g36(.s(BB_4_301), .d(AA_128), .b(vdd), .g(A[1]));
NEMR4T g37(.s(AA_128), .d(AA_124), .b(vdd), .g(B[1]));
NEMR4T g38(.s(AA_128), .d(AA_124), .b(gnd), .g(B[1]));
NEMR4T g39(.s(BB_4_301), .d(BB_4_3011), .b(gnd), .g(A[1]));
NEMR4T g40(.s(BB_4_3011), .d(AA_124), .b(vdd), .g(B[1]));
NEMR4T g41(.s(BB_4_3011), .d(AA_129), .b(gnd), .g(B[1]));
NEMR4T g42(.s(AA_129), .d(AA_125), .b(vdd), .g(A[0]));
NEMR4T g43(.s(AA_129), .d(AA_123), .b(gnd), .g(A[0]));
NEMR4T g44(.s(Prod[2]), .d(BB_4_31), .b(gnd), .g(B[2]));
NEMR4T g45(.s(BB_4_31), .d(BB_4_310), .b(vdd), .g(A[2]));
NEMR4T g46(.s(BB_4_310), .d(AA_131), .b(vdd), .g(A[1]));
NEMR4T g47(.s(AA_131), .d(AA_163), .b(vdd), .g(B[1]));
NEMR4T g48(.s(AA_131), .d(AA_163), .b(gnd), .g(B[1]));
NEMR4T g49(.s(BB_4_310), .d(BB_4_3101), .b(gnd), .g(A[1]));
NEMR4T g50(.s(BB_4_3101), .d(AA_163), .b(vdd), .g(B[1]));
NEMR4T g51(.s(BB_4_3101), .d(AA_132), .b(gnd), .g(B[1]));
NEMR4T g52(.s(AA_132), .d(AA_123), .b(vdd), .g(A[0]));
NEMR4T g53(.s(AA_132), .d(AA_121), .b(gnd), .g(A[0]));
NEMR4T g54(.s(BB_4_31), .d(BB_4_311), .b(gnd), .g(A[2]));
NEMR4T g55(.s(BB_4_311), .d(AA_134), .b(vdd), .g(A[1]));
NEMR4T g56(.s(AA_134), .d(AA_164), .b(vdd), .g(B[1]));
NEMR4T g57(.s(AA_134), .d(AA_164), .b(gnd), .g(B[1]));
NEMR4T g58(.s(BB_4_311), .d(BB_4_3111), .b(gnd), .g(A[1]));
NEMR4T g59(.s(BB_4_3111), .d(AA_164), .b(vdd), .g(B[1]));
NEMR4T g60(.s(BB_4_3111), .d(AA_135), .b(gnd), .g(B[1]));
NEMR4T g61(.s(AA_135), .d(AA_125), .b(vdd), .g(A[0]));
NEMR4T g62(.s(AA_135), .d(AA_120), .b(gnd), .g(A[0]));
NEMR4T g63(.s(Prod[3]), .d(BB_13_30), .b(vdd), .g(A[3]));
NEMR4T g64(.s(BB_13_30), .d(BB_13_300), .b(vdd), .g(B[3]));
NEMR4T g65(.s(BB_13_300), .d(BB_13_3000), .b(vdd), .g(B[2]));
NEMR4T g66(.s(BB_13_3000), .d(AA_171), .b(vdd), .g(A[2]));
NEMR4T g67(.s(AA_171), .d(AA_126), .b(vdd), .g(A[1]));
NEMR4T g68(.s(AA_171), .d(AA_166), .b(gnd), .g(A[1]));
NEMR4T g69(.s(AA_166), .d(AA_122), .b(vdd), .g(B[1]));
NEMR4T g70(.s(AA_166), .d(Prod[0]), .b(gnd), .g(B[1]));
NEMR4T g71(.s(BB_13_3000), .d(BB_13_30001), .b(gnd), .g(A[2]));
NEMR4T g72(.s(BB_13_30001), .d(AA_167), .b(vdd), .g(A[1]));
NEMR4T g73(.s(AA_167), .d(AA_122), .b(vdd), .g(B[1]));
NEMR4T g74(.s(AA_167), .d(AA_137), .b(gnd), .g(B[1]));
NEMR4T g75(.s(AA_137), .d(AA_123), .b(vdd), .g(A[0]));
NEMR4T g76(.s(AA_137), .d(AA_123), .b(gnd), .g(A[0]));
NEMR4T g77(.s(BB_13_30001), .d(AA_168), .b(gnd), .g(A[1]));
NEMR4T g78(.s(AA_168), .d(AA_122), .b(vdd), .g(B[1]));
NEMR4T g79(.s(AA_168), .d(AA_138), .b(gnd), .g(B[1]));
NEMR4T g80(.s(AA_138), .d(AA_125), .b(vdd), .g(A[0]));
NEMR4T g81(.s(AA_138), .d(AA_125), .b(gnd), .g(A[0]));
NEMR4T g82(.s(BB_13_300), .d(BB_13_3001), .b(gnd), .g(B[2]));
NEMR4T g83(.s(BB_13_3001), .d(BB_13_30010), .b(vdd), .g(A[2]));
NEMR4T g84(.s(BB_13_30010), .d(AA_126), .b(vdd), .g(A[1]));
NEMR4T g85(.s(BB_13_30010), .d(BB_13_300101), .b(gnd), .g(A[1]));
NEMR4T g86(.s(BB_13_300101), .d(AA_137), .b(vdd), .g(B[1]));
NEMR4T g87(.s(BB_13_300101), .d(AA_139), .b(gnd), .g(B[1]));
NEMR4T g88(.s(AA_139), .d(AA_123), .b(vdd), .g(A[0]));
NEMR4T g89(.s(AA_139), .d(AA_120), .b(gnd), .g(A[0]));
NEMR4T g90(.s(BB_13_3001), .d(BB_13_30011), .b(gnd), .g(A[2]));
NEMR4T g91(.s(BB_13_30011), .d(AA_140), .b(vdd), .g(A[1]));
NEMR4T g92(.s(AA_140), .d(Prod[0]), .b(vdd), .g(B[1]));
NEMR4T g93(.s(AA_140), .d(AA_127), .b(gnd), .g(B[1]));
NEMR4T g94(.s(BB_13_30011), .d(AA_141), .b(gnd), .g(A[1]));
NEMR4T g95(.s(AA_141), .d(AA_127), .b(vdd), .g(B[1]));
NEMR4T g96(.s(AA_141), .d(AA_164), .b(gnd), .g(B[1]));
NEMR4T g97(.s(BB_13_30), .d(BB_13_301), .b(gnd), .g(B[3]));
NEMR4T g98(.s(BB_13_301), .d(BB_13_3010), .b(vdd), .g(B[2]));
NEMR4T g99(.s(BB_13_3010), .d(BB_13_30100), .b(vdd), .g(A[2]));
NEMR4T g100(.s(BB_13_30100), .d(AA_131), .b(vdd), .g(A[1]));
NEMR4T g101(.s(BB_13_30100), .d(BB_13_301001), .b(gnd), .g(A[1]));
NEMR4T g102(.s(BB_13_301001), .d(AA_163), .b(vdd), .g(B[1]));
NEMR4T g103(.s(BB_13_301001), .d(AA_27), .b(gnd), .g(B[1]));
NEMR4T g104(.s(AA_27), .d(AA_120), .b(vdd), .g(A[0]));
NEMR4T g105(.s(AA_27), .d(AA_125), .b(gnd), .g(A[0]));
NEMR4T g106(.s(BB_13_3010), .d(BB_13_30101), .b(gnd), .g(A[2]));
NEMR4T g107(.s(BB_13_30101), .d(AA_142), .b(vdd), .g(A[1]));
NEMR4T g108(.s(AA_142), .d(AA_163), .b(vdd), .g(B[1]));
NEMR4T g109(.s(AA_142), .d(AA_139), .b(gnd), .g(B[1]));
NEMR4T g110(.s(BB_13_30101), .d(BB_13_301011), .b(gnd), .g(A[1]));
NEMR4T g111(.s(BB_13_301011), .d(AA_163), .b(vdd), .g(B[1]));
NEMR4T g112(.s(BB_13_301011), .d(AA_28), .b(gnd), .g(B[1]));
NEMR4T g113(.s(AA_28), .d(AA_125), .b(vdd), .g(A[0]));
NEMR4T g114(.s(AA_28), .d(AA_121), .b(gnd), .g(A[0]));
NEMR4T g115(.s(BB_13_301), .d(BB_13_3011), .b(gnd), .g(B[2]));
NEMR4T g116(.s(BB_13_3011), .d(BB_13_30110), .b(vdd), .g(A[2]));
NEMR4T g117(.s(BB_13_30110), .d(AA_131), .b(vdd), .g(A[1]));
NEMR4T g118(.s(BB_13_30110), .d(BB_13_301101), .b(gnd), .g(A[1]));
NEMR4T g119(.s(BB_13_301101), .d(AA_139), .b(vdd), .g(B[1]));
NEMR4T g120(.s(BB_13_301101), .d(AA_137), .b(gnd), .g(B[1]));
NEMR4T g121(.s(BB_13_3011), .d(BB_13_30111), .b(gnd), .g(A[2]));
NEMR4T g122(.s(BB_13_30111), .d(BB_13_301110), .b(vdd), .g(A[1]));
NEMR4T g123(.s(BB_13_301110), .d(AA_27), .b(vdd), .g(B[1]));
NEMR4T g124(.s(BB_13_301110), .d(AA_132), .b(gnd), .g(B[1]));
NEMR4T g125(.s(BB_13_30111), .d(BB_13_301111), .b(gnd), .g(A[1]));
NEMR4T g126(.s(BB_13_301111), .d(AA_132), .b(vdd), .g(B[1]));
NEMR4T g127(.s(BB_13_301111), .d(AA_124), .b(gnd), .g(B[1]));
NEMR4T g128(.s(Prod[3]), .d(BB_13_31), .b(gnd), .g(A[3]));
NEMR4T g129(.s(BB_13_31), .d(BB_13_310), .b(vdd), .g(B[3]));
NEMR4T g130(.s(BB_13_310), .d(BB_13_3100), .b(vdd), .g(B[2]));
NEMR4T g131(.s(BB_13_3100), .d(BB_13_31000), .b(vdd), .g(A[2]));
NEMR4T g132(.s(BB_13_31000), .d(AA_128), .b(vdd), .g(A[1]));
NEMR4T g133(.s(BB_13_31000), .d(BB_13_310001), .b(gnd), .g(A[1]));
NEMR4T g134(.s(BB_13_310001), .d(AA_124), .b(vdd), .g(B[1]));
NEMR4T g135(.s(BB_13_310001), .d(AA_32), .b(gnd), .g(B[1]));
NEMR4T g136(.s(AA_32), .d(AA_121), .b(vdd), .g(A[0]));
NEMR4T g137(.s(AA_32), .d(AA_120), .b(gnd), .g(A[0]));
NEMR4T g138(.s(BB_13_3100), .d(BB_13_31001), .b(gnd), .g(A[2]));
NEMR4T g139(.s(BB_13_31001), .d(BB_13_310010), .b(vdd), .g(A[1]));
NEMR4T g140(.s(BB_13_310010), .d(AA_124), .b(vdd), .g(B[1]));
NEMR4T g141(.s(BB_13_310010), .d(AA_138), .b(gnd), .g(B[1]));
NEMR4T g142(.s(BB_13_31001), .d(AA_143), .b(gnd), .g(A[1]));
NEMR4T g143(.s(AA_143), .d(AA_124), .b(vdd), .g(B[1]));
NEMR4T g144(.s(AA_143), .d(AA_137), .b(gnd), .g(B[1]));
NEMR4T g145(.s(BB_13_310), .d(BB_13_3101), .b(gnd), .g(B[2]));
NEMR4T g146(.s(BB_13_3101), .d(BB_13_31010), .b(vdd), .g(A[2]));
NEMR4T g147(.s(BB_13_31010), .d(AA_128), .b(vdd), .g(A[1]));
NEMR4T g148(.s(BB_13_31010), .d(BB_13_310101), .b(gnd), .g(A[1]));
NEMR4T g149(.s(BB_13_310101), .d(AA_138), .b(vdd), .g(B[1]));
NEMR4T g150(.s(BB_13_310101), .d(AA_28), .b(gnd), .g(B[1]));
NEMR4T g151(.s(BB_13_3101), .d(BB_13_31011), .b(gnd), .g(A[2]));
NEMR4T g152(.s(BB_13_31011), .d(BB_13_310110), .b(vdd), .g(A[1]));
NEMR4T g153(.s(BB_13_310110), .d(AA_32), .b(vdd), .g(B[1]));
NEMR4T g154(.s(BB_13_310110), .d(AA_129), .b(gnd), .g(B[1]));
NEMR4T g155(.s(BB_13_31011), .d(BB_13_310111), .b(gnd), .g(A[1]));
NEMR4T g156(.s(BB_13_310111), .d(AA_129), .b(vdd), .g(B[1]));
NEMR4T g157(.s(BB_13_310111), .d(AA_163), .b(gnd), .g(B[1]));
NEMR4T g158(.s(BB_13_31), .d(BB_13_311), .b(gnd), .g(B[3]));
NEMR4T g159(.s(BB_13_311), .d(BB_13_3110), .b(vdd), .g(B[2]));
NEMR4T g160(.s(BB_13_3110), .d(BB_13_31100), .b(vdd), .g(A[2]));
NEMR4T g161(.s(BB_13_31100), .d(AA_134), .b(vdd), .g(A[1]));
NEMR4T g162(.s(BB_13_31100), .d(BB_13_311001), .b(gnd), .g(A[1]));
NEMR4T g163(.s(BB_13_311001), .d(AA_164), .b(vdd), .g(B[1]));
NEMR4T g164(.s(BB_13_311001), .d(AA_144), .b(gnd), .g(B[1]));
NEMR4T g165(.s(AA_144), .d(AA_121), .b(vdd), .g(A[0]));
NEMR4T g166(.s(AA_144), .d(AA_123), .b(gnd), .g(A[0]));
NEMR4T g167(.s(BB_13_3110), .d(BB_13_31101), .b(gnd), .g(A[2]));
NEMR4T g168(.s(BB_13_31101), .d(BB_13_311010), .b(vdd), .g(A[1]));
NEMR4T g169(.s(BB_13_311010), .d(AA_164), .b(vdd), .g(B[1]));
NEMR4T g170(.s(BB_13_311010), .d(AA_28), .b(gnd), .g(B[1]));
NEMR4T g171(.s(BB_13_31101), .d(BB_13_311011), .b(gnd), .g(A[1]));
NEMR4T g172(.s(BB_13_311011), .d(AA_164), .b(vdd), .g(B[1]));
NEMR4T g173(.s(BB_13_311011), .d(AA_139), .b(gnd), .g(B[1]));
NEMR4T g174(.s(BB_13_311), .d(BB_13_3111), .b(gnd), .g(B[2]));
NEMR4T g175(.s(BB_13_3111), .d(BB_13_31110), .b(vdd), .g(A[2]));
NEMR4T g176(.s(BB_13_31110), .d(AA_134), .b(vdd), .g(A[1]));
NEMR4T g177(.s(BB_13_31110), .d(BB_13_311101), .b(gnd), .g(A[1]));
NEMR4T g178(.s(BB_13_311101), .d(AA_28), .b(vdd), .g(B[1]));
NEMR4T g179(.s(BB_13_311101), .d(AA_138), .b(gnd), .g(B[1]));
NEMR4T g180(.s(BB_13_3111), .d(BB_13_31111), .b(gnd), .g(A[2]));
NEMR4T g181(.s(BB_13_31111), .d(BB_13_311110), .b(vdd), .g(A[1]));
NEMR4T g182(.s(BB_13_311110), .d(AA_144), .b(vdd), .g(B[1]));
NEMR4T g183(.s(BB_13_311110), .d(AA_135), .b(gnd), .g(B[1]));
NEMR4T g184(.s(BB_13_31111), .d(AA_145), .b(gnd), .g(A[1]));
NEMR4T g185(.s(AA_145), .d(AA_135), .b(vdd), .g(B[1]));
NEMR4T g186(.s(AA_145), .d(AA_122), .b(gnd), .g(B[1]));
NEMR4T g187(.s(Prod[4]), .d(BB_38_30), .b(vdd), .g(A[3]));
NEMR4T g188(.s(BB_38_30), .d(BB_38_300), .b(vdd), .g(B[3]));
NEMR4T g189(.s(BB_38_300), .d(BB_38_3000), .b(vdd), .g(B[2]));
NEMR4T g190(.s(BB_38_3000), .d(AA_146), .b(vdd), .g(A[2]));
NEMR4T g191(.s(AA_146), .d(AA_126), .b(vdd), .g(A[1]));
NEMR4T g192(.s(AA_146), .d(AA_126), .b(gnd), .g(A[1]));
NEMR4T g193(.s(BB_38_3000), .d(BB_38_30001), .b(gnd), .g(A[2]));
NEMR4T g194(.s(BB_38_30001), .d(AA_126), .b(vdd), .g(A[1]));
NEMR4T g195(.s(BB_38_30001), .d(AA_147), .b(gnd), .g(A[1]));
NEMR4T g196(.s(AA_147), .d(AA_122), .b(vdd), .g(B[1]));
NEMR4T g197(.s(AA_147), .d(AA_124), .b(gnd), .g(B[1]));
NEMR4T g198(.s(BB_38_300), .d(BB_38_3001), .b(gnd), .g(B[2]));
NEMR4T g199(.s(BB_38_3001), .d(BB_38_30010), .b(vdd), .g(A[2]));
NEMR4T g200(.s(BB_38_30010), .d(AA_126), .b(vdd), .g(A[1]));
NEMR4T g201(.s(BB_38_30010), .d(AA_170), .b(gnd), .g(A[1]));
NEMR4T g202(.s(BB_38_3001), .d(BB_38_30011), .b(gnd), .g(A[2]));
NEMR4T g203(.s(BB_38_30011), .d(AA_149), .b(vdd), .g(A[1]));
NEMR4T g204(.s(AA_149), .d(AA_137), .b(vdd), .g(B[1]));
NEMR4T g205(.s(AA_149), .d(AA_127), .b(gnd), .g(B[1]));
NEMR4T g206(.s(BB_38_30011), .d(AA_150), .b(gnd), .g(A[1]));
NEMR4T g207(.s(AA_150), .d(AA_127), .b(vdd), .g(B[1]));
NEMR4T g208(.s(AA_150), .d(Prod[0]), .b(gnd), .g(B[1]));
NEMR4T g209(.s(BB_38_30), .d(BB_38_301), .b(gnd), .g(B[3]));
NEMR4T g210(.s(BB_38_301), .d(BB_38_3010), .b(vdd), .g(B[2]));
NEMR4T g211(.s(BB_38_3010), .d(BB_38_30100), .b(vdd), .g(A[2]));
NEMR4T g212(.s(BB_38_30100), .d(AA_126), .b(vdd), .g(A[1]));
NEMR4T g213(.s(BB_38_30100), .d(AA_149), .b(gnd), .g(A[1]));
NEMR4T g214(.s(BB_38_3010), .d(BB_38_30101), .b(gnd), .g(A[2]));
NEMR4T g215(.s(BB_38_30101), .d(AA_170), .b(vdd), .g(A[1]));
NEMR4T g216(.s(BB_38_30101), .d(AA_151), .b(gnd), .g(A[1]));
NEMR4T g217(.s(AA_151), .d(AA_137), .b(vdd), .g(B[1]));
NEMR4T g218(.s(AA_151), .d(AA_135), .b(gnd), .g(B[1]));
NEMR4T g219(.s(BB_38_301), .d(BB_38_3011), .b(gnd), .g(B[2]));
NEMR4T g220(.s(BB_38_3011), .d(BB_38_30110), .b(vdd), .g(A[2]));
NEMR4T g221(.s(BB_38_30110), .d(AA_126), .b(vdd), .g(A[1]));
NEMR4T g222(.s(BB_38_30110), .d(BB_38_301101), .b(gnd), .g(A[1]));
NEMR4T g223(.s(BB_38_301101), .d(AA_139), .b(vdd), .g(B[1]));
NEMR4T g224(.s(BB_38_301101), .d(AA_139), .b(gnd), .g(B[1]));
NEMR4T g225(.s(BB_38_3011), .d(BB_38_30111), .b(gnd), .g(A[2]));
NEMR4T g226(.s(BB_38_30111), .d(AA_152), .b(vdd), .g(A[1]));
NEMR4T g227(.s(AA_152), .d(AA_127), .b(vdd), .g(B[1]));
NEMR4T g228(.s(AA_152), .d(AA_139), .b(gnd), .g(B[1]));
NEMR4T g229(.s(BB_38_30111), .d(AA_142), .b(gnd), .g(A[1]));
NEMR4T g230(.s(Prod[4]), .d(BB_38_31), .b(gnd), .g(A[3]));
NEMR4T g231(.s(BB_38_31), .d(BB_38_310), .b(vdd), .g(B[3]));
NEMR4T g232(.s(BB_38_310), .d(BB_38_3100), .b(vdd), .g(B[2]));
NEMR4T g233(.s(BB_38_3100), .d(BB_38_31000), .b(vdd), .g(A[2]));
NEMR4T g234(.s(BB_38_31000), .d(AA_167), .b(vdd), .g(A[1]));
NEMR4T g235(.s(BB_38_31000), .d(AA_165), .b(gnd), .g(A[1]));
NEMR4T g236(.s(BB_38_3100), .d(BB_38_31001), .b(gnd), .g(A[2]));
NEMR4T g237(.s(BB_38_31001), .d(AA_168), .b(vdd), .g(A[1]));
NEMR4T g238(.s(BB_38_31001), .d(AA_168), .b(gnd), .g(A[1]));
NEMR4T g239(.s(BB_38_310), .d(BB_38_3101), .b(gnd), .g(B[2]));
NEMR4T g240(.s(BB_38_3101), .d(BB_38_31010), .b(vdd), .g(A[2]));
NEMR4T g241(.s(BB_38_31010), .d(AA_167), .b(vdd), .g(A[1]));
NEMR4T g242(.s(BB_38_31010), .d(BB_38_310101), .b(gnd), .g(A[1]));
NEMR4T g243(.s(BB_38_310101), .d(AA_124), .b(vdd), .g(B[1]));
NEMR4T g244(.s(BB_38_310101), .d(AA_135), .b(gnd), .g(B[1]));
NEMR4T g245(.s(BB_38_3101), .d(BB_38_31011), .b(gnd), .g(A[2]));
NEMR4T g246(.s(BB_38_31011), .d(BB_38_310110), .b(vdd), .g(A[1]));
NEMR4T g247(.s(BB_38_310110), .d(AA_127), .b(vdd), .g(B[1]));
NEMR4T g248(.s(BB_38_310110), .d(AA_124), .b(gnd), .g(B[1]));
NEMR4T g249(.s(BB_38_31011), .d(BB_38_310111), .b(gnd), .g(A[1]));
NEMR4T g250(.s(BB_38_310111), .d(AA_138), .b(vdd), .g(B[1]));
NEMR4T g251(.s(BB_38_310111), .d(AA_138), .b(gnd), .g(B[1]));
NEMR4T g252(.s(BB_38_31), .d(BB_38_311), .b(gnd), .g(B[3]));
NEMR4T g253(.s(BB_38_311), .d(BB_38_3110), .b(vdd), .g(B[2]));
NEMR4T g254(.s(BB_38_3110), .d(AA_153), .b(vdd), .g(A[2]));
NEMR4T g255(.s(AA_153), .d(AA_140), .b(vdd), .g(A[1]));
NEMR4T g256(.s(AA_153), .d(AA_150), .b(gnd), .g(A[1]));
NEMR4T g257(.s(BB_38_3110), .d(BB_38_31101), .b(gnd), .g(A[2]));
NEMR4T g258(.s(BB_38_31101), .d(BB_38_311010), .b(vdd), .g(A[1]));
NEMR4T g259(.s(BB_38_311010), .d(Prod[0]), .b(vdd), .g(B[1]));
NEMR4T g260(.s(BB_38_311010), .d(AA_135), .b(gnd), .g(B[1]));
NEMR4T g261(.s(BB_38_31101), .d(AA_141), .b(gnd), .g(A[1]));
NEMR4T g262(.s(BB_38_311), .d(BB_38_3111), .b(gnd), .g(B[2]));
NEMR4T g263(.s(BB_38_3111), .d(BB_38_31110), .b(vdd), .g(A[2]));
NEMR4T g264(.s(BB_38_31110), .d(AA_140), .b(vdd), .g(A[1]));
NEMR4T g265(.s(BB_38_31110), .d(BB_38_311101), .b(gnd), .g(A[1]));
NEMR4T g266(.s(BB_38_311101), .d(AA_135), .b(vdd), .g(B[1]));
NEMR4T g267(.s(BB_38_311101), .d(AA_164), .b(gnd), .g(B[1]));
NEMR4T g268(.s(BB_38_3111), .d(BB_38_31111), .b(gnd), .g(A[2]));
NEMR4T g269(.s(BB_38_31111), .d(AA_141), .b(vdd), .g(A[1]));
NEMR4T g270(.s(BB_38_31111), .d(AA_134), .b(gnd), .g(A[1]));
NEMR4T g271(.s(Prod[5]), .d(BB_63_30), .b(vdd), .g(A[3]));
NEMR4T g272(.s(BB_63_30), .d(BB_63_300), .b(vdd), .g(B[3]));
NEMR4T g273(.s(BB_63_300), .d(AA_154), .b(vdd), .g(B[2]));
NEMR4T g274(.s(AA_154), .d(AA_146), .b(vdd), .g(A[2]));
NEMR4T g275(.s(AA_154), .d(AA_146), .b(gnd), .g(A[2]));
NEMR4T g276(.s(BB_63_300), .d(BB_63_3001), .b(gnd), .g(B[2]));
NEMR4T g277(.s(BB_63_3001), .d(AA_146), .b(vdd), .g(A[2]));
NEMR4T g278(.s(BB_63_3001), .d(AA_169), .b(gnd), .g(A[2]));
NEMR4T g279(.s(AA_169), .d(AA_166), .b(vdd), .g(A[1]));
NEMR4T g280(.s(AA_169), .d(AA_156), .b(gnd), .g(A[1]));
NEMR4T g281(.s(AA_156), .d(Prod[0]), .b(vdd), .g(B[1]));
NEMR4T g282(.s(AA_156), .d(AA_137), .b(gnd), .g(B[1]));
NEMR4T g283(.s(BB_63_30), .d(BB_63_301), .b(gnd), .g(B[3]));
NEMR4T g284(.s(BB_63_301), .d(BB_63_3010), .b(vdd), .g(B[2]));
NEMR4T g285(.s(BB_63_3010), .d(AA_171), .b(vdd), .g(A[2]));
NEMR4T g286(.s(BB_63_3010), .d(AA_88), .b(gnd), .g(A[2]));
NEMR4T g287(.s(AA_88), .d(AA_157), .b(vdd), .g(A[1]));
NEMR4T g288(.s(AA_157), .d(AA_137), .b(vdd), .g(B[1]));
NEMR4T g289(.s(AA_157), .d(AA_137), .b(gnd), .g(B[1]));
NEMR4T g290(.s(AA_88), .d(AA_151), .b(gnd), .g(A[1]));
NEMR4T g291(.s(BB_63_301), .d(BB_63_3011), .b(gnd), .g(B[2]));
NEMR4T g292(.s(BB_63_3011), .d(BB_63_30110), .b(vdd), .g(A[2]));
NEMR4T g293(.s(BB_63_30110), .d(AA_126), .b(vdd), .g(A[1]));
NEMR4T g294(.s(BB_63_30110), .d(AA_131), .b(gnd), .g(A[1]));
NEMR4T g295(.s(BB_63_3011), .d(BB_63_30111), .b(gnd), .g(A[2]));
NEMR4T g296(.s(BB_63_30111), .d(AA_152), .b(vdd), .g(A[1]));
NEMR4T g297(.s(BB_63_30111), .d(AA_170), .b(gnd), .g(A[1]));
NEMR4T g298(.s(Prod[5]), .d(BB_63_31), .b(gnd), .g(A[3]));
NEMR4T g299(.s(BB_63_31), .d(BB_63_310), .b(vdd), .g(B[3]));
NEMR4T g300(.s(BB_63_310), .d(BB_63_3100), .b(vdd), .g(B[2]));
NEMR4T g301(.s(BB_63_3100), .d(AA_171), .b(vdd), .g(A[2]));
NEMR4T g302(.s(BB_63_3100), .d(BB_63_31001), .b(gnd), .g(A[2]));
NEMR4T g303(.s(BB_63_31001), .d(AA_147), .b(vdd), .g(A[1]));
NEMR4T g304(.s(BB_63_31001), .d(AA_147), .b(gnd), .g(A[1]));
NEMR4T g305(.s(BB_63_310), .d(BB_63_3101), .b(gnd), .g(B[2]));
NEMR4T g306(.s(BB_63_3101), .d(AA_88), .b(vdd), .g(A[2]));
NEMR4T g307(.s(BB_63_3101), .d(BB_63_31011), .b(gnd), .g(A[2]));
NEMR4T g308(.s(BB_63_31011), .d(AA_158), .b(vdd), .g(A[1]));
NEMR4T g309(.s(AA_158), .d(AA_127), .b(vdd), .g(B[1]));
NEMR4T g310(.s(AA_158), .d(AA_122), .b(gnd), .g(B[1]));
NEMR4T g311(.s(BB_63_31011), .d(BB_63_310111), .b(gnd), .g(A[1]));
NEMR4T g312(.s(BB_63_310111), .d(AA_138), .b(vdd), .g(B[1]));
NEMR4T g313(.s(BB_63_310111), .d(AA_124), .b(gnd), .g(B[1]));
NEMR4T g314(.s(BB_63_31), .d(BB_63_311), .b(gnd), .g(B[3]));
NEMR4T g315(.s(BB_63_311), .d(BB_63_3110), .b(vdd), .g(B[2]));
NEMR4T g316(.s(BB_63_3110), .d(AA_169), .b(vdd), .g(A[2]));
NEMR4T g317(.s(BB_63_3110), .d(BB_63_31101), .b(gnd), .g(A[2]));
NEMR4T g318(.s(BB_63_31101), .d(AA_151), .b(vdd), .g(A[1]));
NEMR4T g319(.s(BB_63_31101), .d(AA_150), .b(gnd), .g(A[1]));
NEMR4T g320(.s(BB_63_311), .d(BB_63_3111), .b(gnd), .g(B[2]));
NEMR4T g321(.s(BB_63_3111), .d(BB_63_31110), .b(vdd), .g(A[2]));
NEMR4T g322(.s(BB_63_31110), .d(AA_149), .b(vdd), .g(A[1]));
NEMR4T g323(.s(BB_63_31110), .d(BB_63_311101), .b(gnd), .g(A[1]));
NEMR4T g324(.s(BB_63_311101), .d(AA_135), .b(vdd), .g(B[1]));
NEMR4T g325(.s(BB_63_311101), .d(Prod[0]), .b(gnd), .g(B[1]));
NEMR4T g326(.s(BB_63_3111), .d(AA_153), .b(gnd), .g(A[2]));
NEMR4T g327(.s(Prod[6]), .d(BB_89_30), .b(vdd), .g(A[3]));
NEMR4T g328(.s(BB_89_30), .d(AA_159), .b(vdd), .g(B[3]));
NEMR4T g329(.s(AA_159), .d(AA_154), .b(vdd), .g(B[2]));
NEMR4T g330(.s(AA_159), .d(AA_154), .b(gnd), .g(B[2]));
NEMR4T g331(.s(BB_89_30), .d(BB_89_301), .b(gnd), .g(B[3]));
NEMR4T g332(.s(BB_89_301), .d(BB_89_3010), .b(vdd), .g(B[2]));
NEMR4T g333(.s(BB_89_3010), .d(AA_146), .b(vdd), .g(A[2]));
NEMR4T g334(.s(BB_89_3010), .d(AA_106), .b(gnd), .g(A[2]));
NEMR4T g335(.s(AA_106), .d(AA_126), .b(vdd), .g(A[1]));
NEMR4T g336(.s(AA_106), .d(AA_160), .b(gnd), .g(A[1]));
NEMR4T g337(.s(AA_160), .d(AA_122), .b(vdd), .g(B[1]));
NEMR4T g338(.s(AA_160), .d(AA_144), .b(gnd), .g(B[1]));
NEMR4T g339(.s(BB_89_301), .d(BB_89_3011), .b(gnd), .g(B[2]));
NEMR4T g340(.s(BB_89_3011), .d(AA_146), .b(vdd), .g(A[2]));
NEMR4T g341(.s(BB_89_3011), .d(BB_89_30111), .b(gnd), .g(A[2]));
NEMR4T g342(.s(BB_89_30111), .d(BB_89_301110), .b(vdd), .g(A[1]));
NEMR4T g343(.s(BB_89_301110), .d(Prod[0]), .b(vdd), .g(B[1]));
NEMR4T g344(.s(BB_89_301110), .d(AA_163), .b(gnd), .g(B[1]));
NEMR4T g345(.s(BB_89_30111), .d(AA_157), .b(gnd), .g(A[1]));
NEMR4T g346(.s(Prod[6]), .d(BB_89_31), .b(gnd), .g(A[3]));
NEMR4T g347(.s(BB_89_31), .d(BB_89_310), .b(vdd), .g(B[3]));
NEMR4T g348(.s(BB_89_310), .d(AA_154), .b(vdd), .g(B[2]));
NEMR4T g349(.s(BB_89_310), .d(BB_89_3101), .b(gnd), .g(B[2]));
NEMR4T g350(.s(BB_89_3101), .d(AA_106), .b(vdd), .g(A[2]));
NEMR4T g351(.s(BB_89_3101), .d(BB_89_31011), .b(gnd), .g(A[2]));
NEMR4T g352(.s(BB_89_31011), .d(AA_156), .b(vdd), .g(A[1]));
NEMR4T g353(.s(BB_89_31011), .d(AA_143), .b(gnd), .g(A[1]));
NEMR4T g354(.s(BB_89_31), .d(BB_89_311), .b(gnd), .g(B[3]));
NEMR4T g355(.s(BB_89_311), .d(BB_89_3110), .b(vdd), .g(B[2]));
NEMR4T g356(.s(BB_89_3110), .d(AA_161), .b(vdd), .g(A[2]));
NEMR4T g357(.s(AA_161), .d(AA_157), .b(vdd), .g(A[1]));
NEMR4T g358(.s(AA_161), .d(AA_157), .b(gnd), .g(A[1]));
NEMR4T g359(.s(BB_89_3110), .d(BB_89_31101), .b(gnd), .g(A[2]));
NEMR4T g360(.s(BB_89_31101), .d(AA_151), .b(vdd), .g(A[1]));
NEMR4T g361(.s(BB_89_31101), .d(AA_158), .b(gnd), .g(A[1]));
NEMR4T g362(.s(BB_89_311), .d(BB_89_3111), .b(gnd), .g(B[2]));
NEMR4T g363(.s(BB_89_3111), .d(BB_89_31110), .b(vdd), .g(A[2]));
NEMR4T g364(.s(BB_89_31110), .d(AA_149), .b(vdd), .g(A[1]));
NEMR4T g365(.s(BB_89_31110), .d(AA_145), .b(gnd), .g(A[1]));
NEMR4T g366(.s(BB_89_3111), .d(AA_169), .b(gnd), .g(A[2]));
NEMR4T g367(.s(Prod[7]), .d(BB_107_30), .b(vdd), .g(A[3]));
NEMR4T g368(.s(BB_107_30), .d(AA_159), .b(vdd), .g(B[3]));
NEMR4T g369(.s(BB_107_30), .d(AA_159), .b(gnd), .g(B[3]));
NEMR4T g370(.s(Prod[7]), .d(BB_107_31), .b(gnd), .g(A[3]));
NEMR4T g371(.s(BB_107_31), .d(AA_159), .b(vdd), .g(B[3]));
NEMR4T g372(.s(BB_107_31), .d(BB_107_311), .b(gnd), .g(B[3]));
NEMR4T g373(.s(BB_107_311), .d(BB_107_3110), .b(vdd), .g(B[2]));
NEMR4T g374(.s(BB_107_3110), .d(AA_146), .b(vdd), .g(A[2]));
NEMR4T g375(.s(BB_107_3110), .d(BB_107_31101), .b(gnd), .g(A[2]));
NEMR4T g376(.s(BB_107_31101), .d(AA_160), .b(vdd), .g(A[1]));
NEMR4T g377(.s(BB_107_31101), .d(AA_156), .b(gnd), .g(A[1]));
NEMR4T g378(.s(BB_107_311), .d(BB_107_3111), .b(gnd), .g(B[2]));
NEMR4T g379(.s(BB_107_3111), .d(BB_107_31110), .b(vdd), .g(A[2]));
NEMR4T g380(.s(BB_107_31110), .d(AA_166), .b(vdd), .g(A[1]));
NEMR4T g381(.s(BB_107_31110), .d(BB_107_311101), .b(gnd), .g(A[1]));
NEMR4T g382(.s(BB_107_311101), .d(AA_144), .b(vdd), .g(B[1]));
NEMR4T g383(.s(BB_107_311101), .d(AA_137), .b(gnd), .g(B[1]));
NEMR4T g384(.s(BB_107_3111), .d(AA_161), .b(gnd), .g(A[2]));

endmodule