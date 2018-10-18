<%@ page language="java" import="java.util.*"
	contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>SSM-Demo-By-Xuan</title>
</head>
<%
	pageContext.setAttribute("Context_PATH", request.getContextPath());
%>

<script type="text/javascript"
	src="${Context_PATH}/source/js/jquery-1.12.4.min.js">
	
</script>

<link href="${Context_PATH}/source/bootStrap/css/bootstrap.min.css"
	rel="stylesheet">

<script src="${Context_PATH}/source/bootStrap/js/bootstrap.min.js">
	
</script>

<body>

	<!-- 修改信息 -->
	<div class="modal fade" id="update_student" tabindex="-1" role="dialog"
		aria-labelledby="myModalLabel">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
					<h4 class="modal-title">信息修改</h4>
				</div>
				<div class="modal-body">
					<form class="form-horizontal">
						<div class="form-group">
							<label class="col-sm-2 control-label">姓名</label>
							<div class="col-sm-10">
								<p class="form-control-static" id="studentName_update_static"></p>
							</div>
						</div>
						<div class="form-group">
							<label class="col-sm-2 control-label">学号</label>
							<div class="col-sm-10">
								<input type="text" name="number" class="form-control"
									id="number_update_input" placeholder="请输入12位学号"> <span
									class="help-block"></span>
							</div>
						</div>
						<div class="form-group">
							<label class="col-sm-2 control-label">性别</label>
							<div class="col-sm-10">
								<label class="radio-inline"> <input type="radio"
									name="gender" id="gender1_update_input" value="1"
									checked="checked"> 男
								</label> <label class="radio-inline"> <input type="radio"
									name="gender" id="gender2_update_input" value="2"> 女
								</label>
							</div>
						</div>
						<div class="form-group">
							<label class="col-sm-2 control-label">班级</label>
							<div class="col-sm-4">
								<select class="form-control" name="classId">
								</select>
							</div>
						</div>
					</form>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
					<button type="button" class="btn btn-primary"
						id="student_update_btn">修改</button>
				</div>
			</div>
		</div>
	</div>



	<!-- 添加新生 -->
	<div class="modal fade" id="add_student" tabindex="-1" role="dialog"
		aria-labelledby="myModalLabel">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
					<h4 class="modal-title" id="myModalLabel">新生</h4>
				</div>
				<div class="modal-body">
					<form class="form-horizontal">
						<div class="form-group">
							<label class="col-sm-2 control-label">姓名</label>
							<div class="col-sm-10">
								<input type="text" name="name" class="form-control"
									id="studentName_add_input" placeholder="您好，请输入姓名"> <span
									class="help-block"></span>
							</div>
						</div>
						<div class="form-group">
							<label class="col-sm-2 control-label">学号</label>
							<div class="col-sm-10">
								<input type="text" name="number" class="form-control"
									id="number_add_input" placeholder="您好，请输入12号学号">
								<span class="help-block"></span>
							</div>
						</div>
						<div class="form-group">
							<label class="col-sm-2 control-label">性别</label>
							<div class="col-sm-10">
								<label class="radio-inline"> <input type="radio"
									name="gender" id="gender1_add_input" value="1"
									checked="checked"> 男
								</label> <label class="radio-inline"> <input type="radio"
									name="gender" id="gender2_add_input" value="2"> 女
								</label>
							</div>
						</div>
						<div class="form-group">
							<label class="col-sm-2 control-label">班级</label>
							<div class="col-sm-4">
								<select class="form-control" name="classId">
								</select>
							</div>
						</div>
					</form>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
					<button type="button" class="btn btn-primary" id="student_save_btn">保存</button>
				</div>
			</div>
		</div>
	</div>

	<div class="container">
		<div class="row">
			<div class="col-md-12">
				<h3>
					<ul class="breadcrumb">
						<li class="active">SSM - Demo - Student&Class / 2018 -
							October /</li>
						<li><a href="https://github.com/Zhangxuan-Xing">By Xuan</a></li>
					</ul>
				</h3>
			</div>
		</div>
		<div class="row">
			<div class="col-md-12  pull-right">
				<button class="btn btn-success" id="student_add_modal_btn">添加
				</button>
				<button class="btn btn-warning" id="student_delete_all_btn">删除
				</button>
			</div>
		</div>
		<div class="row">
			<div class="col-md-12">
				<table class="table table-hover" id="student_table">
					<thead>
						<tr>
							<th><input type="checkbox" id="check_all" /></th>
							<th>编号</th>
							<th>学生姓名</th>
							<th>学号</th>
							<th>性别</th>
							<th>班级</th>
							<th>操作</th>
						</tr>
					</thead>
					<tbody>

					</tbody>
				</table>
			</div>
		</div>

		<div class="row">
			<!-- 分页信息  -->
			<div class="col-md-6" id="page_info_area"></div>
			<!-- 分页条信息 -->
			<div class="col-md-6" id="page_nav_area"></div>

		</div>

	</div>

	<script type="text/javascript">
		var totalRecord, currentPage;

		$(function() {
			//启动数据加载
			to_page(1);
		});

		function to_page(pn) {
			$.ajax({
				url : "${Context_PATH}/getStudents",
				data : "pn=" + pn,
				type : "GET",
				success : function(result) {
					//解析并显示员工数据
					build_students_table(result);
					//解析并显示分页信息
					build_page_info(result);
					//解析显示分页条数据
					build_page_nav(result);
				}
			});
		}

		function build_students_table(result) {
			//清空内容 - 以防重复添加
			$("#student_table tbody").empty();
			var students = result.map.pageInfo.list;

			$
					.each(
							students,
							function(index, item) {
								var checkBoxTd = $("<td><input type='checkbox' class='check_item'/></td>");
								var id = $("<td></td>").append(item.id);
								var name = $("<td></td>").append(item.name);
								var number = $("<td></td>").append(item.number);
								var gender = $("<td></td>").append(
										item.gender == '1' ? "男" : "女");
								var clazz = $("<td></td>").append(
										item.clazz.c_name);

								var editBtn = $("<button></button>").addClass(
										"btn btn-Info btn-sm edit_btn").append(
										$("<span></span>").addClass(
												"glyphicon glyphicon-pencil"))
										.append("编辑");
								// 添加自定义的属性  - 表示当前员工id - 方便后期增删操作
								editBtn.attr("student-id", item.id);
								var delBtn = $("<button></button>")
										.addClass(
												"btn btn-danger btn-sm delete_btn")
										.append(
												$("<span></span>")
														.addClass(
																"glyphicon glyphicon-trash"))
										.append("删除");
								delBtn.attr("del-id", item.id);
								var btnTd = $("<td></td>").append(editBtn)
										.append(" ").append(delBtn);
								$("<tr></tr>").append(checkBoxTd).append(id)
										.append(name).append(number).append(
												gender).append(clazz).append(
												btnTd).appendTo(
												"#student_table tbody");
							});
		}

		function build_page_info(result) {
			$("#page_info_area").empty();
			$("#page_info_area").append(
					"现处于" + result.map.pageInfo.pageNum + "页    -  共"
							+ result.map.pageInfo.pages + "页   -  总计"
							+ result.map.pageInfo.total + "条记录");
			totalRecord = result.map.pageInfo.total;
			currentPage = result.map.pageInfo.pageNum;
		}

		function build_page_nav(result) {

			$("#page_nav_area").empty();

			var ul = $("<ul></ul>").addClass("pagination");

			var firstPage = $("<li></li>").append(
					$("<a></a>").append("首页").attr("href", "#"));
			var prePage = $("<li></li>").append($("<a></a>").append("&laquo;"));
			if (result.map.pageInfo.hasPreviousPage == false) {
				firstPage.addClass("disabled");
				prePage.addClass("disabled");
			} else {
				firstPage.click(function() {
					to_page(1);
				});
				prePage.click(function() {
					to_page(result.map.pageInfo.pageNum - 1);
				});
			}

			var nextPage = $("<li></li>")
					.append($("<a></a>").append("&raquo;"));
			var lastPage = $("<li></li>").append(
					$("<a></a>").append("尾页").attr("href", "#"));
			if (result.map.pageInfo.hasNextPage == false) {
				nextPage.addClass("disabled");
				lastPage.addClass("disabled");
			} else {
				nextPage.click(function() {
					to_page(result.map.pageInfo.pageNum + 1);
				});
				lastPage.click(function() {
					to_page(result.map.pageInfo.pages);
				});
			}

			//添加首页或上一页提示
			ul.append(firstPage).append(prePage);
			$.each(result.map.pageInfo.navigatepageNums, function(index, item) {

				var numLi = $("<li></li>").append($("<a></a>").append(item));
				if (result.map.pageInfo.pageNum == item) {
					numLi.addClass("active");
				}
				numLi.click(function() {
					to_page(item);
				});
				ul.append(numLi);
			});
			//添加下一页或尾页 提示
			ul.append(nextPage).append(lastPage);

			var navEle = $("<nav></nav>").append(ul);
			navEle.appendTo("#page_nav_area");
		}

		//清空表单内容
		function reset_form(ele) {
			$(ele)[0].reset();
			//清空表单样式
			$(ele).find("*").removeClass("has-error has-success");
			$(ele).find(".help-block").text("");
		}

		//点击新增按钮弹出模态框。
		$("#student_add_modal_btn").click(function() {
			reset_form("#add_student form");
			getClasses("#add_student select");
			$("#add_student").modal({
				backdrop : "static"
			});
		});

		function getClasses(ele) {
			$(ele).empty();
			$.ajax({
				url : "${Context_PATH}/getClasses",
				type : "GET",
				success : function(result) {
					console.log(result.map.classesInfo);
					$.each(result.map.classesInfo, function() {
						var optionEle = $("<option></option>").append(
								this.c_name).attr("value", this.c_id);
						optionEle.appendTo(ele);
					});
				}
			});

		}

		function add_validate() {
			//检验姓名
			var studentName = $("#studentName_add_input").val();
			var regName = /(^[\u2E80-\u9FFF]{2,5})/;
			if (!regName.test(studentName)) {
				show_validate_msg("#studentName_add_input", "error",
						"您好，姓名应为2-5位中文");
				return false;
			} else {
				show_validate_msg("#studentName_add_input", "success", "");
			}
			;

			//检验学号
			var number = $("#number_add_input").val();
			var regnumber = /^[0-9]{12}$/;
			if (!regnumber.test(number)) {
				show_validate_msg("#number_add_input", "error",
						"您好，请输入您的12位学号！");
				return false;
			} else {
				show_validate_msg("#number_add_input", "success", "");
			}
			return true;
		}

		function show_validate_msg(ele, status, msg) {
			$(ele).parent().removeClass("has-success has-error");
			$(ele).next("span").text("");
			if ("success" == status) {
				$(ele).parent().addClass("has-success");
				$(ele).next("span").text(msg);
			} else if ("error" == status) {
				$(ele).parent().addClass("has-error");
				$(ele).next("span").text(msg);
			}
		}

		//从数据库检索  检测是否重复可用
		$("#studentName_add_input").change(
				function() {
					var studentName = this.value;
					$
							.ajax({
								url : "${Context_PATH}/checkStudent",
								data : "studentName=" + studentName,
								type : "POST",
								success : function(result) {
									if (result.status == 1) {
										show_validate_msg(
												"#studentName_add_input",
												"success", "用户名可用");
										$("#student_save_btn").attr("ajax-va",
												"success");
									} else {
										show_validate_msg(
												"#studentName_add_input",
												"error", result.map.va_msg);
										$("#student_save_btn").attr("ajax-va",
												"error");
									}
								}
							});
				});

		$("#student_save_btn")
				.click(
						function() {
							if (!add_validate()) {
								return false;
							}
							;
							if ($(this).attr("ajax-va") == "error") {
								return false;
							}
							$
									.ajax({
										url : "${Context_PATH}/student",
										type : "POST",
										data : $("#add_student form")
												.serialize(),
										success : function(result) {
											if (result.status == 1) {
												$("#add_student").modal('hide');
												to_page(totalRecord);
											} else {
												if (undefined != result.map.errorFields.number) {
													show_validate_msg(
															"#number_add_input",
															"error",
															result.map.errorFields.number);
												}
												if (undefined != result.map.errorFields.studentName) {
													show_validate_msg(
															"#studentName_add_input",
															"error",
															result.map.errorFields.studentName);
												}
											}
										}
									});
						});

		//Jquery 新版无法正常使用live
		//可以使用on完成所需效果功能
		$(document).on(
				"click",
				".edit_btn",
				function() {
					getClasses("#update_student select");
					getStudent($(this).attr("student-id"));

					$("#student_update_btn").attr("student-id",
							$(this).attr("student-id"));
					$("#update_student").modal({
						backdrop : "static"
					});
				});

		function getStudent(id) {
			$.ajax({
				url : "${Context_PATH}/student/" + id,
				type : "GET",
				success : function(result) {
					var student_Info = result.map.student;
					$("#studentName_update_static").text(student_Info.name);
					$("#number_update_input").val(student_Info.number);
					$("#update_student input[name=gender]").val(
							[ student_Info.gender ]);
					$("#update_student select").val([ student_Info.classId ]);
				}
			});
		}

		$("#student_update_btn").click(function() {
			var number = $("#number_update_input").val();
			var regnumber = /^([0-9]){12}$/;
			if (!regnumber.test(number)) {
				show_validate_msg("#number_update_input", "error", "邮箱格式不正确");
				return false;
			} else {
				show_validate_msg("#number_update_input", "success", "");
			}

			$.ajax({
				url : "${Context_PATH}/student/" + $(this).attr("student-id"),
				type : "PUT",
				data : $("#update_student form").serialize(),
				success : function(result) {
					$("#update_student").modal("hide");
					to_page(currentPage);
				}
			});
		});

		$(document).on("click", ".delete_btn", function() {
			var studentName = $(this).parents("tr").find("td:eq(2)").text();
			var studentId = $(this).attr("del-id");
			if (confirm("您好,确认删除 " + studentName + " 吗？")) {
				$.ajax({
					url : "${Context_PATH}/student/" + studentId,
					type : "DELETE",
					success : function(result) {
						alert(result.msg);
						to_page(currentPage);
					}
				});
			}
		});

		// 多选 - 批量处理 框
		$("#check_all").click(function() {
			$(".check_item").prop("checked", $(this).prop("checked"));
		});

		$(document)
				.on(
						"click",
						".check_item",
						function() {
							var flag = $(".check_item:checked").length == $(".check_item").length;
							$("#check_all").prop("checked", flag);
						});

		$("#student_delete_all_btn").click(
				function() {
					var studentNames = "";
					var del_idstr = "";
					$.each($(".check_item:checked"), function() {
						studentNames += $(this).parents("tr").find("td:eq(2)")
								.text()
								+ ",";
						del_idstr += $(this).parents("tr").find("td:eq(1)")
								.text()
								+ "-";
					});
					studentNames = studentNames.substring(0,
							studentNames.length - 1);
					del_idstr = del_idstr.substring(0, del_idstr.length - 1);
					if (confirm("您好,确认删除 " + studentNames + " 吗？")) {
						$.ajax({
							url : "${Context_PATH}/student/" + del_idstr,
							type : "DELETE",
							success : function(result) {
								alert(result.msg);
								to_page(currentPage);
							}
						});
					}
				});
	</script>

</body>
</html>
