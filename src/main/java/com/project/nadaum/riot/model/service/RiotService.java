package com.project.nadaum.riot.model.service;

import java.util.Map;

import com.project.nadaum.riot.model.vo.RiotFavo;
import com.project.nadaum.riot.model.vo.Summoner;

public interface RiotService {
	
	int insertSummoner(Summoner summoner);
	
	Summoner selectOneSummoner(String puuid);
	
	int insertRiotFavo(Map<String, Object> map);

}
