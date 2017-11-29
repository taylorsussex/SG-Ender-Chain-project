function data = OptimiseTradeoff(filename)

[dmg,mtr,opp_mtr] = GetDigraphs(filename);

data = ProcessDigraphs(dmg,mtr,opp_mtr);

data = ProcessData(data);