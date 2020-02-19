package com.zianedu.front.config;

import org.springframework.beans.factory.annotation.Value;

import javax.annotation.PostConstruct;

/**
 * Created by jihoan on 2017. 11. 2..
 */
public class ConfigHolder {

    private static ConfigHolder configHolder;

    @Value("#{config['user.reg.sms.encode.data']}")
    private String userRegSmsEncodeData;
    @Value("#{config['find.id.sms.encode.data']}")
    private String findIdSmsEncodeData;
    @Value("#{config['find.pass.sms.encode.data']}")
    private String findPassSmsEncodeData;

    public static String getUserRegSmsEncodeData() {
        return configHolder.userRegSmsEncodeData;
    }

    public static String getFindIdSmsEncodeData() {
        return configHolder.findIdSmsEncodeData;
    }

    public static String getFindPassSmsEncodeData() {
        return configHolder.findPassSmsEncodeData;
    }

    @PostConstruct
    private ConfigHolder init() {
        configHolder = this;
        return this;
    }

}