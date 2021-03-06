package com.ana.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.ana.domain.AcmVO;
import com.ana.domain.PaymentVO;

public interface AdminStatsMapper {

	public  List<AcmVO> getAcmRank(@Param("user")String user,@Param("criteria")String criteria );
	public List<PaymentVO> getAllSales(String user);
	public List<AcmVO> getAllAcm(String bizRegisterNumber);
	public List<PaymentVO> getAcmSales(String acmNum);
	public List<PaymentVO> getPeriodAllSales(@Param("user")String user, @Param("start")String start, @Param("end")String end);
	public List<PaymentVO> getPeriodAcmSales(@Param("amcNum")String amcNum, @Param("start")String start, @Param("end")String end);
	

//			@Param("user")String user, @Param("start")String start, @Param("end")String end);
	
	
	/////////
	public List<PaymentVO> getPeriodAllSalesAd(@Param("start")String start, @Param("end")String end);
	public List<PaymentVO> getAllSalesAd();
	public  List<AcmVO> getAcmRankAd(@Param("criteria")String criteria);
	public List<AcmVO> getAllAcmAd();
	
	
	
	
}
