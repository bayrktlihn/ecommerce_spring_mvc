package com.bayrktlihn.config;

import java.beans.PropertyVetoException;
import java.util.Properties;

import javax.sql.DataSource;

import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.PropertySource;
import org.springframework.core.env.Environment;
import org.springframework.orm.hibernate5.HibernateTransactionManager;
import org.springframework.orm.hibernate5.LocalSessionFactoryBean;
import org.springframework.transaction.annotation.EnableTransactionManagement;
import org.springframework.web.multipart.commons.CommonsMultipartResolver;
import org.springframework.web.servlet.config.annotation.EnableWebMvc;
import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry;
import org.springframework.web.servlet.config.annotation.ViewResolverRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

import com.mchange.v2.c3p0.ComboPooledDataSource;

@Configuration
@EnableWebMvc
@EnableTransactionManagement
@ComponentScan("com.bayrktlihn")
@PropertySource({ "classpath:persistence-mysql.properties" })
public class WebConfig implements WebMvcConfigurer {

	@Autowired
	private Environment environment;

	@Override
	public void addResourceHandlers(ResourceHandlerRegistry registry) {
		registry.addResourceHandler("/js/**").addResourceLocations("/WEB-INF/resources/js/");
		registry.addResourceHandler("/css/**").addResourceLocations("/WEB-INF/resources/css/");
		registry.addResourceHandler("/img/**").addResourceLocations("/WEB-INF/resources/img/");

	}

	@Override
	public void configureViewResolvers(ViewResolverRegistry registry) {
		registry.jsp("/WEB-INF/views/", ".jsp");
	}

	@Bean
	public DataSource dataSource() {
		ComboPooledDataSource dataSource = new ComboPooledDataSource();

		try {
			dataSource.setDriverClass(environment.getProperty("jdbc.driver"));
		} catch (PropertyVetoException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		dataSource.setUser(environment.getProperty("jdbc.user"));
		dataSource.setPassword(environment.getProperty("jdbc.password"));
		dataSource.setJdbcUrl(environment.getProperty("jdbc.url"));

		dataSource.setInitialPoolSize(getIntProperty("connection.pool.initialPoolSize"));
		dataSource.setMinPoolSize(getIntProperty("connection.pool.minPoolSize"));
		dataSource.setMaxPoolSize(getIntProperty("connection.pool.maxPoolSize"));
		dataSource.setMaxIdleTime(getIntProperty("connection.pool.maxIdleTime"));

		return dataSource;
	}

	@Bean
	public LocalSessionFactoryBean sessionFactory() {
		LocalSessionFactoryBean sessionFactory = new LocalSessionFactoryBean();

		sessionFactory.setDataSource(dataSource());
		sessionFactory.setHibernateProperties(getHibernateProperties());
		sessionFactory.setPackagesToScan(environment.getProperty("hibernate.packagesToScan"));

		return sessionFactory;
	}

	@Bean
	@Autowired
	public HibernateTransactionManager transactionManager(SessionFactory sessionFactory) {

		HibernateTransactionManager transactionManager = new HibernateTransactionManager();

		transactionManager.setSessionFactory(sessionFactory);

		return transactionManager;
	}

	@Bean
	public CommonsMultipartResolver multipartResolver() {
		CommonsMultipartResolver commonsMultipartResolver = new CommonsMultipartResolver();

		return commonsMultipartResolver;
	}

	private Properties getHibernateProperties() {
		Properties properties = new Properties();
		properties.put("hibernate.show_sql", environment.getProperty("hibernate.show_sql"));
		properties.put("hibernate.dialect", environment.getProperty("hibernate.dialect"));
		properties.put("hibernate.hbm2ddl.auto", environment.getProperty("hibernate.hbm2ddl.auto"));
		properties.setProperty("hibernate.format_sql", environment.getProperty("hibernate.format_sql"));

		return properties;
	}

	private int getIntProperty(String key) {
		return Integer.parseInt(environment.getProperty(key));
	}

}
