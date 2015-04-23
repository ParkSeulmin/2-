package Mypage.Action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public interface Mypage_Action {
	//메서드
	public Mypage_ActionForward execute(HttpServletRequest request,
			HttpServletResponse response) throws Exception;
}
