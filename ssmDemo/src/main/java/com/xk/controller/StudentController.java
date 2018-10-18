package com.xk.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.validation.FieldError;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.xk.entity.Message;
import com.xk.entity.Student;
import com.xk.service.StudentService;

/**
* <p>Title: StudentController</p>
* <p>Description:学生控制处理 </p>
* @author xzx
* @date 下午7:25:06
 */
@Controller
public class StudentController {
	
	@Autowired
	StudentService studentService;
	
	/**
	 * 获取学生信息
	 * @param pn
	 * @return
	 */
	@RequestMapping("/getStudents")
	@ResponseBody
	private Message getStudentsToJosn(@RequestParam(value="pn" ,defaultValue="1") Integer pn) {
		PageHelper.startPage(pn, 3);
		List<Student> students = studentService.getStudentsInfo();
		PageInfo pi = new PageInfo(students, 3);
		
		return Message.success().add("pageInfo", pi);
	}
	
	/**
	 * 检验学生信息是否可用
	 * @param studentName
	 * @return
	 */
	@ResponseBody
	@RequestMapping("/checkStudent")
	public Message checkStudent(@RequestParam("studentName")String studentName){
		String regx = "(^[\u2E80-\u9FFF]{2,5})";
		if(!studentName.matches(regx)){
			return Message.fail().add("va_msg", "您好，请输入2-5位中文");
		}
		
		//数据库用户名重复校验
		boolean b = studentService.checkStudent(studentName);
		if(b){
			return Message.success();
		}else{
			return Message.fail().add("va_msg", "您好，您的姓名不可用");
		}
	}
	
	
	/**
	 * 添加学生
	 * @param student
	 * @param result
	 * @return
	 */
	@RequestMapping(value="/student",method=RequestMethod.POST)
	@ResponseBody
	public Message saveStudent(@Valid Student student,BindingResult result){
		if(result.hasErrors()){
			//校验失败，应该返回失败，在模态框中显示校验失败的错误信息
			Map<String, Object> map = new HashMap<>();
			List<FieldError> errors = result.getFieldErrors();
			for (FieldError fieldError : errors) {
				map.put(fieldError.getField(), fieldError.getDefaultMessage());
			}
			return Message.fail().add("errorFields", map);
		}else{
			studentService.saveStudent(student);
			return Message.success();
		}
		
	}
	
	/**
	 * 根据学生ID，获取某一特定学生信息
	 * @param id
	 * @return
	 */
	@RequestMapping(value="/student/{id}",method=RequestMethod.GET)
	@ResponseBody
	public Message getStudent(@PathVariable("id")Integer id){
		System.out.println("FIND");
		return Message.success().add("student", studentService.getStudent(id));
	}
	
	@RequestMapping(value="/student/{id}",method=RequestMethod.PUT)
	@ResponseBody
	public Message updateStudent(Student student){
		studentService.updateStudent(student);
		return Message.success();
	}
	
	/**
	 * 删除学生信息(支持批量处理)
	 * @param del_idstr
	 * @return
	 */
	@RequestMapping(value="/student/{id_Students}",method=RequestMethod.DELETE)
	@ResponseBody
	public Message deleteStudent(@PathVariable("id_Students")String del_idstr){
		if(del_idstr.contains("-")){
			List<Integer> id_more = new ArrayList<Integer>();
			String[] temp = del_idstr.split("-");
			for (String string : temp) {
				System.out.println(".."+string);
				id_more.add(Integer.parseInt(string));
			}
			studentService.deleteStudents(id_more);
		}else {
			studentService.deleteStudent(Integer.parseInt(del_idstr));
		}
		return Message.success();
	}
	
}
