package com.xk.dao;

import com.xk.entity.ClaZZ;
import com.xk.entity.ClaZZExample;
import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface ClaZZMapper {
    long countByExample(ClaZZExample example);

    int deleteByExample(ClaZZExample example);

    int deleteByPrimaryKey(Integer id);

    int insert(ClaZZ record);

    int insertSelective(ClaZZ record);

    List<ClaZZ> selectByExample(ClaZZExample example);

    ClaZZ selectByPrimaryKey(Integer id);

    int updateByExampleSelective(@Param("record") ClaZZ record, @Param("example") ClaZZExample example);

    int updateByExample(@Param("record") ClaZZ record, @Param("example") ClaZZExample example);

    int updateByPrimaryKeySelective(ClaZZ record);

    int updateByPrimaryKey(ClaZZ record);
}