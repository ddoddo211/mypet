package kr.co.mypet.hair.service;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import kr.co.mypet.hair.dao.HairDaoInf;

@Service
public class HairService implements HairServiceInf {

		@Resource(name="hairDao")
		private HairDaoInf hairDao;
}
