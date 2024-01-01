@isTest
public class TestVerifyDate {
    
    @isTest
    static void testWithin30Days() {
        Date today = Date.today();
        Date futureDate = today.addDays(15); // Set a future date within 30 days
        
        Date result = VerifyDate.CheckDates(today, futureDate);
        
        System.assertEquals(result, futureDate, 'Dates within 30 days should return the same date.');
    }
    
    @isTest
    static void testEndOfMonth() {
        Date today = Date.today();
        Date pastDate = today.addMonths(-1); // Set a past date
        
        Date result = VerifyDate.CheckDates(today, pastDate);
        
        Integer expectedMonthDays = Date.daysInMonth(today.year(), today.month());
        Date expectedDate = Date.newInstance(today.year(), today.month(), expectedMonthDays);
        
        System.assertEquals(result, expectedDate, 'Past date should return the end of the current month.');
    }
    
    @isTest
    static void testSameDate() {
        Date today = Date.today();
        
        Date result = VerifyDate.CheckDates(today, today);
        
        System.assertEquals(result, today, 'Same dates should return the same date.');
    }
}