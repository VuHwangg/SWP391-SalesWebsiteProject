/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package util;

import java.text.DecimalFormat;
import java.util.List;
import model.Product;
import model.Vote;

/**
 *
 * @author admin
 */
public class Helper {
//lấy ra dạng số nguyên

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
//so sánh 2 chuỗi

    public boolean compareString(String x, String y) {
        if (x.compareTo(y) == 0) {
            return true;
        }
        return false;

    }

//so sánh với all
    public boolean compareWithAll(String[] xs) {
        for (String x : xs) {
            if (x.compareTo("all") == 0) {
                return true;
            }
        }

        return false;
    }

    public boolean checkSize(int num, String[] xs) {
        String name = "";
        if (num == 1) {
            name += "size1";
        } else if (num == 2) {
            name += "size2";
        } else if (num == 3) {
            name += "size3";
        } else if (num == 4) {
            name += "size4";
        }
        for (String x : xs) {
            if (name.compareTo(x) == 0) {
                return true;
            }
        }

        return false;
    }

//so sanh các thuộc tính của 2 sản phẩm
    public boolean compareProperties(Product x, Product y) {
        if (x.getRam() != y.getRam()) {
            return false;
        }
        if (x.getMemory() != y.getMemory()) {
            return false;
        }
        if (x.getCpu().compareTo(y.getCpu()) != 0) {
            return false;
        }
        if (x.getGraphic_card().compareTo(y.getGraphic_card()) != 0) {
            return false;
        }
        return true;
    }
//tính tổng số vote

    public int totalVote(Product product) {
        int totalVote = 0;
        for (Vote vote : product.getVotes()) {
            totalVote += vote.getNum_of_vote();
        }
        return totalVote;
    }
//lấy số vote trung bình

    public double getAvgRate(Product product) {
        double avg = 0;
        int totalStar = 0;
        int totalVote = this.totalVote(product);
        if (totalVote != 0) {
            for (Vote vote : product.getVotes()) {
                totalStar += vote.getNum() * vote.getNum_of_vote();
            }
            avg = totalStar / totalVote;
        }
        return avg;
    }
//lấy ra số vote của một mức đánh giá

    public int getNumofVote(Product product, int num) {
        for (Vote vote : product.getVotes()) {
            if (num == vote.getNum()) {
                return vote.getNum_of_vote();
            }
        }
        return 0;
    }
//check type of sort

    public int checkSort(String x) {
        if (x.compareTo("ASC") == 0) {
            return 2;
        } else if (x.compareTo("DESC") == 0) {
            return 3;
        }
        return 1;
    }
//get type name

    public String typeName(int x) {
        if (x == 1) {
            return "Laptop";
        } else {
            return "Điện thoại";
        }

    }

    public int osCompare(String os) {
        if (os.equalsIgnoreCase("Android")) {
            return 0;
        } else if (os.equalsIgnoreCase("IOS")) {
            return 1;
        } else if (os.equalsIgnoreCase("Window11")) {
            return 2;
        } else {
            return 3;
        }

    }

    public static double findMax(List<Double> list) {
        double max = Double.MIN_VALUE;
        for (double num : list) {
            if (num > max) {
                max = num;
            }
        }
        return max;
    }
    
    public static double findTopOfY(List<Double> list){
        double max = findMax(list);
        double x = 0;
        int count =0;
        while(true){
            if(max<100) x = max;
            max/=10;            
            if(max<10){
                break;
            }
            count++;
        }
        x++;
        int y = (int)x;
        x = y*Math.pow(10, count);
        return x;
    }
    
    public static int findMaxForInt(List<Integer> list) {
        int max = (int) Double.MIN_VALUE;
        for (int num : list) {
            if (num > max) {
                max = num;
            }
        }
        return max;
    }
    
    public static int findTopOfYForInt(List<Integer> list){
        int max = findMaxForInt(list);
        if(max < 100) return 100;
        int x = 0;
        int count =0;
        while(true){
            if(max<100) x = max;
            max/=10;            
            if(max<10){
                break;
            }
            count++;
        }
        x++;
        x = (int) (x*Math.pow(10, count));
        return x;
    }

}
