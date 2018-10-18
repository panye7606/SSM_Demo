package com.xk.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.xk.entity.ClaZZ;
import com.xk.entity.Message;
import com.xk.service.ClaZZService;

/**
 * 
* <p>Title: ClaZZController</p>
* <p>Description: 班级控制处理</p>
* @author xzx
* @date 下午7:23:30
 */
@Controller
public class ClaZZController {
	
	
	@Autowired
	ClaZZService claZZService;

	/**
	 * 获取班级信息
	 * @return
	 */
	@RequestMapping("/getClasses")
	@ResponseBody
	private Message getClasses() {
		List<ClaZZ> classes = claZZService.getAll();
		return Message.success().add("classesInfo", classes);
	}

}
