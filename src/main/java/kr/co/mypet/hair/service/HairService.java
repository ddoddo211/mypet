package kr.co.mypet.hair.service;

import javax.annotation.Resource;

import kr.co.mypet.hair.dao.HairDaoInf;

public class HairService implements HairServiceInf {

		@Resource(name="hairDao")
		private HairDaoInf hairDao;
}
