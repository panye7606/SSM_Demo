package com.xk.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.xk.dao.StudentMapper;
import com.xk.entity.Student;
import com.xk.entity.StudentExample;
import com.xk.entity.StudentExample.Criteria;

/**
* <p>Title: StudentService</p>
* <p>Description: 提供学生处理所需服务</p>
* @author xzx
* @date 下午7:28:08
 */
@Service
public class StudentService {
	
	@Autowired
	StudentMapper studentMapper;
	
	/**
	 * 获取批量学生的信息，并以List集合进行返回
	 * @return
	 */
	public List<Student> getStudentsInfo(){
		List<Student> slist = studentMapper.selectByExampleClazz(null);
		return  slist;
	}

	/**
	 *检测学生信息是否符合要求
	 * @param studentName
	 * @return
	 */
	public boolean checkStudent(String studentName) {
		StudentExample studentExample = new StudentExample();
		Criteria criteria = studentExample.createCriteria();
		criteria.andNameEqualTo(studentName);
		long count = studentMapper.countByExample(studentExample);
		return count == 0;
	}

	/**
	 * 新增学生信息
	 * @param student
	 */
	public void saveStudent(Student student) {
		studentMapper.insertSelective(student);
	}

	/**
	 * 根据ID获取某一学生信息
	 * @param id
	 * @return
	 */
	public Student getStudent(Integer id) {
		return studentMapper.selectByPrimaryKey(id);
	}

	/**
	 * 更新学生的修改信息
	 * @param student
	 */
	public void updateStudent(Student student) {
		studentMapper.updateByPrimaryKeySelective(student);
	}
	
	/**
	 * 根据ID删除某一学生信息
	 * @param id
	 */
	public void deleteStudent(Integer id) {
		studentMapper.deleteByPrimaryKey(id);
	}

	/**
	 * 根据学生们的ID集合，批量进行删除操作
	 * @param id_more
	 */
	public void deleteStudents(List<Integer> id_more) {
		StudentExample studentExample = new StudentExample();
		Criteria criteria = studentExample.createCriteria();
		criteria.andClassidIn(id_more);
		studentMapper.deleteByExample(studentExample);
	}
}
