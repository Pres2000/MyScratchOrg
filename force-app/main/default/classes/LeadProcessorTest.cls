@isTest
private class LeadProcessorTest {
    
    @isTest
    private static void testBatchClass() {

        //load data
        List<Lead> leads = new List<Lead>();
        for (Integer i = 0; i < 200; i++) {
            leads.add(new Lead(LastName='Connock', Company='Salesforce'));
        }
        insert leads;

        //perform the test
        Test.startTest();
        LeadProcessor lp = new LeadProcessor();
        Id batchId = Database.executeBatch(lp, 200);
        Test.stopTest();

        //check the result
        List<Lead> updatedLeads = [SELECT Id FROM Lead WHERE LeadSource = 'Dreamforce'];
        System.assertEquals(200, updatedLeads.size(), 'Error: at least 1 Lead record not updated correctly');
    }
}