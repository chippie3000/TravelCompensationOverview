# TravelCompensationOverview
This small sample application is part of the is part of the application process at Tenzinger.
Create a small application which provides our HR department with a monthly overview of the 
compensation per employee for the current year.

At Medicore we encourage a healthy lifestyle, therefore we encourage our employees to come to work by bike. If you would commute by bike you
will get a compensation of € 0,50 per km per day. For distances between 5 to 10 km the compensation will even double! However, for distances
over 10 km employees prefer a different way of commuting.
Some employees commute by bus or train, for which the compensation is € 0,25 per km per day. If you would commute by car the compensation
would be € 0,10 per km per day.
Most employees work 5 days a week, however some less.

This sample applications has it's scope and limitations:
- Database used: MySQL database.
- WampServer was used to test this application on a local machine.
- With this application you can not only export a csv containing an overview of the compensation per employeee per month for a particular year, 
but you can also use the filters available to export only data from specific 'roles' or a particular year
- The filter 'Employees' has not been implemented yet!
- The filter 'Year' is currently required and only single select is possible
- The filter 'Roles' is not required and you can select multiple roles. When no roles is selected, all available roles are taken into account 
when exporting the overview
- The exported file is a csv comma seperated file, which you can download.
- At the start of the application, a list of roles and the available years are retrieved from the database into the application.
- While the list of roles and available years of data to export is being retrieved from the database, there is a loading gif on the page.
This will be removed and the form will be put into it's place after the lists has been loaded succesfully.
This data is loaded using the file 'loadData.php'
- There is also the file 'getTravelCompensationHistory.php'. Contains the php code which will retrieve the overview and create the csv file 
and put it available for download. 
- To import the data into your database use the file 'companydb.sql'
- The database also contains an event which will automatically calculate the compensation amounts at the beginning of each month, based on 
the current travel information of the employee. You might noticed not all employees started working at the same time. Also some employees moved 
to a new place during the years so the travel distance differs, the transport option (Bike or car etc ) might also be different.

