@isTest
public class AccountProcessorTest {

    @isTest
    static void testCountContacts() {
        // Create test accounts and contacts
        Account testAccount1 = new Account(Name = 'Test Account 1');
        insert testAccount1;

        Contact testContact1 = new Contact(FirstName = 'John', LastName = 'Doe', AccountId = testAccount1.Id);
        insert testContact1;

        List<Id> accountIds = new List<Id>();
        accountIds.add(testAccount1.Id);

        // Call the future method
        Test.startTest();
        AccountProcessor.countContacts(accountIds);
        Test.stopTest();

        // Verify the number of contacts updated on the Account
        Account updatedAccount = [SELECT Number_Of_Contacts__c FROM Account WHERE Id = :testAccount1.Id];
        System.assertEquals(1, updatedAccount.Number_Of_Contacts__c);
    }
}