package com.xk.entity;

public class Student {
    private Integer id;

    private String name;

    private String number;

    private String gender;

    private Integer classId;
    
    private ClaZZ clazz;

	public ClaZZ getClazz() {
		return clazz;
	}

	public void setClazz(ClaZZ clazz) {
		this.clazz = clazz;
	}

	public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name == null ? null : name.trim();
    }

    public String getNumber() {
        return number;
    }

    public void setNumber(String number) {
        this.number = number == null ? null : number.trim();
    }

    public String getGender() {
        return gender;
    }

    public void setGender(String gender) {
        this.gender = gender == null ? null : gender.trim();
    }

	public Integer getClassId() {
		return classId;
	}

	public void setClassId(Integer classId) {
		this.classId = classId;
	}
    
}