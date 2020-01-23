package com.dobee.services;

import com.dobee.dao.ProjectDao;
import com.dobee.vo.member.User;
import com.dobee.vo.project.CheckList;
import com.dobee.vo.project.Project;
import com.dobee.vo.project.ProjectMember;
import com.dobee.vo.project.Task;
import com.dobee.vo.project.TaskDetail;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service
public class ProjectService {


    @Autowired
    private SqlSession sqlSession;


    //프로젝트메인
    public List<Project> projectList(String mail){
    	List<Project>list = null;
    	ProjectDao projectdao = sqlSession.getMapper(ProjectDao.class);
    	list = projectdao.getPjtList(mail);    	
        return list;
    }


    //프로젝트추가
    public int addProject(Project project){
    	int result = 0;
    	ProjectDao projectdao = sqlSession.getMapper(ProjectDao.class);
    	result = projectdao.mkPjt(project);
    	return result;
    }
    
    //프로젝트 멤버 추가
    public int addProjectMember(String pjtName, List<String> pjtMembersMail) {
    	int result = 0;
    	ProjectDao projectdao = sqlSession.getMapper(ProjectDao.class);
    	Map<String, String> map = new HashMap<String, String>();
    	map.put("pjtName", pjtName);
    	for(int i = 0; i<pjtMembersMail.size(); i++) {
    		String mail = pjtMembersMail.get(i).toString();
    		map.put("mail", mail);
        	result = projectdao.mkPjtMember(map);
    	}
    	System.out.println("result?"+result);
    	return result;
    }

    
    //특정 프로젝트 가져오기
    public Project getProject(int pjtSeq) {
    	Project project = null;
    	ProjectDao projectdao = sqlSession.getMapper(ProjectDao.class);
    	project = projectdao.getPjt(pjtSeq);
    	return project;
    }
    
    //특정 프로젝트 멤버 정보(메일, 이름) 가져오기
    public List<User> getPjtMember(int pjtSeq) {
    	List<User> pjtMember = null;
    	ProjectDao projectdao = sqlSession.getMapper(ProjectDao.class);
    	pjtMember = projectdao.getPjtMember(pjtSeq);
    	System.out.println("db에서 어떻게 가져와?"+pjtMember.toString());
    	return pjtMember;
    }
    
    //프로젝트삭제
    @Transactional
    public int delProject(int pjtSeq){
    	
//    	int result = 0;
//    	ProjectDao projectdao = sqlSession.getMapper(ProjectDao.class);
//    	result = projectdao.delete(pjtSeq);
    	return 0;
    }


    //업무리스트
    public List<Task> taskList(int pjtSeq){
        ProjectDao projectDao = sqlSession.getMapper(ProjectDao.class);
        List<Task> taskList = projectDao.taskList(pjtSeq);
    	return taskList;
    }


    //업무추가_PM
    public void addPMTask(Task task){
    	ProjectDao projectDao = sqlSession.getMapper(ProjectDao.class);
    	projectDao.addPMTask(task);
    	
    }
    
    
    //특정업무 조회
    public Task getTask(int tskSeq) {
    	ProjectDao projectDao = sqlSession.getMapper(ProjectDao.class);
    	Task task = projectDao.getTask(tskSeq);
    	return task;
    }

    //업무추가
    public void addTask(){

    }


    //업무수정_PM
    public void modiTaskPM(){

    }


    //업무수정
    public void editTask(Task task){
    	ProjectDao projectDao = sqlSession.getMapper(ProjectDao.class);
    	projectDao.editTask(task);

    }


    //업무삭제
    public int pmTaskDelete(int tskSeq){
    	System.out.println("ProjectService pmTaskDelete() in!!");
    	ProjectDao projectDao = sqlSession.getMapper(ProjectDao.class);
    	int result = projectDao.pmTaskDelete(tskSeq);
    	System.out.println(result);
    	return result;
    }


    //상세업무조회
    public List<TaskDetail> getTaskDetailList(int tskSeq){
        ProjectDao projectDao = sqlSession.getMapper(ProjectDao.class);
        List<TaskDetail> taskDetailList = projectDao.getTaskDetailList(tskSeq);
    	return taskDetailList;
    }


    // 상세업무입력
    public void addTaskDetail(TaskDetail taskDetail){
    	ProjectDao projectDao = sqlSession.getMapper(ProjectDao.class);
    	projectDao.addTaskDetail(taskDetail);
    }


    //상세업무수정
    public int taskDetailEdit(TaskDetail taskDetail){
    	ProjectDao projectDao = sqlSession.getMapper(ProjectDao.class);
    	int result = projectDao.taskDetailEdit(taskDetail);
    	return result;
    }


    //상세업무삭제
    public int taskDetailDelete(TaskDetail taskDetail){
    	System.out.println("ProjectService taskDetailDelete in!!");
    	ProjectDao projectDao = sqlSession.getMapper(ProjectDao.class);
    	int result = projectDao.taskDetailDelete(taskDetail);
    	return result;
    }


    //체크리스트추가
    public int addTaskCheckList(CheckList checkList){
    	ProjectDao projectDao = sqlSession.getMapper(ProjectDao.class);
    	int result = projectDao.addTaskCheckList(checkList);
    	return result;
    }


    //체크리스트삭제
    public void delCheckList(){

    }


    //체크리스트 조회
    public List<CheckList> getTaskCheckList(int tskSeq){
        System.out.println("ProjectService getTaskCheckList() in");
        ProjectDao projectDao = sqlSession.getMapper(ProjectDao.class);
        List<CheckList> taskCheckList = projectDao.getTaskCheckList(tskSeq);
    	return taskCheckList;
    }
    
    //체크리스트 수정
    public int taskCheckListEdit(CheckList checkList) {
    	System.out.println("ProjectService taskCheckListEdit() in");
    	ProjectDao projectDao = sqlSession.getMapper(ProjectDao.class);
    	int result = projectDao.taskCheckListEdit(checkList);
    	return result;
    }
    
    
    //체크리스트 삭제
    public int taskCheckListDelete(CheckList checkList) {
    	System.out.println("ProjectService taskCheckListDelete() in!!");
    	ProjectDao projectDao = sqlSession.getMapper(ProjectDao.class);
    	int result = projectDao.taskCheckListDelete(checkList);
    	return result;
    }


    //프로젝트 분석
    public List<Task> projectChart(){
        return null;
    }
}