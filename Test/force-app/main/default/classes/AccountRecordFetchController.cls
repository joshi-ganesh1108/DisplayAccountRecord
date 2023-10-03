public class AccountRecordFetchController
 {
    @AuraEnabled
    public static List<Account> getAccountRecord()
   {
        return new List<Account>([Select id,Name,Phone,Type from Account order by CreatedDate desc LIMIT  10]);
    }
}