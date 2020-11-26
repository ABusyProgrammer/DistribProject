# Front-End for Distributed Project

## Installation and Setup

### IntelliJ
The installation instructions came from this link: https://youtu.be/29Xp3V3Ip08

1. Install and setup Apache Tomcat 8
2. In IntelliJ, go to Settings -> Build, Execution and Deployment -> Application Servers
3. Click the `+` button and choose Tomcat Server.
4. Specify the tomcat Home (the installation folder of Tomcat that contains the bin, conf, etc... folders).
5. The base directory will automatically be speified as soon as the home directory is specified.
6. Press OK.
7. Clone this project and open it in IntelliJ
8. When you select "Run", you should see the option to run on Apache Tomcat 8.
9. When it is done running, visit http://localhost:PORT/DistribProject_war/welcome.jsp to generate a token and http://localhost:PORT/DistribProject_war/checkoutToken.jsp to checkout the generated token.


### Eclipse:
Follow this tutorial: https://youtu.be/g2b-NbR48Jo , from 9:12 seconds
