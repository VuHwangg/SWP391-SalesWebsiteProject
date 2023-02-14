/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package util;

import java.text.DecimalFormat;
import model.Product;
import model.Vote;

/**
 *
 * @author admin
 */
public class helper {

    public String convertBigNum(double x) {
        DecimalFormat formatter = new DecimalFormat("#,###");
        String result = formatter.format(x);
        return result;
    }

    public boolean checked(String x, String[] ys) {
        for (String y : ys) {
            if (x.compareTo(y) == 0) {
                return true;
            }
        }
        return false;
    }

    public int totalVote(Product product) {
        int totalVote = 0;
        for (Vote vote : product.getVotes()) {
            totalVote += vote.getNum_of_vote();
        }
        return totalVote;
    }

    public double getAvgRate(Product product) {
        double avg = 0;
        int totalStar = 0;
        int totalVote = this.totalVote(product);
        if (totalVote != 0) {
            for (Vote vote : product.getVotes()) {
                totalStar += vote.getNum()*vote.getNum_of_vote();
            }
            avg = totalStar / totalVote;
        }
        return avg;
    }

    public int getNumofVote(Product product, int num) {
        for (Vote vote : product.getVotes()) {
            if(num==vote.getNum()){
                return vote.getNum_of_vote();
            }
        }
        return 0;
    }
}
