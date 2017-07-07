package com.hai.util;

import javax.jms.Destination;
import javax.jms.JMSException;
import javax.jms.Message;
import javax.jms.Session;

import org.quartz.JobExecutionContext;
import org.quartz.JobExecutionException;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.jms.core.JmsTemplate;
import org.springframework.jms.core.MessageCreator;
import org.springframework.scheduling.quartz.QuartzJobBean;

public class Producers extends QuartzJobBean{

    /**
     * @param args
     * jmsTemplate和destination都是在spring配置文件中进行配制的
     * Sender只使用了配置文件中的jmsFactory，jmsTemplate，还有destination这三个属性
     */
	static ApplicationContext applicationContext = new ClassPathXmlApplicationContext("applicationContext-mq.xml");
	
    public static void main(String[] args) {
    	
    	
        JmsTemplate template = (JmsTemplate) applicationContext.getBean("jmsTemplate");
        Destination destination = (Destination) applicationContext.getBean("destination");
        template.send(destination, new MessageCreator() {
            public Message createMessage(Session session) throws JMSException {
                return session.createTextMessage("发送消息：你好，温东东！");
            }
        });
        System.out.println("成功发送了一条JMS消息");
        
        
    }
    
    


@Override
	protected void executeInternal(JobExecutionContext arg0) throws JobExecutionException {
		// TODO Auto-generated method stub
//		ApplicationContext applicationContext = new ClassPathXmlApplicationContext("applicationContext-mq.xml");
		JmsTemplate template = (JmsTemplate) applicationContext.getBean("jmsTemplate");
		Destination destination = (Destination) applicationContext.getBean("destination");
		template.send(destination, new MessageCreator() {
			public Message createMessage(Session session) throws JMSException {
				return session.createTextMessage("发送消息：Hello ActiveMQ Text Message2！");
			}
		});
//		logger.info("成功发送了一条JMS消息");
		System.out.println("成功发送了一条JMS消息");
	}



    
}
;