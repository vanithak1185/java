#!/bin/sh
SCORE=0

TEST_1=$(mvn validate | grep -io "BUILD SUCCESS" | wc -l);
TEST_2=$(mvn validate | grep -i "echo" | grep -i -e "Hi there, my name is Fresco" -e "My motto is MAVEN is HEAVEN" | wc -l);
TEST_3=$(mvn compile | grep -i "echo" | grep -i -e "Displaying 3 environment variables" -e '\[M2_HOME\] ' -e '\[JAVA PATH\] /usr/lib/jvm' -e '\[Path\] /usr/local/'| wc -l);
TEST_4=$(mvn test | grep -i "echo" | grep -i '\[localRepository\]' | grep -i '.m2/repository'| wc -l);
TEST_5=$(mvn package | grep -i "echo" | grep -i -e '\[groupId\] com.fresco.play' -e '\[artifactId\] maven-display-env-props'| wc -l);

TEST_6=$(grep -i -e "maven-compiler-plugin" -e "exec-maven-plugin" -e "org.apache.maven.plugins" pom.xml | wc -l);
TEST_7=$(grep -i "<phase>" pom.xml | grep -i -e "validate" -e "compile" -e "test" -e "package"| wc -l);

TEST_8=$(grep -i "<echo>" pom.xml | grep -i '\[myname\] \${myname}' | wc -l);
TEST_9=$(grep -i "<echo>" pom.xml | grep -i '\[mymotto\] \${mymotto}' | wc -l);
TEST_10=$(grep -i "<echo>" pom.xml | grep -i '\[M2_HOME\] \${env.M2_HOME}' | wc -l);
TEST_11=$(grep -i "<echo>" pom.xml | grep -i '\[JAVA PATH\] \${env.JAVA_HOME}' | wc -l);
TEST_12=$(grep -i "<echo>" pom.xml | grep -i '\[PATH\] \${env.PATH}' | wc -l);
TEST_13=$(grep -i "<echo>" pom.xml | grep -i '\[localRepository\] \${settings.localRepository}' | wc -l);
TEST_14=$(grep -i "<echo>" pom.xml | grep -i '\[groupId\] \${project.groupId}' | wc -l);
TEST_15=$(grep -i "<echo>" pom.xml | grep -i '\[artifactId\] \${project.artifactId}' | wc -l);


echo "TEST_1=$TEST_1";
echo "TEST_2=$TEST_2";
echo "TEST_3=$TEST_3";
echo "TEST_4=$TEST_4";
echo "TEST_5=$TEST_5";
echo "TEST_6=$TEST_6";
echo "TEST_7=$TEST_7";
echo "TEST_8=$TEST_8";
echo "TEST_9=$TEST_9";
echo "TEST_10=$TEST_10";
echo "TEST_11=$TEST_11";
echo "TEST_12=$TEST_12";
echo "TEST_13=$TEST_13";
echo "TEST_14=$TEST_14";
echo "TEST_15=$TEST_15";


PASS=$(( $TEST_1 + $TEST_2 + $TEST_3 + $TEST_4 + $TEST_5 + $TEST_6 + $TEST_7 + $TEST_8 + $TEST_9 + $TEST_10 + $TEST_11 + $TEST_12 + $TEST_13 + $TEST_14 + $TEST_15));
echo "PASS=$PASS";
SCORE=$(( $PASS * 4 ));
echo "FS_SCORE:$SCORE%" 
