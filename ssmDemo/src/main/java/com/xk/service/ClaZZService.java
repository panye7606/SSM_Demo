package com.xk.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.xk.dao.ClaZZMapper;
import com.xk.entity.ClaZZ;

/**
* <p>Title: ClaZZService</p>
* <p>Description:提供班级处理所需服务 </p>
* @author xzx
* @date 下午7:27:39
 */
@Service
public class ClaZZService {
	
	@Autowired
	ClaZZMapper claZZMapper;
	
	/**
	 * 获取所有的班级信息
	 * @return
	 */
	public List<ClaZZ> getAll() {
		return claZZMapper.selectByExample(null);
	}
}
