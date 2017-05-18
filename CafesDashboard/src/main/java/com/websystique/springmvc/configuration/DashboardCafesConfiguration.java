package com.websystique.springmvc.configuration;

import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.util.Date;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.MessageSource;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.support.ResourceBundleMessageSource;
import org.springframework.scheduling.annotation.EnableScheduling;
import org.springframework.web.multipart.commons.CommonsMultipartResolver;
import org.springframework.web.servlet.config.annotation.DefaultServletHandlerConfigurer;
import org.springframework.web.servlet.config.annotation.EnableWebMvc;
import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry;
import org.springframework.web.servlet.config.annotation.ViewResolverRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurerAdapter;
import org.springframework.web.servlet.view.InternalResourceViewResolver;
import org.springframework.web.servlet.view.JstlView;

import com.websystique.springmvc.pojos.City;
import com.websystique.springmvc.pojos.Country;
import com.websystique.springmvc.pojos.Role;
import com.websystique.springmvc.pojos.Status;
import com.websystique.springmvc.pojos.User;
import com.websystique.springmvc.repositories.UsersRepository;
import com.websystique.springmvc.services.UsersService;
import com.websystique.springmvc.statics.Utilities;

@Configuration
@EnableWebMvc
@EnableScheduling
@ComponentScan(basePackages = "com.websystique.springmvc")
public class DashboardCafesConfiguration extends WebMvcConfigurerAdapter {

    @Autowired
    private UsersRepository usersRepository;
    @Autowired
    private UsersService usersService;

    @Override
    public void configureViewResolvers(ViewResolverRegistry registry) {
	InternalResourceViewResolver viewResolver = new InternalResourceViewResolver();
	viewResolver.setViewClass(JstlView.class);
	viewResolver.setPrefix("/static/views/");
	viewResolver.setSuffix(".jsp");
	registry.viewResolver(viewResolver);
    }

    @Bean
    public CommonsMultipartResolver multipartResolver() {
	System.out.println("multipart resolver");
	CommonsMultipartResolver resolver = new CommonsMultipartResolver();
	resolver.setDefaultEncoding("utf-8");
	// System.out.println(new Date());
	// User user = usersRepository.checkEmailExisted("admin@admin.com");
	// System.out.println(new Date());
	// if (user == null) {
	// user = new User();
	// fillAdd(user);
	// usersRepository.save(user);
	// }

	return resolver;
    }

    @Override
    public void addResourceHandlers(ResourceHandlerRegistry registry) {
	registry.addResourceHandler("/static/**").addResourceLocations("/static/");
    }

    @Override
    public void configureDefaultServletHandling(DefaultServletHandlerConfigurer configurer) {
	configurer.enable();
    }

    @Bean
    public MessageSource messageSource() {
	ResourceBundleMessageSource messageSource = new ResourceBundleMessageSource();
	messageSource.setBasename("messages");
	return messageSource;
    }

    private void fillAdd(User saviour) {

	// fill basic related Data
	saviour.setCreatedAt(new Date());
	try {
	    fillBasicData(saviour);
	} catch (NoSuchAlgorithmException e) {
	    e.printStackTrace();
	}
	// ====== assign uuid to user=========
	String userUUID = "";
	boolean userUUIDChecker = true;
	if (usersService.getAllData() == null) {
	    userUUID = Utilities.generateRandomUUID();
	} else {
	    do {
		userUUID = Utilities.generateRandomUUID();
		User exited = usersRepository.checkExistanceOfUUID(userUUID);
		if (exited != null)
		    userUUIDChecker = false;
		else if (exited == null)
		    userUUIDChecker = true;
	    } while (!userUUIDChecker);
	}
	saviour.setUuid(userUUID);
    }

    private void fillBasicData(User saviour) throws NoSuchAlgorithmException {
	saviour.setUpdatedAt(new Date());
	saviour.setIsDeleted(Byte.valueOf("0"));
	// fill extra new data
	saviour.setAddress("basic address");
	saviour.setBirthdate(new Date());
	City c = new City();
	c.setId(1);
	saviour.setCity(c);
	Country co = new Country();
	co.setId(1);
	saviour.setCountry(co);
	saviour.setEmail("admin@admin.com");
	saviour.setFName("admin");
	saviour.setLName("admin");
	saviour.setGender("M");
	// ======assign role to user====
	Role roleN = new Role();
	roleN.setId(1);
	saviour.setRole(roleN);

	// ====== assign status to user===
	Status status = new Status();
	status.setId(1);
	saviour.setStatus(status);
	// ========password=============
	MessageDigest md = MessageDigest.getInstance("MD5");
	md.update("admin1234".getBytes());
	byte byteData[] = md.digest();
	StringBuffer sb = new StringBuffer();
	for (int i = 0; i < byteData.length; i++) {
	    sb.append(Integer.toString((byteData[i] & 0xff) + 0x100, 16).substring(1));
	}
	saviour.setPassword(sb.toString());

	saviour.setBranch(null);

    }

}