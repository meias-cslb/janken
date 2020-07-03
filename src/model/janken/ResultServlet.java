package model.janken;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class Result
 */
@WebServlet("/result")
public class ResultServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

    /**
     * @see HttpServlet#HttpServlet()
     */
    public ResultServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		request.setCharacterEncoding("UTF-8");

//		プレイヤーの出したものを取得
		String select = request.getParameter("hand");

		int player = 0;

		String jsp = null;

		if(select == null || select.isEmpty()) {
			request.setAttribute("message", "選んで！");
			jsp = "/WEB-INF/jsp/top.jsp";
		} else {
			try {
//				player = Integer.valueOf(select).intValue();
				player = Integer.parseInt(select);
			} catch (NumberFormatException e) {
				e.printStackTrace();
			}


	//		コンピューターの出すものをランダムで選ぶ
			int computer = (int)(Math.random() * 3) + 1;

			String result = judgment(player, computer);

			request.setAttribute("player", player);
			request.setAttribute("computer", computer);
			request.setAttribute("result", result);

	//		result.jspに転送準備
			jsp = "/WEB-INF/jsp/result.jsp";
		}

//		jspに転送し、表示
		RequestDispatcher dispatcher = request.getRequestDispatcher(jsp);
		dispatcher.forward(request, response);
	}

	private String judgment(int player, int computer) {
		String result = null;

//		あいこ
		if(player == computer) {
			result = "あいこ！";
		} else {

	//		グーを選んだ時
			if(player == 1) {
				if(computer == 2) {
					result = "WIN!";
				} else if(computer == 3) {
					result = "Lose…";
				}
			}

	//		チョキを選んだ時
			if(player == 2) {
				if(computer == 3) {
					result = "WIN!";
				} else if(computer == 1)  {
					result = "Lose…";
				}
			}

	//		パーを選んだ時
			if(player == 3) {
				if(computer == 1) {
					result = "WIN!";
				} else if(computer == 2) {
					result = "Lose…";
				}
			}
		}

		return result;
	}

}
