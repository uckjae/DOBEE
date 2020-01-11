package service;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.RequestMapping;

import dao.EmpDao;
import dto.EmpDto;


@Service
public class EmpService {

	@Autowired
	private SqlSession sqlsession;
	
	public List<EmpDto> getEmpList(){
		List<EmpDto> result = new ArrayList<>();
		EmpDao dao = sqlsession.getMapper(EmpDao.class);
		result = dao.getEmpList();
		return result;
	}
	
	
	public int deleteEmp(String empno) {
		EmpDao empDao = sqlsession.getMapper(EmpDao.class);
		System.out.println(empDao);
		return empDao.deleteEmp(empno);
	}
	
	public int updateEmp(EmpDto empdto) {
		EmpDao empDao = sqlsession.getMapper(EmpDao.class);
		System.out.println(empDao);
		return empDao.updateEmp(empdto);
	}
	
	public EmpDto selectEmp(String empno) {
		EmpDao empDao = sqlsession.getMapper(EmpDao.class);
		System.out.println(empDao);
		return  empDao.selectEmp(empno);
	}
	public int insertEmp(EmpDto dto) {
		EmpDao empDao = sqlsession.getMapper(EmpDao.class);
		return  empDao.insertEmp(dto);
	}
	
}
