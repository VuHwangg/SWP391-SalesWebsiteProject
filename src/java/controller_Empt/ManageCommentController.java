/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package controller_Empt;

import dal.VoteDBContext;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.Date;
import java.util.ArrayList;
import model.UserVote;
import util.DateTimeHelper;

/**
 *
 * @author admin
 */
public class ManageCommentController extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        VoteDBContext voteDB = new VoteDBContext();
        ArrayList<UserVote> userVotes = voteDB.listAllUnconfimred();
        int unconfirmed = userVotes.size();
        int reject = voteDB.getNumOfVoteByStatus(2);
        int confirmed = voteDB.getNumOfVoteByStatus(1);
        request.setAttribute("unconfirmed", unconfirmed);
        request.setAttribute("reject", reject);
        request.setAttribute("confirmed", confirmed);
        request.setAttribute("userVotes", userVotes);
        request.getRequestDispatcher("admin-feedback-list.jsp").forward(request, response);
//        response.getWriter().print(userVotes);
//        for(UserVote x : userVotes){
//            response.getWriter().print(x.getRating());
//        }

    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        processRequest(req, resp);
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        processRequest(req, resp);
    }

}
