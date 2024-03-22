//     List<Account> testAccounts = new List<Account>{
//         new Account(Name = 'Test Account 1'),
//         new Account(Name = 'Test Account 2')
//     };
//     List<Database.SaveResult> results = Database.insert (testAccounts, false);
//     List<Contact> testContacts = new List<Contact>{
//         new Contact(LastName = 'Account 1', AccountId = results[0].getId()),
//         new Contact(LastName = 'Account 2',AccountId = results[1].getId()),
//         new Contact(LastName = 'Accountt 2',AccountId = results[1].getId())
//     };
//     insert testContacts;

//     // Call the countContacts method with test data
//     List<Id> listid = new List<Id>();
//     for (Database.SaveResult s : results){
//         listid.add(s.getId());
//     }

//    // System.debug(listid);
//    Test.startTest();
//             AccountProcessor.countContacts(listid);
//             Test.stopTest();
//     // Retrieve updated Account records
//     List<Account> updatedAccounts = [SELECT Id, Number_Of_Contacts__c FROM Account WHERE Id = '001IR00001neTu2YAE'];

//     System.debug(updatedAccounts[0].Number_Of_Contacts__c);

// Http http = new Http();
// HttpRequest request = new HttpRequest();
// request.setEndpoint('https://th-apex-http-callout.herokuapp.com/animals');
// request.setMethod('GET');
// HttpResponse response = http.send(request);
// // If the request is successful, parse the JSON response.
// if(response.getStatusCode() == 200) {
//     // Deserialize the JSON string into collections of primitive data types.
//     Map<String, Object> results = (Map<String, Object>) JSON.deserializeUntyped(response.getBody());
//     // Cast the values in the 'animals' key as a list
//     List<Object> animals = (List<Object>) results.get('animals');
//     System.debug('Received the following animals:');
//     for(Object animal: animals) {
//         System.debug(animal);
//     }
// }

// Http http = new Http();
// HttpRequest request = new HttpRequest();
// request.setEndpoint('https://th-apex-http-callout.herokuapp.com/animals');
// request.setMethod('POST');
// request.setHeader('Content-Type', 'application/json;charset=UTF-8');
// // Set the body as a JSON object
// request.setBody('{"name":"mighty moose"}');
// HttpResponse response = http.send(request);
// // Parse the JSON response
// if(response.getStatusCode() != 201) {
//     System.debug('The status code returned was not expected: ' + response.getStatusCode() + ' ' + response.getStatus());
// } else {
//     System.debug(response.getBody());
// }

//         HttpRequest request = new HttpRequest();
//         request.setMethod('GET');
//         request.setEndpoint('https://th-apex-http-callout.herokuapp.com/animals/1');

//         HttpResponse response = new Http().send(request);
//         Map<String,Object> mmap = (Map<String,Object>)json.deserializeUntyped(response.getBody());
// Object animals = (Object) mmap.get('animal');
//     // for(Object animal: animals) {
//         System.debug(animals);
//    // }

HttpRequest request = new HttpRequest();
request.setMethod('GET');
request.setEndpoint('https://th-apex-http-callout.herokuapp.com/animals');

HttpResponse response = new Http().send(request);

List<String> animalresponse = (List<String>) resultMap.get('animals');
// Map<String, Object> resultMap = (Map<String, Object>) JSON.deserializeUntyped(response.getBody());
// Map<String, Object> animalMap = (Map<String, Object>) resultMap.get('animal');
// Animal animalResponse = (Animal) JSON.deserialize(response.getBody(), Animal.class);
System.debug(animalResponse);

HttpRequest request = new HttpRequest();
request.setMethod('POST');
request.setEndpoint('https://reqres.in/api/users');
request.setBody('{"name":"test", "job":"testing"}');

HttpResponse response = new Http().send(request);
// AnimalList animals = AnimalList.parse(response.getBody());

System.debug(response.getBody());

Integer animals = CatAPICallout.catbreeds().total;
System.debug(System.UserInfo.getSessionId().substring(15));

Map<String, String> sObjectLabelsAndAPINames = new Map<String, String>();
Map<String, Schema.SObjectType> gd = Schema.getGlobalDescribe();
for (String name : gd.keySet()) {
  Schema.SObjectType objType = gd.get(name);
  Schema.DescribeSObjectResult objDescribe = objType.getDescribe();
  String label = objDescribe.getLabel();
  sObjectLabelsAndAPINames.put(label, name);
}

List<String> sObjectAPINames = new List<String>();
Map<String, Schema.SObjectType> gd = Schema.getGlobalDescribe();
for (String name : gd.keySet()) {
  sObjectAPINames.add(name);
}

SObjectType accountType = Schema.getGlobalDescribe().get('Account');
Schema.SObjectTypeFields mfields = accountType.getDescribe().fields;

Map<String, String> options = new Map<String, String>();
for (Schema.SObjectType item1 : Schema.getGlobalDescribe().values()) {
  String name = item1.getDescribe().getName();
  // Exclude all the unwanted Sobjects e.g. CustomSettings, History, Share, Feed, ApexClass, Pages etc..
  if (
    item1.getDescribe().getRecordTypeInfos().size() > 0 &&
    item1.getDescribe().isCreateable() &&
    !name.containsignorecase('history') &&
    !name.containsignorecase('tag') &&
    !name.containsignorecase('share') &&
    !name.containsignorecase('feed')
  ) {
    options.put(item1.getDescribe().getName(), item1.getDescribe().getLabel());
  }
}
options.put('Asset', 'Asset');
System.debug(options.get('Property'));

Schema.DescribeSObjectResult describeResult = Account.sObjectType.getDescribe();
List<Schema.RecordTypeInfo> recordTypeInfos = describeResult.getRecordTypeInfos();
for (Schema.RecordTypeInfo recordTypeInfo : recordTypeInfos) {
  System.debug(recordTypeInfo);
}

Map<String, Schema.SObjectType> gd = Schema.getGlobalDescribe();
System.debug(Account.sObjectType.getDescribe());

Map<String, String> sObjectLabelsAndAPINames = new Map<String, String>();
Map<String, Schema.SObjectType> gd = Schema.getGlobalDescribe();
for (String name : gd.keySet()) {
  if (
    gd.get(name).getDescribe().isCreateable() &&
    gd.get(name).getDescribe().isDeletable() &&
    !gd.get(name).getDescribe().isCustomSetting() &&
    !gd.get(name).getDescribe().isDeprecatedAndHidden() &&
    !name.containsignorecase('history') &&
    !name.containsignorecase('tag') &&
    !name.containsignorecase('share') &&
    !name.containsignorecase('feed') &&
    !name.containsignorecase('role')
  ) {
    Schema.SObjectType objType = gd.get(name);
    Schema.DescribeSObjectResult objDescribe = objType.getDescribe();
    String label = objDescribe.getLabel();
    sObjectLabelsAndAPINames.put(label, name);
  }
}
String a = 'Account';
System.debug(dynamicapex.getSObjectTypeById('a00IR00001vGT8uYAG'));
Hello Apex
DistributedLedgerService;