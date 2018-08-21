package com.fabulous.www.model.memo.dao;

import java.util.List;

import org.apache.ibatis.annotations.Select;

import com.fabulous.www.model.memo.dto.MemoDTO;

public interface MemoDAO {
	@Select("select * from memo order by idx desc")
	public List<MemoDTO> list();
	
}
