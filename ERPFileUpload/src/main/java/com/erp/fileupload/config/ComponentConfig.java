
package com.erp.fileupload.config;

import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.PropertySource;

@Configuration
@ComponentScan(basePackages = {
    "com.erp.fileupload.model",
    "com.erp.fileupload.dao",
    "com.erp.fileupload.utils"})
@PropertySource("classpath:fileUpload.properties")
public class ComponentConfig {

}