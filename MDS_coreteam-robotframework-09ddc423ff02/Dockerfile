FROM ubuntu
RUN apt update
RUN apt install python3 -y
RUN apt install python3-pip -y
RUN pip install robotframework==4.0b1
RUN pip install robotframework-seleniumtestability==2.0.0
RUN pip install robotframework-seleniumlibrary==5.1.3
RUN pip install selenium==4.2.0
RUN apt install curl -y
RUN apt install wget
RUN apt install docker.io -y
RUN apt install docker-compose -y
RUN apt-get update && apt-get install -y \
    software-properties-common \
    unzip \
    curl \
    wget \
    xvfb
RUN pip install virtualenvwrapper
RUN apt-get install -y libglib2.0-dev
RUN apt-get install -y libconfig-dev
RUN apt-get install -y libnss3
RUN apt-get install -y libfontconfig1-dev

# Install Selenium. Do I Need Selenium-server if I have installed selenium to Ubuntu???!!!
RUN wget -N http://selenium-release.storage.googleapis.com/3.0/selenium-server-standalone-3.0.1.jar -P ~/
RUN mv -f ~/selenium-server-standalone-3.0.1.jar /usr/local/share/
RUN chmod +x /usr/local/share/selenium-server-standalone-3.0.1.jar
RUN ln -s /usr/local/share/selenium-server-standalone-3.0.1.jar /usr/local/bin/selenium-server-standalone-3.0.1.jar

#Install Chrome
RUN wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
RUN apt install ./google-chrome-stable_current_amd64.deb -y

#InstallChrome Driver
WORKDIR /usr/local/bin
#ARG Driver_Version=108
RUN wget https://chromedriver.storage.googleapis.com/108.0.5359.71/chromedriver_linux64.zip
RUN unzip chromedriver_linux64.zip
WORKDIR /root
RUN mkdir newdir
WORKDIR newdir
COPY ./MyDocSafe ./MyDocSafe
WORKDIR MyDocSafe
WORKDIR Test_Suite
#RUN pip install rpaframework-dialogs
RUN python3 -m robot --outputdir ../Reports -v Environment:https://app-staging.mydocsafe.com/signin -v Browser:headlesschrome -v Email_address:mydocsafetest50+QA_staging@gmail.com -v Password:RobotFramework2! Testcases.robot;