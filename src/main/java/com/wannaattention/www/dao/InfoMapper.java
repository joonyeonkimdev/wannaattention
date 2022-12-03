package com.wannaattention.www.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Select;

import com.wannaattention.www.vo.Facility;

public interface InfoMapper {

	@Select({"<script>",
			"SELECT NAME, PG_SCALE, ADDRESS, OFFICE_HOURS, TEL, PG_BIG_POSSIBLE FROM FACILITY_TB",
			"<if test='region == 0'> </if>",
			"<if test='region == 1'> WHERE ADDRESS LIKE '서울%'</if>",
			"<if test='region == 2'> WHERE ADDRESS LIKE '경기%'</if>",
			"<if test='region == 3'> WHERE ADDRESS LIKE '인천%'</if>",
			"<if test='region == 4'> WHERE ADDRESS LIKE '세종%'</if>",
			"<if test='region == 5'> WHERE ADDRESS LIKE '대전%'</if>",
			"<if test='region == 6'> WHERE ADDRESS LIKE '대구%'</if>",
			"<if test='region == 7'> WHERE ADDRESS LIKE '울산%'</if>",
			"<if test='region == 8'> WHERE ADDRESS LIKE '부산%'</if>",
			"<if test='region == 9'> WHERE ADDRESS LIKE '광주%'</if>",
			"<if test='region == 10'> WHERE ADDRESS LIKE '제주%'</if>",
			"<if test='region == 11'> WHERE ADDRESS LIKE '강원%'</if>",
			"<if test='region == 12'> WHERE ADDRESS LIKE '충북%'</if>",
			"<if test='region == 13'> WHERE ADDRESS LIKE '충남%'</if>",
			"<if test='region == 14'> WHERE ADDRESS LIKE '경북%'</if>",
			"<if test='region == 15'> WHERE ADDRESS LIKE '경남%'</if>",
			"<if test='region == 16'> WHERE ADDRESS LIKE '전북%'</if>",
			"<if test='region == 17'> WHERE ADDRESS LIKE '전남%'</if>",
			"</script>"})
	public List<Facility> selectPgList(Map<String, Object> param);

	
}
