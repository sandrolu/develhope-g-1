public with sharing class InvocableSendEmail {
    @InvocableMethod(label='Send contract' description='Send email with contract to approved Employees') 

        public static void sendEmail ( List <String> Idlist) { 

        List <Employee__c> EmployeeList = [ Select Email__c From Employee__c Where ID in :Idlist];
        Employee__c myEmployee =  EmployeeList [0];
         Messaging.SingleEmailMessage email = new Messaging.SingleEmailMessage(); 
           
            email.setToAddresses( new List <String> {myEmployee.Email__c }); 
            email.setSubject('Contract new Employee');
            email.setPlainTextBody('Welcome to ItHope. Please sign up your contract : ' +  
           'https://develhope-3c-dev-ed.develop.my.salesforce.com/sfc/p/7Q00000D02nV/a/7Q0000000oyk/s3CMDYb2SwL..wfjis6jJ7cU_W6WhYX3.vBggWz3_YA');         
           
             Messaging.sendEmail(new Messaging.SingleEmailMessage[] { email});
         
            }  }
