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
import model.Account;

/**
 *
 * @author admin
 */
public class ChangeCommentStatusController extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        int id = Integer.parseInt(request.getParameter("voteId"));
        int status = Integer.parseInt(request.getParameter("status"));      
        int productId = Integer.parseInt(request.getParameter("productId"));
        int rating = Integer.parseInt(request.getParameter("rating"));
        VoteDBContext voteDB = new VoteDBContext();
        int x = voteDB.updateStatus(id, status);
        if(status == 1){
            int voteId = voteDB.getByProductIdAndRating(productId, rating);
            if(voteId==0){
                x = voteDB.insertVote(productId, rating);
            }else{
                int numOfVote = voteDB.getNumOfVoteByID(voteId);
                x = voteDB.updateVote(voteId, numOfVote);
            }
        }
        response.sendRedirect("commentmanagement");
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
