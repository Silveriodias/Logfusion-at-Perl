# logfusion-at-perl
This application is the result from a master degree work, aims to automate the treatment of specific fields and later convert to a structure that can be interpreted through a browser, in order to facilitate the analysis and interpretation of this type of messages. This application is developed in perl, and aims to assist in the pre-processing and fusion of operating system logs and it's divided in two scripts:

1."pre-precessing application": Allows you to filter n fields from the logs in just six. By default, the confg.txt file filters the logs in the fields Datetime, Source, Level, Source Computer, User, Serverity, Event ID, Description, Process ID, Thread ID.
Requirements for using:
- Run the application on a virtual machine with Ubuntu operating system;
- The logs must be saved in a text file with the following requirements:
	- All logs must be on a single line;
	- All logs must belong to a single service and level.
	- A directory dedicated to the storage of meta-logs;
	- The application that aggregates the meta-logs, must be within the directory defined above.

Run the application: ./<application_anme> <confg.txt> <original_log_file> <meta-log_name.txt>

2."fusion application": Lets you add meta-logs (result of previous application) and transforms them into an XML file.
Requirements for using:
- All meta-logs (text file) that resulted from the "pre-precessing application", must be on the same board as the "fusion application".

Run the application:./<aplication_name> <meta-logs_directory> <template.xml>

Note: The files (logs_metalogs.txt and logs_template.txt) that hold the error messages when running the applications, must be in the respective directory for each application.

The team behind the project
Carolina Dias - 2182646@my.ipleiria.pt
Master Student in Cybersecurity and Computer Forensics at Polytechnic Institute of Leiria (IPL), School of Technology and Management (ESTG) and I'm Datacenter Transformation Consultant at Unipartner IT Services.

Mário Antunes - mario.antunes@ipleiria.pt
Master Coordinator in Cybersecurity and Computer Forensics and professor at Polytechnic Institute of Leiria (IPL), School of Technology and Management (ESTG), Department of Computer Engineering (DEI).
