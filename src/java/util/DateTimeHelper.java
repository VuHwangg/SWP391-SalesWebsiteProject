/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package util;

import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;
import java.sql.Date;
import java.text.DateFormatSymbols;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Collections;


/**
 *
 * @author admin
 */
public class DateTimeHelper { 
    
    
    public static java.util.Date removeTime(java.util.Date date) {
        Calendar cal = Calendar.getInstance();
        cal.setTime(date);
        cal.set(Calendar.HOUR_OF_DAY, 0);
        cal.set(Calendar.MINUTE, 0);
        cal.set(Calendar.SECOND, 0);
        cal.set(Calendar.MILLISECOND, 0);
        return cal.getTime();
    }
    
    public static java.sql.Date toDateSql(java.util.Date d) {
        d= removeTime(d);
        return new java.sql.Date(d.getTime());
    }
    
    public static java.util.Date toDateUtil(java.sql.Date d) {
        java.util.Date x = new java.util.Date(d.getTime());
        x = removeTime(x);
        return x;
    }
    
    public static java.util.Date addDays(java.util.Date d, int days)
    {
        Calendar cal = Calendar.getInstance(); 
        cal.setTime(d);
        cal.add(Calendar.DATE, days);
        return cal.getTime();
    }
    
    public static int getDayofWeek(java.util.Date d) {
        Calendar c = Calendar.getInstance();
        c.setTime(d);
        int dayOfWeek = c.get(Calendar.DAY_OF_WEEK);
        return dayOfWeek;
    }
    
    public static ArrayList<java.sql.Date> getDateList(java.sql.Date from, java.sql.Date to)
    {
        ArrayList<java.sql.Date> dates = new ArrayList<>();
        int days = 0;
        java.util.Date e_from = toDateUtil(from);
        java.util.Date e_to = toDateUtil(to);
        while(true)
        {
            java.util.Date d = DateTimeHelper.addDays(e_from, days);
            dates.add(toDateSql(d));
            days++;
            if(d.compareTo(e_to)>=0)
                break;
        }
        return dates;
    }
    
    
    public static List<Date> getLast30Days() {
        List<Date> dates = new ArrayList<>();
        LocalDate today = LocalDate.now();
        for (int i = 0; i < 30; i++) {
            LocalDate date = today.minusDays(i);
            dates.add(Date.valueOf(date));
        }
        reverseDateList(dates);
        return dates;
    }
    
    public static List<String> getDayMonthList(List<Date> dates) {
        List<String> dayMonthList = new ArrayList<>();
        SimpleDateFormat dayFormat = new SimpleDateFormat("d");
        DateFormatSymbols symbols = new DateFormatSymbols();
        String[] months = symbols.getMonths();
        for (Date date : dates) {
            String day = dayFormat.format(date);
            String monthName = months[date.toLocalDate().getMonthValue() - 1];
            dayMonthList.add(day + " " + monthName);
        }
        return dayMonthList;
    }
    
    public static void reverseDateList(List<Date> dateList) {
        Collections.reverse(dateList);
    }
    
}
