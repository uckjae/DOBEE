package kr.or.bit.dao;

import java.util.List;

import kr.or.bit.dto.Emp;

public interface EmpdaoInterface {
	public int adminLogin(String userid, String pwd);
	
	public List<Emp> getEmpList();
	
	public Emp editEmp(int empno);
	
	public int editEmpOk(Emp emp);
	
	public int deleteEmp(int empno);
	
	public int insertEmp(Emp emp);
	
	public Emp getEmpByEmpno(int empno);
	
	public List<Emp> getEmpByDeptno(int deptno);
}
