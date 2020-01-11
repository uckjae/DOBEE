package dao;

import java.util.List;

import dto.EmpDto;
import dto.EmpList;

public interface EmpDao {
	 List<EmpDto> getEmpList();
	 int deleteEmp(String empno);
	 int updateEmp(EmpDto dto);
	 EmpDto selectEmp(String empno);
	 int insertEmp(EmpDto dto);   
}
