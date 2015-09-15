<project xmlns="http://maven.apache.org/POM/4.0.0" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
	xsi:schemaLocation="http://maven.apache.org/POM/4.0.0 http://maven.apache.org/maven-v4_0_0.xsd">
	<modelVersion>4.0.0</modelVersion>
	<groupId>com.provac.eba</groupId>
	<artifactId>EBA</artifactId>
	<packaging>war</packaging>
	<version>0.0.1-SNAPSHOT</version>
	<name>EBA</name>
	<url>http://maven.apache.org</url>

	<build>
		<sourceDirectory>src</sourceDirectory>
		<finalName>EBA</finalName>
		<plugins>
			<plugin>
				<artifactId>maven-compiler-plugin</artifactId>
				<version>3.1</version>
				<configuration>
					<source>1.7</source>
					<target>1.7</target>
				</configuration>
			</plugin>
		</plugins>
	</build>

	<properties>
		<java.version>1.7</java.version>
		<spring.version>4.0.3.RELEASE</spring.version>
		<spring.security.version>3.2.3.RELEASE</spring.security.version>
		<tiles.version>3.0.1</tiles.version>
		<cxf.version>3.0.4</cxf.version>
		<quartz.version>2.2.1</quartz.version>


	</properties>

	<dependencies>

		<!-- JUnit testing framework -->
		<dependency>
			<groupId>junit</groupId>
			<artifactId>junit</artifactId>
			<version>4.12</version>
		</dependency>

		<dependency>
			<groupId>org.springframework</groupId>
			<artifactId>spring-test</artifactId>
			<version>4.1.4.RELEASE</version>
		</dependency>

		<dependency>
			<groupId>org.springframework</groupId>
			<artifactId>spring-web</artifactId>
			<version>${spring.version}</version>
		</dependency>

		<dependency>
			<groupId>org.springframework</groupId>
			<artifactId>spring-webmvc</artifactId>
			<version>${spring.version}</version>
		</dependency>

		<dependency>
			<groupId>org.springframework</groupId>
			<artifactId>spring-orm</artifactId>
			<version>${spring.version}</version>
		</dependency>

		<!--Spring quartz -->
		<dependency>
			<groupId>org.springframework</groupId>
			<artifactId>spring-core</artifactId>
			<version>${spring.version}</version>
		</dependency>

		<dependency>
			<groupId>org.springframework</groupId>
			<artifactId>spring-context-support</artifactId>
			<version>${spring.version}</version>
		</dependency>


		<!-- Transaction dependency is required with Quartz integration -->
		<dependency>
			<groupId>org.springframework</groupId>
			<artifactId>spring-tx</artifactId>
			<version>${spring.version}</version>
		</dependency>

		<!-- Quartz framework -->
		<dependency>
			<groupId>org.quartz-scheduler</groupId>
			<artifactId>quartz</artifactId>
			<version>${quartz.version}</version>
		</dependency>


		<dependency>
			<groupId>javax.servlet</groupId>
			<artifactId>jstl</artifactId>
			<version>1.2</version>
		</dependency>

		<!-- Hibernate 4 -->
		<dependency>
			<groupId>org.hibernate</groupId>
			<artifactId>hibernate-core</artifactId>
			<version>4.3.5.Final</version>
			<exclusions>
				<exclusion>
					<artifactId>xml-apis</artifactId>
					<groupId>xml-apis</groupId>
				</exclusion>
				<!-- Se excluye el JAR para weblogic -->
				<exclusion>
					<artifactId>hibernate-jpa-2.1-api</artifactId>
					<groupId>org.hibernate.javax.persistence</groupId>
				</exclusion>

			</exclusions>

		</dependency>
	<!-- Se excluye el JAR para pruebas JUNIT colo para weblogic-->
		<dependency>
			<groupId>org.hibernate.javax.persistence</groupId>
			<artifactId>hibernate-jpa-2.1-api</artifactId>
			<version>1.0.0.Final</version>
			<scope>provided</scope>
		</dependency>
		
		<dependency>
			<groupId>org.slf4j</groupId>
			<artifactId>slf4j-log4j12</artifactId>
			<version>1.6.6</version>
		</dependency>

		<!-- Apache Commons IO -->
		<dependency>
			<groupId>commons-io</groupId>
			<artifactId>commons-io</artifactId>
			<version>2.4</version>
		</dependency>

		<dependency>
			<groupId>javax.servlet</groupId>
			<artifactId>javax.servlet-api</artifactId>
			<version>3.0.1</version>
			<scope>provided</scope>
		</dependency>



		<dependency>
			<groupId>javax.servlet.jsp</groupId>
			<artifactId>jsp-api</artifactId>
			<version>2.1</version>
			<scope>provided</scope>
		</dependency>


		<!-- log AOP -->

		<dependency>
			<groupId>log4j</groupId>
			<artifactId>log4j</artifactId>
			<version>1.2.14</version>
		</dependency>

		<dependency>
			<groupId>org.springframework</groupId>
			<artifactId>spring-aop</artifactId>
			<version>${spring.version}</version>
		</dependency>

		<dependency>
			<groupId>org.aspectj</groupId>
			<artifactId>aspectjrt</artifactId>
			<version>1.6.11</version>
		</dependency>

		<dependency>
			<groupId>org.aspectj</groupId>
			<artifactId>aspectjweaver</artifactId>
			<version>1.6.11</version>
		</dependency>

		<dependency>
			<groupId>cglib</groupId>
			<artifactId>cglib</artifactId>
			<version>2.2</version>
		</dependency>

		<!-- oracle <dependency> <groupId>com.oracle</groupId> <artifactId>ojdbc14</artifactId> 
			<version>10.2.0.2</version> </dependency> -->

		<!-- <dependency> <groupId>com.oracle</groupId> <artifactId>ojdbc6</artifactId> 
			<version>11.2.0</version> </dependency> -->
		<dependency>
			<groupId>com.oracle</groupId>
			<artifactId>ojdbc14</artifactId>
			<version>10.2.0.2</version>
		</dependency>

		<dependency>
			<groupId>com.microsoft.sqlserver</groupId>
			<artifactId>sqljdbc41</artifactId>
			<version>4.1.0</version>
		</dependency>


		<!-- Webservices jax-ws / apache cxf -->
		<dependency>
			<groupId>org.apache.cxf</groupId>
			<artifactId>cxf-rt-frontend-jaxws</artifactId>
			<version>${cxf.version}</version>
		</dependency>

		<dependency>
			<groupId>org.apache.cxf</groupId>
			<artifactId>cxf-rt-transports-http</artifactId>
			<version>${cxf.version}</version>
		</dependency>

		<dependency>
			<groupId>org.apache.cxf</groupId>
			<artifactId>cxf-rt-bindings-soap</artifactId>
			<version>${cxf.version}</version>
		</dependency>

		<!-- XML -->
		<dependency>
			<groupId>jdom</groupId>
			<artifactId>jdom</artifactId>
			<version>1.1</version>
		</dependency>

		<!-- Alfresco -->
		<dependency>
			<groupId>backport-util-concurrent</groupId>
			<artifactId>backport-util-concurrent-java12</artifactId>
			<version>3.1</version>
		</dependency>

		<dependency>
			<groupId>commons-beanutils</groupId>
			<artifactId>commons-beanutils-core</artifactId>
			<version>1.8.3</version>
		</dependency>

		<dependency>
			<groupId>commons-codec</groupId>
			<artifactId>commons-codec</artifactId>
			<version>20041127.091804</version>
		</dependency>

		<dependency>
			<groupId>org.apache.directory.studio</groupId>
			<artifactId>org.apache.commons.collections</artifactId>
			<version>3.2.1</version>
		</dependency>

		<dependency>
			<groupId>org.daisy.libs</groupId>
			<artifactId>commons-httpclient</artifactId>
			<version>3.1.0</version>
		</dependency>

		<dependency>
			<groupId>commons-logging</groupId>
			<artifactId>commons-logging-api</artifactId>
			<version>1.1</version>
		</dependency>

		<dependency>
			<groupId>org.jdom</groupId>
			<artifactId>jaxen-jdom</artifactId>
			<version>1.0-FCS</version>
		</dependency>

		<dependency>
			<groupId>jaxen</groupId>
			<artifactId>jaxen</artifactId>
			<version>1.1.6</version>
		</dependency>

		<dependency>
			<groupId>net.sf.ehcache</groupId>
			<artifactId>ehcache</artifactId>
			<version>1.5.0</version>
		</dependency>

		<dependency>
			<groupId>corporate</groupId>
			<artifactId>com.posadas.portal.util.DAOUtils</artifactId>
			<version>1.0</version>
			<scope>system</scope>
			<systemPath>${project.basedir}/lib/corporateCommons.jar</systemPath>
		</dependency>


		<!-- PLANTILLAS -->

		<dependency>
			<groupId>org.apache.velocity</groupId>
			<artifactId>velocity</artifactId>
			<version>1.7</version>
		</dependency>


	</dependencies>

</project>
